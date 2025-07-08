module TK = Tensorkanren.TK
module SatTK = Tensorkanren.SatTK

module SatTKEx = struct

  open TK

  type tk_prgm = bool TK.tk_prgm
  type rel = bool TK.rel


  let n9 : adt = Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))));;

  let diffo : rel = {
  name = "diffo";
  args = [n9;n9];
  body =
  Neqo(
  (0, n9),
  (1, n9))};;

  let valid_9x9 : rel = {
  name = "valid_9x9";
  args = [n9;n9;n9;n9;n9;n9;n9;n9;n9];
  body =
  Conj(
  Rel("diffo",
[(0, n9); (1, n9)]),
  Conj(
  Rel("diffo",
[(0, n9); (2, n9)]),
  Conj(
  Rel("diffo",
[(0, n9); (3, n9)]),
  Conj(
  Rel("diffo",
[(0, n9); (4, n9)]),
  Conj(
  Rel("diffo",
[(0, n9); (5, n9)]),
  Conj(
  Rel("diffo",
[(0, n9); (6, n9)]),
  Conj(
  Rel("diffo",
[(0, n9); (7, n9)]),
  Conj(
  Rel("diffo",
[(0, n9); (8, n9)]),
  Conj(
  Rel("diffo",
[(1, n9); (2, n9)]),
  Conj(
  Rel("diffo",
[(1, n9); (3, n9)]),
  Conj(
  Rel("diffo",
[(1, n9); (4, n9)]),
  Conj(
  Rel("diffo",
[(1, n9); (5, n9)]),
  Conj(
  Rel("diffo",
[(1, n9); (6, n9)]),
  Conj(
  Rel("diffo",
[(1, n9); (7, n9)]),
  Conj(
  Rel("diffo",
[(1, n9); (8, n9)]),
  Conj(
  Rel("diffo",
[(2, n9); (3, n9)]),
  Conj(
  Rel("diffo",
[(2, n9); (4, n9)]),
  Conj(
  Rel("diffo",
[(2, n9); (5, n9)]),
  Conj(
  Rel("diffo",
[(2, n9); (6, n9)]),
  Conj(
  Rel("diffo",
[(2, n9); (7, n9)]),
  Conj(
  Rel("diffo",
[(2, n9); (8, n9)]),
  Conj(
  Rel("diffo",
[(3, n9); (4, n9)]),
  Conj(
  Rel("diffo",
[(3, n9); (5, n9)]),
  Conj(
  Rel("diffo",
[(3, n9); (6, n9)]),
  Conj(
  Rel("diffo",
[(3, n9); (7, n9)]),
  Conj(
  Rel("diffo",
[(3, n9); (8, n9)]),
  Conj(
  Rel("diffo",
[(4, n9); (5, n9)]),
  Conj(
  Rel("diffo",
[(4, n9); (6, n9)]),
  Conj(
  Rel("diffo",
[(4, n9); (7, n9)]),
  Conj(
  Rel("diffo",
[(4, n9); (8, n9)]),
  Conj(
  Rel("diffo",
[(5, n9); (6, n9)]),
  Conj(
  Rel("diffo",
[(5, n9); (7, n9)]),
  Conj(
  Rel("diffo",
[(5, n9); (8, n9)]),
  Conj(
  Rel("diffo",
[(6, n9); (7, n9)]),
  Conj(
  Rel("diffo",
[(6, n9); (8, n9)]),
  Rel("diffo",
[(7, n9); (8, n9)]))))))))))))))))))))))))))))))))))))};;

 let sudoku_9x9 : rel = {
  name = "sudoku_9x9";
  args = [n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9];
  body =
  Conj(
  Rel("valid_9x9",
[(0, n9); (1, n9); (2, n9); (3, n9); (4, n9); (5, n9); (6, n9); (7, n9); (8, n9)]),
  Conj(
  Rel("valid_9x9",
[(0, n9); (9, n9); (18, n9); (27, n9); (36, n9); (45, n9); (54, n9); (63, n9); (72, n9)]),
  Conj(
  Rel("valid_9x9",
[(0, n9); (9, n9); (18, n9); (1, n9); (10, n9); (19, n9); (2, n9); (11, n9); (20, n9)]),
  Conj(
  Rel("valid_9x9",
[(9, n9); (10, n9); (11, n9); (12, n9); (13, n9); (14, n9); (15, n9); (16, n9); (17, n9)]),
  Conj(
  Rel("valid_9x9",
[(1, n9); (10, n9); (19, n9); (28, n9); (37, n9); (46, n9); (55, n9); (64, n9); (73, n9)]),
  Conj(
  Rel("valid_9x9",
[(3, n9); (4, n9); (5, n9); (12, n9); (13, n9); (14, n9); (21, n9); (22, n9); (23, n9)]),
  Conj(
  Rel("valid_9x9",
[(18, n9); (19, n9); (20, n9); (21, n9); (22, n9); (23, n9); (24, n9); (25, n9); (26, n9)]),
  Conj(
  Rel("valid_9x9",
[(2, n9); (11, n9); (20, n9); (29, n9); (38, n9); (47, n9); (56, n9); (65, n9); (74, n9)]),
  Conj(
  Rel("valid_9x9",
[(6, n9); (7, n9); (8, n9); (15, n9); (16, n9); (17, n9); (24, n9); (25, n9); (26, n9)]),
  Conj(
  Rel("valid_9x9",
[(27, n9); (28, n9); (29, n9); (30, n9); (31, n9); (32, n9); (33, n9); (34, n9); (35, n9)]),
  Conj(
  Rel("valid_9x9",
[(3, n9); (12, n9); (21, n9); (30, n9); (39, n9); (48, n9); (57, n9); (66, n9); (75, n9)]),
  Conj(
  Rel("valid_9x9",
[(27, n9); (28, n9); (29, n9); (36, n9); (37, n9); (38, n9); (45, n9); (46, n9); (47, n9)]),
  Conj(
  Rel("valid_9x9",
[(36, n9); (37, n9); (38, n9); (39, n9); (40, n9); (41, n9); (42, n9); (43, n9); (44, n9)]),
  Conj(
  Rel("valid_9x9",
[(4, n9); (13, n9); (22, n9); (31, n9); (40, n9); (49, n9); (58, n9); (67, n9); (76, n9)]),
  Conj(
  Rel("valid_9x9",
[(30, n9); (31, n9); (32, n9); (39, n9); (40, n9); (41, n9); (48, n9); (49, n9); (50, n9)]),
  Conj(
  Rel("valid_9x9",
[(45, n9); (46, n9); (47, n9); (48, n9); (49, n9); (50, n9); (51, n9); (52, n9); (53, n9)]),
  Conj(
  Rel("valid_9x9",
[(5, n9); (14, n9); (23, n9); (32, n9); (41, n9); (50, n9); (59, n9); (68, n9); (77, n9)]),
  Conj(
  Rel("valid_9x9",
[(33, n9); (34, n9); (35, n9); (42, n9); (43, n9); (44, n9); (51, n9); (52, n9); (53, n9)]),
  Conj(
  Rel("valid_9x9",
[(54, n9); (55, n9); (56, n9); (57, n9); (58, n9); (59, n9); (60, n9); (61, n9); (62, n9)]),
  Conj(
  Rel("valid_9x9",
[(6, n9); (15, n9); (24, n9); (33, n9); (42, n9); (51, n9); (60, n9); (69, n9); (78, n9)]),
  Conj(
  Rel("valid_9x9",
[(54, n9); (55, n9); (56, n9); (63, n9); (64, n9); (65, n9); (72, n9); (73, n9); (74, n9)]),
  Conj(
  Rel("valid_9x9",
[(63, n9); (64, n9); (65, n9); (66, n9); (67, n9); (68, n9); (69, n9); (70, n9); (71, n9)]),
  Conj(
  Rel("valid_9x9",
[(7, n9); (16, n9); (25, n9); (34, n9); (43, n9); (52, n9); (61, n9); (70, n9); (79, n9)]),
  Conj(
  Rel("valid_9x9",
[(57, n9); (58, n9); (59, n9); (66, n9); (67, n9); (68, n9); (75, n9); (76, n9); (77, n9)]),
  Conj(
  Rel("valid_9x9",
[(72, n9); (73, n9); (74, n9); (75, n9); (76, n9); (77, n9); (78, n9); (79, n9); (80, n9)]),
  Conj(
  Rel("valid_9x9",
[(8, n9); (17, n9); (26, n9); (35, n9); (44, n9); (53, n9); (62, n9); (71, n9); (80, n9)]),
  Rel("valid_9x9",
[(60, n9); (61, n9); (62, n9); (69, n9); (70, n9); (71, n9); (78, n9); (79, n9); (80, n9)])))))))))))))))))))))))))))};;

 let maino : tk_prgm = [
  diffo;valid_9x9;sudoku_9x9;
  {
  name = "maino";
  args = [n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9;n9];
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
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(n9,
  Fresh(Unit,
  Conj(
  Lefto(
  (1, n9),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Unit)),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Unit))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (2, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(n9,
  Fresh(Unit,
  Conj(
  Lefto(
  (1, n9),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
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
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
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
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (0, Unit)),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
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
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
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
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (0, Unit)),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
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
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(n9,
  Fresh(Unit,
  Conj(
  Lefto(
  (1, n9),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (0, Unit)),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
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
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (1, Sum(Unit, Sum(Unit, Unit)))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(n9,
  Fresh(Unit,
  Conj(
  Lefto(
  (1, n9),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Unit))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  (0, Unit)),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Conj(
  Righto(
  (0, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Fresh(Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))),
  Fresh(Unit,
  Conj(
  Lefto(
  (1, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit)))))))),
  (0, Unit)),
  Fresh(n9,
  Conj(
  Righto(
  (0, n9),
  (2, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Sum(Unit, Unit))))))))),
  Rel("sudoku_9x9",
[(162, n9); (163, n9); (164, n9); (153, n9); (152, n9); (165, n9); (166, n9); (144, n9); (167, n9); (139, n9); (168, n9); (169, n9); (135, n9); (170, n9); (171, n9); (172, n9); (173, n9); (174, n9); (175, n9); (129, n9); (176, n9); (177, n9); (178, n9); (121, n9); (120, n9); (179, n9); (180, n9); (181, n9); (182, n9); (114, n9); (183, n9); (105, n9); (184, n9); (185, n9); (96, n9); (90, n9); (84, n9); (186, n9); (187, n9); (81, n9); (188, n9); (76, n9); (189, n9); (190, n9); (67, n9); (58, n9); (55, n9); (191, n9); (192, n9); (46, n9); (193, n9); (39, n9); (194, n9); (195, n9); (196, n9); (197, n9); (38, n9); (31, n9); (198, n9); (199, n9); (200, n9); (28, n9); (201, n9); (19, n9); (202, n9); (203, n9); (204, n9); (205, n9); (18, n9); (206, n9); (207, n9); (10, n9); (208, n9); (209, n9); (210, n9); (211, n9); (3, n9); (0, n9); (212, n9); (213, n9); (214, n9)])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}];;

end

let _ = SatTK.sat_eval_tk_prgm_maino SatTKEx.maino 5
