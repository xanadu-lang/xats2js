(* ****** ****** *)
(*
HX-2020-11-26:
For testing xdebug
*)
(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
val line = "\"\
Here is a lone string \
spreaded over multiple lines!\"\
"
(* ****** ****** *)

val () = println("line = ", line)

(* ****** ****** *)

(* end of [test-2020-12-08.dats] *)
