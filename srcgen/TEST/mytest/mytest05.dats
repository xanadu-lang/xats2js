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
<ans:type>
kfact
( x: int
, k: int -> ans): ans =
if
(x = 0)
then k(1)
else kfact(x-1, lam r => k(x * r))

(* ****** ****** *)

fnx
fact2
(x: int, r: int): int =
if
(x > 0)
then fact2(x-1, x * r) else r

(* ****** ****** *)

fnx
kfact2
( x: int
, r: int
, k: int -> void): void=
if
(x > 0)
then kfact2(x-1, x * r, k) else k(r)

(* ****** ****** *)

val i10 = 10

val () =
println("fact(10) = ", fact(10))
val () =
println("fact2(i10, 1) = ", fact2(i10, 1))

(* ****** ****** *)

val () =
kfact
(10, lam(r) => println("kfact(10) = ", r))
val () =
kfact2
(10, 1, lam(r) => println("kfact2(10) = ", r))

(* ****** ****** *)

(* end of [mytest05.dats] *)
