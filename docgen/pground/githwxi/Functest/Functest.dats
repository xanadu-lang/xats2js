(* ****** ****** *)
#include
"./../../../..\
/share/xats2js_prelude.hats"
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
<(a0)->r0>(f0) =
let
//
val name =
Functest$name()
//
val arg0 =
Functest$arg0<a0>()
//
in
  let
  val r0 = f0(arg0)
  in
  println(name, "(", arg0, ") = ", r0)
  end
end // end of [Functest]

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
impltmp
Functest$name<>() = "Functest$name"
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
//
#extern
fun
JS_Functest_main(): void = $exname()
impltmp
JS_Functest_main() = Functest(ackermann)
//
(* ****** ****** *)

(* end of [Functest.dats] *)
