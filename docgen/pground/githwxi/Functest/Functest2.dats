(* ****** ****** *)
#staload "./Functest.dats"
(* ****** ****** *)
#include
"./../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#extern
fun
JS_Functest_main
((*void*)): void = $exname()
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
Functest$name<>() = "ackermann"

(* ****** ****** *)

impltmp
Functest$arg0<int> =
(
  JS_Functest_arg0_int
) where
{
#extern
fun
JS_Functest_arg0_int(): int = $exname()
}

impltmp
Functest$arg1<int> =
(
  JS_Functest_arg1_int
) where
{
#extern
fun
JS_Functest_arg1_int(): int = $exname()
}

(* ****** ****** *)

in(* in-of-local*)

impltmp
JS_Functest_main() = Functest(ackermann)

end // end of [local]

(* ****** ****** *)

(* end of [Functest2.dats] *)
