(* ****** ****** *)
#staload
"./../..\
/mylib/mylib.dats"
(* ****** ****** *)
#staload
"./midterm_head0.dats"
(* ****** ****** *)
#include
"./../../../../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

implfun
print_t0erm
  (tm0) =
(
case+ tm0 of
//
| T0Mnil() =>
  print("T0Mnil(", ")")
//
| T0Mint(x0) =>
  print("T0Mint(", x0, ")")
| T0Mbtf(x0) =>
  print("T0Mbtf(", x0, ")")
| T0Mstr(x0) =>
  print("T0Mstr(", x0, ")")
//
| T0Mvar(x0) =>
  print("T0Mvar(", x0, ")")
//
| T0Mlam(x0, opt, tm2) =>
  print
  ("T0Mlam(", x0, "; ", opt, "; ", tm2, ")")
| T0Mfix(f0, opt, tm2) =>
  print
  ("T0Mfix(", f0, "; ", opt, "; ", tm2, ")")
//
| T0Mapp(tm1, tm2) =>
  print("T0Mapp(", tm1, "; ", tm2, ")")
//
| T0Mlet(x0, tm1, tm2) =>
  print
  ("T0Mlet(", x0, "; ", tm1, "; ", tm2, ")")
//
| T0Mfst(tup) =>
  print("T0Mfst(", tup, ")")
| T0Msnd(tup) =>
  print("T0Msnd(", tup, ")")
| T0Mtup(tm1, tm2) =>
  print("T0Mtup(", tm1, "; ", tm2, ")")
//
| T0Mopr1(opr, tm1) =>
  print("T0Mopr1(", opr, "; ", tm1, ")")
| T0Mopr2(opr, tm1, tm2) =>
  print
  ("T0Mopr2(", opr, "; ", tm1, "; ", tm2, ")")
//
| T0Manno(tm1, tp2) =>
  print("T0Manno(", tm1, "; ", tp2, ")")
//
| T0Mcond(tm1, tm2, opt) =>
  print
  ("T0Mcond(", tm1, "; ", tm2, "; ", opt, ")")
//
)

(* ****** ****** *)

(* end of [midterm_t0erm.dats] *)
