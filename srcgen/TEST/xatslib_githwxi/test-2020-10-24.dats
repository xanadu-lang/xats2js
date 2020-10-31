(* ****** ****** *)
#staload "./../myprint.dats"
(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)

val () = print(1, 2)
val () = g_print('\n')

(* ****** ****** *)

val () = println(false, 1, '2', "3")

(* ****** ****** *)

(* end of [test-2020-10-24.dats] *)
