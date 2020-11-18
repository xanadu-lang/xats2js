(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

fun
fact2
(x: int, r: int): int =
if x > 0 then fact2(x-1, x * r) else r

(* ****** ****** *)

val () =
println("fact(10) = ", fact(10))
val () =
println("fact2(10, 1) = ", fact2(10, 1))

(* ****** ****** *)

(* end of [mytest05.dats] *)
