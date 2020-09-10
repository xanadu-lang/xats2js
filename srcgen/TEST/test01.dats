(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

val one = 1
val two = 2
val three = one + two

(* ****** ****** *)
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
(* ****** ****** *)
#extern
fun
fact2(x: int, r: int): int
implement
fact2(x, r) =
if x > 0 then fact2(x-1, x*r) else r
(* ****** ****** *)

(* end of [test01.dats] *)
