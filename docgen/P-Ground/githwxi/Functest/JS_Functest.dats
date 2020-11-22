(* ****** ****** *)
#staload "./Functest.dats"
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#extern
fun
JS_factorial_main
((*void*)): void = $exname()
#extern
fun
JS_ackermann_main
((*void*)): void = $exname()
(* ****** ****** *)

fun
factorial(n: int): int =
if n > 0
then n * factorial(n-1) else 1

(* ****** ****** *)

fun
ackermann
( m: int
, n: int): int =
(
  acker(m, n)) where
{
fun
acker(m, n) =
if
(m = 0)
then (n+1)
else
(
if
(n = 0)
then acker(m-1, 1)
else acker(m-1, acker(m, n-1))
)
} (* end of [ackermann] *)

(* ****** ****** *)

local

(* ****** ****** *)

impltmp
Functest$name<>() = "factorial"

(* ****** ****** *)

impltmp
Functest$arg0<int> =
(
  JS_factorial_arg0_int
) where
{
#extern
fun
JS_factorial_arg0_int(): int = $exname()
}

(* ****** ****** *)

in(* in-of-local*)

impltmp
JS_factorial_main() = Functest(factorial)

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

impltmp
Functest$name<>() = "ackermann"

(* ****** ****** *)

impltmp
Functest$arg0<int> =
(
  JS_ackermann_arg0_int
) where
{
#extern
fun
JS_ackermann_arg0_int(): int = $exname()
}

impltmp
Functest$arg1<int> =
(
  JS_ackermann_arg1_int
) where
{
#extern
fun
JS_ackermann_arg1_int(): int = $exname()
}

(* ****** ****** *)

in(* in-of-local*)

impltmp
JS_ackermann_main() = Functest(ackermann)

end // end of [local]

(* ****** ****** *)

(* end of [JS_Functest.dats] *)
