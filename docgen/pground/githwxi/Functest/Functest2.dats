(* ****** ****** *)
#staload "./Functest.dats"
(* ****** ****** *)
#include
"./../../../..\
/share/xats2js_prelude.hats"
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
impltmp
Functest$name<>() = "ackermann"
(* ****** ****** *)
#extern
fun
JS_Functest_main(): void = $exname()
impltmp
JS_Functest_main() = Functest(ackermann)
(* ****** ****** *)

(* end of [Functest1.dats] *)
