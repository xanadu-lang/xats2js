(* ****** ****** *)
#staload
"./../..\
/mylib/mylib.dats"
(* ****** ****** *)
#staload "./midterm.dats"
(* ****** ****** *)
#include
"./../../../../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
//
implement
T0Pnil = T0Pbas("nil")
implement
T0Pint = T0Pbas("int")
//
implement
T0Pbool = T0Pbas("bool")
//
implement
T0Pstring = T0Pbas("string")
//
(* ****** ****** *)

implfun
print_type0(tp0) =
(
case+ tp0 of
| T0Pbas(nm) =>
  print("T0Pbas(", nm, ")")
| T0Pfun(tp1, tp2) =>
  print("T0Pfun(", tp1, ", ", tp2, ")")
| T0Ptup(tp1, tp2) =>
  print("T0Ptup(", tp1, ", ", tp2, ")")
)

(* ****** ****** *)

(* end of [midterm_type0.dats] *)