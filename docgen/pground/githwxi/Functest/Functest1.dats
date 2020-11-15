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
factorial(n: int): int =
if n > 0 then n * factorial(n-1) else 1
(* ****** ****** *)

local

(* ****** ****** *)

impltmp
Functest$name<>() = "factorial"

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

(* ****** ****** *)

in(* in-of-local*)

impltmp
JS_Functest_main() = Functest(factorial)

end // end of [local]

(* ****** ****** *)

(* end of [Functest1.dats] *)
