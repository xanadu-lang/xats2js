(* ****** ****** *)
#include"\
$(XATS2JSD)\
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
#extern
fun
<a2:t0>
Functest$arg2((*void*)): a2
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
{a0:t0
,a1:t0
,a2:t0
,r0:t0}
Functest
<(a0,a1,a2)->r0>(f0) =
let
//
val name =
Functest$name()
//
val arg0 =
Functest$arg0<a0>()
val arg1 =
Functest$arg1<a1>()
val arg2 =
Functest$arg2<a1>()
//
in
  let
  val r0 = f0(arg0, arg1, arg3)
  in
  println(name, "(", arg0, ", ", arg1, ", ", arg3") = ", r0)
  end
end // end of [Functest]

(* ****** ****** *)
impltmp
Functest$name<>() = "Functest$name"
(* ****** ****** *)

(* end of [Functest.dats] *)
