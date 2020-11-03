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
//
val cs1 = "12345"
//
val css =
gseq_permutize(cs1)
val ( ) =
( print("css=")
; gl_print0(css); println()) where
{
impltmp stream_vt_print$len<>() = 6
}
//
(* ****** ****** *)

(* end of [test-2020-06-05.dats] *)
