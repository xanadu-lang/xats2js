(* ****** ****** *)
#include
"./../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"prelude/DATS/CATS/JS/g_print.dats"
(* ****** ****** *)
#extern
fun
<f0:t0>
Functest(f0: f0): void
(* ****** ****** *)
#extern
fun<>
Functest$name(): string
(* ****** ****** *)
#extern
fun
<a0:t0>
Functest$arg0((*void*)): a0
#extern
fun
<a1:t0>
Functest$arg1((*void*)): a1
(* ****** ****** *)

impltmp
{a0:t0
,a1:t0
,r0:t0}
Functest
<(a0,a1)->r0>(f0) =
let
//
val name =
Functest$name()
//
val arg0 =
Functest$arg0<a0>()
val arg1 =
Functest$arg1<a1>()
//
in
  let
  val r0 = f0(arg0, arg1)
  in
  println(name, "(", arg0, ", ", arg1, ") = ", r0)
  end
end // end of [Functest]

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

impltmp
Functest$arg0<int> =
(
  Functest_arg0_int
) where
{
#extern
fun
Functest_arg0_int(): int = $exname()
}
impltmp
Functest$arg1<int> =
(
  Functest_arg1_int
) where
{
#extern
fun
Functest_arg1_int(): int = $exname()
}

(* ****** ****** *)
//
#extern
fun
Functest_main(): void = $exname()
impltmp
Functest_main() = Functest(ackermann)
//
(* ****** ****** *)

(* end of [Functest.dats] *)
