module TK = Tensorkanren.TK
module TTK = Tensorkanren.TensorTK(Tensorkanren.AddMulTensorSemiring)

module AddMulTKEx = struct

  open TK
  open TTK

let n4 : adt = Sum(Unit, Sum(Unit, Sum(Unit, Unit)));;

 let diffo : rel = {
  name = "diffo";
  args = [n4;n4];
  body =
  Neqo(
  (0, n4),
  (1, n4))};;

 let valid_4x4 : rel = {
  name = "valid_4x4";
  args = [n4;n4;n4;n4];
  body =
  Conj(
  Rel("diffo",
[(0, n4); (1, n4)]),
  Conj(
  Rel("diffo",
[(0, n4); (2, n4)]),
  Conj(
  Rel("diffo",
[(0, n4); (3, n4)]),
  Conj(
  Rel("diffo",
[(1, n4); (2, n4)]),
  Conj(
  Rel("diffo",
[(1, n4); (3, n4)]),
  Rel("diffo",
[(2, n4); (3, n4)]))))))};;

 let sudoku_4x4 : rel = {
  name = "sudoku_4x4";
  args = [n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4];
  body =
  Conj(
  Rel("valid_4x4",
[(0, n4); (1, n4); (2, n4); (3, n4)]),
  Conj(
  Rel("valid_4x4",
[(0, n4); (1, n4); (4, n4); (5, n4)]),
  Conj(
  Rel("valid_4x4",
[(0, n4); (4, n4); (8, n4); (12, n4)]),
  Conj(
  Rel("valid_4x4",
[(8, n4); (9, n4); (12, n4); (13, n4)]),
  Conj(
  Rel("valid_4x4",
[(8, n4); (9, n4); (10, n4); (11, n4)]),
  Conj(
  Rel("valid_4x4",
[(10, n4); (11, n4); (14, n4); (15, n4)]),
  Conj(
  Rel("valid_4x4",
[(12, n4); (13, n4); (14, n4); (15, n4)]),
  Conj(
  Rel("valid_4x4",
[(1, n4); (5, n4); (9, n4); (13, n4)]),
  Conj(
  Rel("valid_4x4",
[(4, n4); (5, n4); (6, n4); (7, n4)]),
  Conj(
  Rel("valid_4x4",
[(2, n4); (3, n4); (6, n4); (7, n4)]),
  Conj(
  Rel("valid_4x4",
[(3, n4); (7, n4); (11, n4); (15, n4)]),
  Rel("valid_4x4",
[(2, n4); (6, n4); (10, n4); (14, n4)]))))))))))))};;

 let maino : tk_prgm = [
  diffo;valid_4x4;sudoku_4x4;
  {
  name = "maino";
  args = [n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4;n4];
  body =
  Fresh(Unit,
  Conj(
  Soleo(
  (0, Unit)),
  Fresh(Sum(Unit, Unit),
  Conj(
  Righto(
  (0, Sum(Unit, Unit)),
  (1, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Unit)),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Unit))),
  (1, Sum(Unit, Unit))),
  Fresh(n4,
  Conj(
  Righto(
  (0, n4),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(n4,
  Fresh(Unit,
  Conj(
  Lefto(
  (1, n4),
  (0, Unit)),
  Fresh(n4,
  Fresh(Unit,
  Conj(
  Lefto(
  (1, n4),
  (0, Unit)),
  Fresh(Sum(Unit, Unit),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Unit)),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Unit)),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Unit))),
  (2, Sum(Unit, Unit))),
  Fresh(n4,
  Conj(
  Righto(
  (0, n4),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Rel("sudoku_4x4",
[(8, n4); (12, n4); (7, n4); (13, n4); (14, n4); (15, n4); (16, n4); (17, n4); (18, n4); (19, n4); (20, n4); (21, n4); (22, n4); (5, n4); (23, n4); (0, n4)]))))))))))))))))))))))}];;

end

let _ = TTK.eval_tk_prgm_maino AddMulTKEx.maino
