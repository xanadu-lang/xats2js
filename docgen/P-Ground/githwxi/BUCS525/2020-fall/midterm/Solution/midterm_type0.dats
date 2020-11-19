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
//
implval
T0Pnil = T0Pbas("nil")
implval
T0Pint = T0Pbas("int")
//
implval
T0Pbtf = T0Pbas("bool")
//
implval
T0Pstr = T0Pbas("string")
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
  print
  ("T0Pfun(", tp1, ", ", tp2, ")")
| T0Ptup(tp1, tp2) =>
  print
  ("T0Ptup(", tp1, ", ", tp2, ")")
| T0Pext(X0) =>
  (
  case+ X0.get() of
  | myoptn_nil() =>
    print("T0Pext(", "...", ")")
  | myoptn_cons(tp1) => print_type0(tp1)
  )
) (* end of [print_type0] *)

(* ****** ****** *)

(* end of [midterm_type0.dats] *)
