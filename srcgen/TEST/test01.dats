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

(* end of [test01.dats] *)
