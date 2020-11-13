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
implval
T0Pnil = T0Pbas("nil")
implval
T0Pint = T0Pbas("int")
//
implval
T0Pbool = T0Pbas("bool")
//
implval
T0Pstring = T0Pbas("string")
//
(* ****** ****** *)

implfun
type0_new_ext() =
T0Pext(tpext_new())

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
