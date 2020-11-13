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
print_value
  (vl0) =
(
case+ vl0 of
//
| VALnil() =>
  print("VALnil(", ")")
//
| VALint(i0) =>
  print("VALint(", i0, ")")
| VALbtf(b0) =>
  print("VALbtf(", b0, ")")
| VALstr(s0) =>
  print("VALstr(", s0, ")")
//
| VALtup(vl1, vl2) =>
  print("VALtup(", vl1, "; ", vl2, ")")
//
| VALlam _ => println("VALlam(", "...", ")")
| VALfix _ => println("VALfix(", "...", ")")
//
)

(* ****** ****** *)

(* end of [midterm_value.dats] *)
