(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(*
//
// HX-2020-11-23:
// This example shows how to
// manipulate a stream_vt in JS
//
*)
//
#extern
fun
JS_fromto
(n: int): stream_vt(int) = $exname()
#extern
fun
JS_sieve_helper
(ns: stream_vt(int)): stream_vt(int) = $exname()
//
(* ****** ****** *)

val thePrimes =
JS_sieve_helper(JS_fromto(2))
val ((*void*)) =
(print("thePrimes = "); print0(thePrimes); println())

(* ****** ****** *)

(* end of [mytest09.dats] *)
