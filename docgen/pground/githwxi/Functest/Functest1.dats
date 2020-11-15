(* ****** ****** *)
#staload "./Functest.dats"
(* ****** ****** *)
#include
"./../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)

fun
factorial(n: int): int =
if n > 0 then n * factorial(n-1) else 1
(* ****** ****** *)
impltmp
Functest$name<>() = "factorial"
(* ****** ****** *)
#extern
fun
JS_Functest_main(): void = $exname()
impltmp
JS_Functest_main() = Functest(factorial)
(* ****** ****** *)

(* end of [Functest1.dats] *)
