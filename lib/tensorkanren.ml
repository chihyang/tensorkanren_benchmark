(* #require "owl-top" *)
(* #require "msat" *)
(* #require "msat.sat" *)
(* #require "msat.tseitin" *)

module Sat = Msat_sat
module E = Sat.Int_lit
module F = Msat_tseitin.Make(E)

open Owl

module TK = struct

  (* TYPES *)

  (* variable types *)
  type adt =
  | Unit
  | Sum of adt * adt
  | Prod of adt * adt

  (* value types, used for output *)
  type adv =
  | Sole
  | Left of adv
  | Right of adv
  | Pair of adv * adv

  (* variable is a DeBruijn index with a type *)
  type var = int * adt

  (* expression *)
  type 'elt tk =
  | Succeed
  | Fail
  | Conj of 'elt tk * 'elt tk
  | Disj of 'elt tk * 'elt tk
  | Fresh of adt * 'elt tk
  | Rel of string * (var list)
  | Eqo of var * var
  | Neqo of var * var
  | Soleo of var
  | Lefto of var * var (* a + b, a *)
  | Righto of var * var (* a + b, b *)
  | Pairo of var * var * var (* a * b, a, b *)
  | Factor of 'elt

  (* relation *)
  type 'elt rel = {
    name: string;
    args: adt list;
    body: 'elt tk;
  }

  (* program *)
  type 'elt tk_prgm = 'elt rel list

  (* MACROS *)

  (* bool type and values *)
  let bool_adt = Sum (Unit, Unit)
  let true_adv = Left Sole
  let false_adv = Right Sole

  (* relations on bool types *)
  let trueo (v, vt) =
    Fresh (Unit,
      Conj (
        Lefto ((v + 1, vt), (0, Unit)),
        Soleo (0, Unit)))

  let falseo (v, vt) =
    Fresh (Unit,
      Conj (
        Righto ((v + 1, vt), (0, Unit)),
        Soleo (0, Unit)))

  (* conjunction of a list *)
  let rec conj (tks : 'elt tk list) : 'elt tk =
    match tks with
    | [] -> Succeed
    | a :: d -> Conj (a, (conj d))

  (* disjunction of a list *)
  let rec disj (tks : 'elt tk list) : 'elt tk =
    match tks with
    | [] -> Fail
    | a :: d -> Disj (a, (disj d))

  (* check that a variable has a set value *)
  let rec var_has_val (vr : var) (vl : adv) =
    let vv, vt = vr in
    match vt, vl with
    | Unit, Sole -> Soleo vr
    | Sum (lt, _rt), Left lv ->
        Fresh (lt, Conj (Lefto ((vv + 1, vt), (0, lt)), var_has_val (0, lt) lv))
    | Sum (_lt, rt), Right rv ->
        Fresh (rt, Conj (Righto ((vv + 1, vt), (0, rt)), var_has_val (0, rt) rv))
    | Prod (lt, rt), Pair (lv, rv) ->
        Fresh (lt,
          Fresh (rt,
            Conj (
              Pairo ((vv + 2, vt), (1, lt), (0, rt)),
              Conj (
                var_has_val (1, lt) lv,
                var_has_val (0, rt) rv))))
    | _ -> invalid_arg "Variable type does not match value type!"

  (* check that a variable avoids a set value *)
  (* boils down to swapping left and right at highest points possible *)
  (* only works for types that contain a sum type *)
  let rec var_avoids_val (vr : var) (vl : adv) =
    let vv, vt = vr in
    match vt, vl with
    | Unit, Sole -> Fail
    | Sum (lt, rt), Left lv ->
        Disj (
          Fresh (lt, (* either value is avoided deeper in type *)
            Conj (
              Lefto ((vv + 1, vt), (0, lt)),
              var_avoids_val (0, lt) lv)),
          Fresh (rt, (* or value is avoided here *)
            Righto ((vv + 1, vt), (0, rt))))
    | Sum (lt, rt), Right rv ->
        Disj (
          Fresh (lt, (* either value is avoided here *)
            Lefto ((vv + 1, vt), (0, lt))),
          Fresh (rt,
            Conj (
              Righto ((vv + 1, vt), (0, rt)),
              var_avoids_val (0, rt) rv)))
    | Prod (lt, rt), Pair (lv, rv) ->
        Fresh (lt,
          Fresh (rt,
            Conj (
              Pairo ((vv + 2, vt), (1, lt), (0, rt)),
              Disj ( (* as long as value is avoided at least once deeper, we're good *)
                var_avoids_val (1, lt) lv,
                var_avoids_val (0, rt) rv))))
    | _, _ -> invalid_arg  "Var has improperly compiled type!"

  (* sum type corresponding to nats with s as the max value *)
  let rec nat_adt s =
    match s with
    | 1 -> Unit
    | m -> Sum (Unit, nat_adt (m - 1))

  (* construct value of nat n corresponding to nat_adt s *)
  let rec nat_adv s n =
    if n = 0 then
      if s = 1 then
        Sole (* built up enough successors already *)
      else
        Left Sole
    else
      Right (nat_adv (s - 1) (n - 1))

  (* prod of bools corresponding to nats with s as near-max value *)
  (* min value for s is 2 *)
  let rec bin_adt s =
    match s with
    | 1 -> bool_adt (* handle non-power-of-2 args *)
    | 2 -> bool_adt
    | m -> Prod (bool_adt, bin_adt (m / 2))

  (* construct value of nat n corresponding to bin_adt s *)
  (* big endian, so cleanly maps to unary *)
  let rec bin_adv_help s n acc =
    if s = 1 then
      acc
    else
      if (n mod 2 = 0) then
        bin_adv_help (s / 2) (n / 2) (Pair (true_adv, acc))
      else
        bin_adv_help (s / 2) (n / 2) (Pair (false_adv, acc))

  let bin_adv s n =
    let rightbit = if (n mod 2) = 0 then true_adv else false_adv in
    bin_adv_help (s / 2) (n / 2) rightbit

  (* HELPER FUNCTIONS *)

  (* size of an adt *)
  let rec adt_size (t : adt) : int =
    match t with
    | Unit -> 1
    | Sum (x, y) -> (adt_size x) + (adt_size y)
    | Prod (x, y) -> (adt_size x) * (adt_size y)

  (* size of a list of adts *)
  let env_size env =
    List.fold_left
      (fun acc x -> acc + (adt_size x))
      0
      env

  (* COMPILING ADTS TO BITSTRINGS *)

  let rec compile_adt (t : adt) : adt =
    match t with
    | Unit -> Unit
    | Sum (Unit, Unit) -> Sum (Unit, Unit) (* bools still allowed *)
    | Sum (x, y) ->
        let xc = compile_adt x in
        let yc = compile_adt y in
        let c = if (adt_size xc) > (adt_size yc) then xc else yc in (* find bigger type *)
        Prod (bool_adt, c) (* put a tag in front of it *)
    | Prod (x, y) -> Prod (compile_adt x, compile_adt y)

  let compile_var (v, vt) = (v, compile_adt vt)

  (* variable (of compiled type) and original type, ensures only inhabits valid values *)
  let rec enforce_var_type (v : var) (ot : adt) =
    let vv, vt = v in
    match vt, ot with
    | Unit, Unit -> Succeed
    | Sum (Unit, Unit), Sum (Unit, Unit) -> Succeed
    | Sum (Unit, Unit), Unit -> trueo v
    | Prod (Sum (Unit, Unit), wt), Sum (at, bt) ->
        Fresh (bool_adt,
          Fresh (wt,
            Conj (
              Pairo ((vv + 2, vt), (1, bool_adt), (0, wt)),
              Disj (
                Conj (
                  trueo (1, bool_adt),
                  enforce_var_type (0, wt) at),
                Conj (
                  falseo (1, bool_adt),
                  enforce_var_type (0, wt) bt)))))
    | Prod (xt, yt), Unit ->
        Fresh (xt,
          Fresh (yt,
            Conj (
              Pairo ((vv + 2, vt), (1, xt), (0, yt)),
              Conj (
                enforce_var_type (1, xt) Unit,
                enforce_var_type (0, yt) Unit))))
    | Prod (xt, yt), Prod (at, bt) ->
        Fresh (xt,
          Fresh (yt,
            Conj (
              Pairo ((vv + 2, vt), (1, xt), (0, yt)),
              Conj (
                enforce_var_type (1, xt) at,
                enforce_var_type (0, yt) bt))))
    | _ -> invalid_arg "Var has improperly compiled type!"

  (* assumes both source and target are (potentially different) compiled versions *)
  (* generates code so that they both hold the same value *)
  (* unifying with Unit doesn't require a variable, so use -1 dummy variable. shouldn't make it to output *)
  (* not 100% sure of correctness for cases when unifying bool with prod *)
  let rec coerced_unify (x : var) (y : var) : 'elt tk =
    let xv, xt = x in
    let yv, yt = y in
    match xt, yt with
    | Unit, Unit -> Succeed
    | Unit, Sum (Unit, Unit) -> trueo y
    | Unit, Prod (yat, ydt) ->
        Fresh (yat,
          Fresh (ydt,
            Conj (
              Pairo ((yv + 2, yt), (1, yat), (0, ydt)),
              Conj (
                coerced_unify (-1, Unit) (1, yat),
                coerced_unify (-1, Unit) (0, ydt)))))
    | Sum (Unit, Unit), Unit -> trueo x
    | Sum (Unit, Unit), Sum (Unit, Unit) -> Eqo (x, y)
    | Sum (Unit, Unit), Prod (yat, ydt) ->
        if adt_size yat > 1 then
          Fresh (yat,
            Fresh (ydt,
              Conj (
                Pairo ((yv + 2, yt), (1, yat), (0, ydt)),
                Conj (
                  coerced_unify (xv + 2, xt) (1, yat),
                  coerced_unify (-1, Unit) (0, ydt)))))
        else
          Fresh (yat,
            Fresh (ydt,
              Conj (
                Pairo ((yv + 2, yt), (1, yat), (0, ydt)),
                Conj (
                  coerced_unify (-1, Unit) (1, yat),
                  coerced_unify (xv + 2, xt) (0, ydt)))))
    | Prod (xat, xdt), Unit ->
        Fresh (xat,
          Fresh (xdt,
            Conj (
              Pairo ((xv + 2, xt), (1, xat), (0, xdt)),
              Conj (
                coerced_unify (1, xat) (-1, Unit),
                coerced_unify (0, xdt) (-1, Unit)))))
    | Prod (xat, xdt), Sum (Unit, Unit) ->
        if adt_size xat > 1 then
          Fresh (xat,
            Fresh (xdt,
              Conj (
                Pairo ((xv + 2, xt), (1, xat), (0, xdt)),
                Conj (
                  coerced_unify (1, xat) (yv + 2, yt),
                  coerced_unify (0, xdt) (-1, Unit)))))
        else
          Fresh (xat,
            Fresh (xdt,
              Conj (
                Pairo ((xv + 2, xt), (1, xat), (0, xdt)),
                Conj (
                  coerced_unify (1, xat) (-1, Unit),
                  coerced_unify (0, xdt) (yv + 2, yt)))))
    | Prod (xat, xdt), Prod (yat, ydt) ->
        Fresh (xat,
          Fresh (xdt,
            Fresh (yat,
              Fresh (ydt,
                Conj (
                  Conj (
                    Pairo ((xv + 4, xt), (3, xat), (2, xdt)),
                    Pairo ((yv + 4, yt), (1, yat), (0, ydt))),
                  Conj (
                    coerced_unify (3, xat) (1, yat),
                    coerced_unify (2, xdt) (0, ydt)))))))
    | _, _ -> invalid_arg "Impossible case!"

  let rec compile_tk (e : 'elt tk) : 'elt tk =
    match e with
    | Succeed -> Succeed
    | Fail -> Fail
    | Conj (a, b) -> Conj (compile_tk a, compile_tk b)
    | Disj (a, b) -> Disj (compile_tk a, compile_tk b)
    | Fresh (t, exp) ->
        Fresh (compile_adt t,
          Conj (
            enforce_var_type (0, compile_adt t) t,
            compile_tk exp))
    | Rel (name, args) ->
        Rel (name,
          List.map (fun (v, vt) -> (v, compile_adt vt)) args)
    | Eqo (a, b) -> Eqo (compile_var a, compile_var b)
    | Neqo (a, b) -> Neqo (compile_var a, compile_var b)
    | Soleo (v, vt) -> Soleo (v, compile_adt vt)
    | Lefto ((ab, Sum (Unit, Unit)), (a, Unit)) -> (* a + b, a *)
        Lefto ((ab, Sum (Unit, Unit)), (a, Unit))
    | Lefto ((ab, abt), (a, at)) -> (* a + b, a *)
       (match compile_adt abt with
       | Prod (_, vt) as abtc -> (* get the compiled child type *)
          Fresh (vt,
                 Fresh (bool_adt,
                        Conj (
                            Conj (
                                coerced_unify (1, vt) (a + 2, compile_adt at),
                                Pairo ((ab + 2, abtc), (0, bool_adt), (1, vt))),
                            trueo (0, bool_adt))))
       | _ -> invalid_arg "Impossible case!")
    | Righto ((ab, Sum (Unit, Unit)), (b, Unit)) -> (* a + b, b *)
        Righto ((ab, Sum (Unit, Unit)), (b, Unit))
    | Righto ((ab, abt), (b, bt)) -> (* a + b, b *)
       (match (compile_adt abt) with
       | Prod (_, vt) as abtc -> (* get the compiled child type *)
          Fresh (vt,
          Fresh (bool_adt,
            Conj (
              Conj (
                coerced_unify (1, vt) (b + 2, compile_adt bt),
                Pairo ((ab + 2, abtc), (0, bool_adt), (1, vt))),
              falseo (0, bool_adt))))
       | _ -> invalid_arg "Impossible case!")
    | Pairo ((ab, abt), (a, _), (b, _)) -> (* a * b, a, b *)
       (match compile_adt abt with
       | Prod (atc, btc) as abtc ->
          Pairo ((ab, abtc), (a, atc), (b, btc))
       | _ -> invalid_arg "Impossible case!")
    | Factor x -> Factor x

  let enforce_arg_types (cts : adt list) (ots : adt list) : 'elt tk =
    let enforce_exps =
      List.map2
        enforce_var_type
        (List.mapi (fun i t -> (i, t)) cts)
        ots
    in
      conj enforce_exps

  let compile_rel (r : 'elt rel) : 'elt rel =
    let cargs = List.map compile_adt r.args in
    { name = r.name;
      args = cargs;
      body =
        Conj (
          enforce_arg_types cargs r.args,
          compile_tk r.body) }

  let compile_tk_prgm (p : 'elt tk_prgm) : 'elt tk_prgm =
    List.map compile_rel p

end

(* tensor whose elements form semiring *)
module type TensorSemiring = sig
  type elt
  type arr

  val zero : elt
  val one : elt

  val init : int array -> (int array -> elt) -> arr (* should return [|0|] in shape [||] case *)
  val shape : arr -> int array
  val reshape : arr -> int array -> arr
  val concat_horizontal : arr -> arr -> arr

  val sum : ?axis:int -> ?keep_dims:bool -> arr -> arr
  val add : arr -> arr -> arr
  val mul : arr -> arr -> arr
  val smul : elt -> arr -> arr

  val print : arr -> unit
end

let init_nd_or_scalar shp f =
  if shp = [||] then
    Arr.create [||] (f [|0|])
  else
    Arr.init_nd shp f

(* TensorSemiring with standard + and * *)
module AddMulTensorSemiring : TensorSemiring
  with type elt = float
  with type arr = Arr.arr
= struct

  type elt = float
  type arr = Arr.arr

  let zero = 0.0
  let one = 1.0

  let init = init_nd_or_scalar
  let shape = Arr.shape
  let reshape = Arr.reshape
  let concat_horizontal = Arr.concat_horizontal

  let sum = Arr.sum
  let add = Arr.add
  let mul = Arr.mul
  let smul = Arr.scalar_mul

  let print x = Arr.print x

end

(* TensorSemiring with max and add (max tropical semiring) *)
module MaxAddTensorSemiring : TensorSemiring
  with type elt = float
  with type arr = Arr.arr
= struct

  type elt = float
  type arr = Arr.arr

  let zero = Float.neg_infinity
  let one = 0.0

  let init = init_nd_or_scalar
  let shape = Arr.shape
  let reshape = Arr.reshape
  let concat_horizontal = Arr.concat_horizontal

  let sum = Arr.max
  let add = Arr.max2
  let mul = Arr.add
  let smul = Arr.scalar_add

  let print x = Arr.print x

end

(* TensorSemiring with max and min (max min/fuzzy semiring) *)
module MaxMinTensorSemiring : TensorSemiring
  with type elt = float
  with type arr = Arr.arr
= struct
  type elt = float
  type arr = Arr.arr

  let zero = Float.neg_infinity
  let one = Float.infinity

  let init = init_nd_or_scalar
  let shape = Arr.shape
  let reshape = Arr.reshape
  let concat_horizontal = Arr.concat_horizontal

  let sum = Arr.max
  let add = Arr.max2
  let mul = Arr.min2
  let smul e a = Arr.(min2 (create (shape a) e) a)

  let print x = Arr.print x
end

module TensorTK(TS : TensorSemiring) = struct

  (* TYPES *)

  type adt = TK.adt
  type adv = TK.adv
  type var = TK.var
  type tk = TS.elt TK.tk
  type rel = TS.elt TK.rel
  type tk_prgm = TS.elt TK.tk_prgm

  type comp_rel = {
    name: string;
    args: adt list;
    body: TS.arr
  }

  type comp_tk_prgm = comp_rel list

  (* HELPER FUNCTIONS *)

  (* zeros and ones *)
  let zeros shp = TS.init shp (Fun.const TS.zero)
  let ones shp = TS.init shp (Fun.const TS.one)

  (* corresponding tensor shape of a list of adts *)
  let shape_of_env env =  Array.of_list @@ List.map TK.adt_size env

  (* like kronecker product, but tensor-shaped *)
  let tensor_prod (a : TS.arr) (b : TS.arr) : TS.arr =
    let a_shape = TS.shape a in
    let b_shape = TS.shape b in
    let a_rank = Array.length a_shape in
    let b_rank = Array.length b_shape in
    let a_good_rank =
      TS.reshape
        a
        (Array.append a_shape (Array.init b_rank (Fun.const 1)))
    in
    let b_good_rank =
      TS.reshape
      b
      (Array.append (Array.init a_rank (Fun.const 1)) b_shape)
    in
    TS.mul a_good_rank b_good_rank

  (* kronecker product of vectors *)
  let vec_kron_prod a b = TS.reshape (tensor_prod a b) [|-1|]

  (* kronecker sum of vectors *)
  let vec_kron_sum a b = TS.concat_horizontal a b

  (* zero vector of length s with 1 at position n *)
  let rec unit_basis s n =
    match s, n with
    | 0, _ -> zeros [|0|]
    | _, 0 -> vec_kron_sum (ones [|1|]) (unit_basis (s - 1) (n - 1))
    | _, _ -> vec_kron_sum (zeros [|1|]) (unit_basis (s - 1) (n - 1))

  (* vectors corresponding to true_adv and false_adv *)
  let true_vec = unit_basis 2 0
  let false_vec = unit_basis 2 1

  (* EVALUATION *)

  (* evaluate a tk expression by turn into a tensor *)
  let rec eval_tk (exp : tk) (env : adt list) (rels : comp_rel list) : TS.arr =
    match exp with
    | Succeed ->
        (* all-one tensor w/ env shape *)
        ones (shape_of_env env)
    | Fail ->
        (* all-zero tensor w/ env shape *)
        zeros (shape_of_env env);
    | Conj (e1, e2) ->
        (* element-wise multiplication *)
        TS.mul (eval_tk e1 env rels) (eval_tk e2 env rels)
    | Disj (e1, e2) ->
        (* element-wise addition *)
        TS.add (eval_tk e1 env rels) (eval_tk e2 env rels)
    | Fresh (vt, body) ->
        (* evaluate body with new variable in environment *)
        let body_res = eval_tk body (vt :: env) rels in
        (* sum over the variable (designed to be axis 0) *)
        TS.sum ~keep_dims:false ~axis:0 body_res
    | Rel (name, args) ->
        (* get the result of the relation, then unify it with the corresponding variables *)
        let rel = List.find (fun r -> r.name = name) rels in
        let nargs = List.length rel.args in
        let args_and_env = rel.args @ env in
        let unify_arg_tensors =
          List.mapi
            (fun i a ->
              let (ai, _) = a in
              TS.init (shape_of_env args_and_env) (* unify *)
                (fun idx ->
                  if idx.(i) = idx.(ai + nargs) then (* arg index w/ corrected var index *)
                    TS.one
                  else
                    TS.zero))
            args (* (int * adt) list *)
        in
        let unified_args_env = (* conj the unifications for each arg and rel result *)
          List.fold_left
            TS.mul
              (tensor_prod rel.body (ones (shape_of_env env)))
              unify_arg_tensors
        in
        List.fold_left (* sum over the rel args *)
          (fun res_tensor _ -> TS.sum ~keep_dims:false ~axis:0 res_tensor)
          unified_args_env
          args
    | Eqo (a, b) ->
        (* unify a and b *)
        let (av, _) = a in
        let (bv, _) = b in
        TS.init (shape_of_env env)
          (fun idx ->
            if idx.(av) = idx.(bv) then
              TS.one
            else
              TS.zero)
    | Neqo (a, b) ->
        (* deunify a and b *)
        let (av, _) = a in
        let (bv, _) = b in
        TS.init (shape_of_env env)
          (fun idx ->
            if idx.(av) = idx.(bv) then
              TS.zero
            else
              TS.one)
    | Soleo (_, _) ->
        (* same as succeed, b/c guaranteed by "typechecking"*)
        ones (shape_of_env env)
    | Lefto (ab, a) ->
        (* check that left side matches *)
        let (abv, _) = ab in
        let (av, _) = a in
        TS.init (shape_of_env env)
          (fun idx ->
            if idx.(abv) = idx.(av) then
              TS.one
            else
              TS.zero)
    | Righto (ab, b) ->
       (* check that right side matches *)
       (match ab with
       | (abv, Sum (at, _bt)) ->
          let (bv, _) = b in
          let sa = TK.adt_size at in
          TS.init (shape_of_env env)
            (fun idx ->
              if idx.(abv) = (sa + idx.(bv)) then
                TS.one
              else
                TS.zero)
       | _ -> invalid_arg "Impossible case!")
    | Pairo (ab, a, b) ->
        (* check that a and b match with ab *)
        let (abv, _) = ab in
        let (av, _) = a in
        let (bv, bt) = b in
        let sb = TK.adt_size bt in
        TS.init (shape_of_env env)
          (fun idx ->
            if idx.(abv) = ((idx.(av) * sb) + idx.(bv)) then
              TS.one
            else
              TS.zero)
    | Factor w ->
        TS.(smul w (ones (shape_of_env env)))

  let eval_rel (r : rel) (rels : comp_rel list) : comp_rel =
    { name = r.name;
      args = r.args;
      body = eval_tk r.body r.args rels }

  let rec eval_tk_prgm_help (prgm : rel list) (prev_comp : comp_rel list) =
    let comp = List.map (fun r -> eval_rel r prev_comp) prgm in
    (* print_endline "----------------------------"; *)
    (* List.iter (fun r -> print_endline r.name; TS.print r.body; print_endline "") comp; *)
    if comp = prev_comp then
      comp
    else
      eval_tk_prgm_help prgm comp

  let eval_tk_prgm (prgm : rel list) : comp_rel list =
    let init_comp_rels =
      List.map
        (fun (r : rel) ->
          { name = r.name;
            args = r.args;
            body = zeros (shape_of_env r.args)})
        prgm
    in
    eval_tk_prgm_help prgm init_comp_rels

  let eval_tk_prgm_maino (prgm : rel list) : comp_rel =
    List.find (fun r -> r.name = "maino") (eval_tk_prgm prgm)

end

(* COMPILING TO SAT *)

module SatTK = struct

  open TK

  let rec create_freshes (ts : adt list) (body : 'elt tk) : 'elt tk =
    match ts with
    | [] -> body
    | at :: dts ->
        create_freshes dts (Fresh (at, body))

  let rec bind_vars (avs : var list) (bvs : var list) : 'elt tk =
    match avs, bvs with
    | [], [] -> Succeed
    | (av :: avds), (bv :: bvds) ->
        Conj (
          Eqo (av, bv),
          bind_vars avds bvds)
    | _, _ -> invalid_arg "Two var lists length mismatch!"

  let rec unroll_recursions (exp : 'elt tk) (rels : bool tk_prgm) (gas : int) : 'elt tk =
    match exp with
    | Succeed -> Succeed
    | Fail -> Fail
    | Conj (e1, e2) -> Conj (unroll_recursions e1 rels gas, unroll_recursions e2 rels gas)
    | Disj (e1, e2) -> Disj (unroll_recursions e1 rels gas, unroll_recursions e2 rels gas)
    | Fresh (t, body) -> Fresh (t, unroll_recursions body rels gas)
    | Rel (name, args) ->
        if gas = 0 then Fail else
          let nargs = List.length args in
          let new_vars = List.mapi (fun idx (_, vt) -> (idx, vt)) args in
          let old_vars = List.map (fun (vv, vt) -> (vv + nargs, vt)) args in
          let arg_ts = List.map snd args in
          let bound_var_exp = bind_vars new_vars old_vars in
          let body = (List.find (fun r -> r.name = name) rels).body in
          create_freshes
            arg_ts
            (Conj
              (bound_var_exp,
              unroll_recursions body rels (gas - 1)))
    | Eqo (a, b) -> Eqo (a, b)
    | Neqo (a, b) -> Neqo (a, b)
    | Soleo a -> Soleo a
    | Lefto (ab, a) -> Lefto (ab, a)
    | Righto (ab, b) -> Righto (ab, b)
    | Pairo (ab, a, b) -> Pairo (ab, a, b)
    | Factor x -> Factor x

  type 'i range = int * int (* inclusive, exclusive *)

  type satvar =
  | SatUnit
  | SatVar of E.t
  | SatPair of satvar * satvar

  let rec string_of_satvar sv =
    match sv with
    | SatUnit -> "SatUnit"
    | SatVar _ -> "SatVar"
    | SatPair (a, b) ->
        "SatPair (" ^ (string_of_satvar a) ^ ", " ^ (string_of_satvar b) ^ ")"

  let rec satvar_of_adt typ =
    match typ with
    | Unit -> SatUnit
    | Sum (Unit, Unit) -> SatVar (E.fresh ())
    | Prod (a, b) -> SatPair (satvar_of_adt a, satvar_of_adt b)
    | Sum (_, _) -> invalid_arg "doesn't handle non-bool sums"

  (* vars unified with unit should be true *)
  (* otherwise unify via recursion and equality *)
  let rec unify_satvars sv1 sv2 =
    match sv1, sv2 with
    | SatUnit, SatUnit -> F.f_true
    | SatVar v1, SatVar v2 -> F.make_equiv (F.make_atom v1) (F.make_atom v2)
    | SatPair (sv1a, sv1d), SatPair (sv2a, sv2d) ->
       F.make_and [unify_satvars sv1a sv2a; unify_satvars sv1d sv2d]
    | _, _ -> invalid_arg "Impossible case!"

  (* env has satdts at index corresponding to variable number *)
  let rec sat_of_tk (exp : bool tk) (env : satvar list) : F.t =
    match exp with
    | Succeed -> F.f_true
    | Fail -> F.f_false
    | Conj (e1, e2) -> F.make_and [sat_of_tk e1 env; sat_of_tk e2 env]
    | Disj (e1, e2) -> F.make_or [sat_of_tk e1 env; sat_of_tk e2 env]
    | Fresh (t, body) -> sat_of_tk body ((satvar_of_adt t) :: env)
    | Rel (name, _) -> invalid_arg ("sat_of_tk doesn't handle recursions, given " ^ name)
    | Eqo ((av, _), (bv, _)) ->
        unify_satvars (List.nth env av) (List.nth env bv)
    | Neqo ((av, _), (bv, _)) ->
        F.make_not (unify_satvars (List.nth env av) (List.nth env bv))
    | Soleo _ -> F.f_true
    | Lefto ((abv, Sum (Unit, Unit)), (_av, Unit)) ->
       (* should be true if ab is true *)
       (match List.nth env abv with
       | SatVar atom -> F.make_atom atom
       | _ -> invalid_arg "impossible case!")
    | Lefto ((_, _), (_, _)) -> invalid_arg "unsupported lefto exp"
    | Righto ((abv, Sum (Unit, Unit)), (_bv, Unit)) ->
       (* should be true if ab is false *)
       (match List.nth env abv with
       | SatVar atom ->
          F.make_not (F.make_atom atom)
       | _ -> invalid_arg "impossible case!")
    | Righto ((_, _), (_, _)) -> invalid_arg "unsupported righto exp"
    | Pairo ((abv, _), (av, _), (bv, _)) ->
       (match List.nth env abv with
       | SatPair (absva, absvd) ->
          let asv = List.nth env av in
          let bsv = List.nth env bv in
          F.make_and [unify_satvars absva asv; unify_satvars absvd bsv]
       | _ -> invalid_arg "impossible case!")
    | Factor x -> if x then F.f_true else F.f_false

  let rec reify_satvar evalr v =
    match v with
    | SatUnit -> Sole
    | SatVar sv -> if (evalr sv) then Left Sole else Right Sole
    | SatPair (a, d) -> Pair (reify_satvar evalr a, reify_satvar evalr d)

  let rec count_adt_bool_vars t =
    match t with
    | Unit -> 0
    | Prod (x, y) -> (count_adt_bool_vars x) + (count_adt_bool_vars y)
    | Sum (Unit, Unit) -> 1
    | _ -> invalid_arg "Invalid compiled adt"

  let rec count_tk_bool_vars exp =
    match exp with
    | Succeed -> 0
    | Fail -> 0
    | Conj (e1, e2) -> (count_tk_bool_vars e1) + (count_tk_bool_vars e2)
    | Disj (e1, e2) -> (count_tk_bool_vars e1) + (count_tk_bool_vars e2)
    | Fresh (t, body) -> (count_adt_bool_vars t) + (count_tk_bool_vars body)
    | Rel (name, _) -> invalid_arg ("sat_of_tk doesn't handle recursions, given " ^ name)
    | Eqo _ -> 0
    | Neqo _ -> 0
    | Soleo _ -> 0
    | Lefto _ -> 0
    | Righto _ -> 0
    | Pairo _ -> 0
    | Factor _ -> 0

  let sat_eval_tk_prgm (p : bool tk_prgm) (name : string) (gas : int) =
    let comp_p = TK.compile_tk_prgm p in
    let rel_to_convert = List.find (fun r -> r.name = name) comp_p in
    let rel_unrolled = unroll_recursions rel_to_convert.body comp_p gas in
    let sat_args = List.map satvar_of_adt rel_to_convert.args in
    let arg_bool_var_count =
      List.fold_left (fun acc a -> acc + (count_adt_bool_vars a)) 0 rel_to_convert.args
    in
    let rel_bool_var_count = count_tk_bool_vars rel_unrolled in
    print_string "SAT var count: ";
    print_endline (string_of_int (rel_bool_var_count + arg_bool_var_count));
    let rel_tseitin = sat_of_tk rel_unrolled sat_args in
    let prgm_cnf = F.make_cnf rel_tseitin in
    let conj_count = List.length prgm_cnf in
    let total_disj_count =
      List.fold_left (fun acc a -> acc + (List.length a)) 0 prgm_cnf
    in
    let avg_disjunction_count = (float_of_int total_disj_count) /. (float_of_int conj_count) in
    print_string "Num SAT clauses: ";
    print_endline (string_of_int conj_count);
    print_string "Average SAT clause length: ";
    print_endline (string_of_float avg_disjunction_count);
    let solver = Sat.create () in
    Sat.assume solver prgm_cnf ();
    match Sat.solve solver with
    | Unsat _ -> None
    | Sat r -> Some (List.map (reify_satvar r.eval) sat_args)

  let sat_eval_tk_prgm_maino p gas = sat_eval_tk_prgm p "maino" gas

end
