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

val xs =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4,
list_cons(5, list_nil())))))

(* ****** ****** *)
//
val xss = list_permutize(xs)
val len = stream_vt_length(xss)
//
val ( ) =
( g_print("len = ")
; g_print( len ); g_print("\n"))
//
(* ****** ****** *)

(* end of [test-2020-03-22.dats] *)
