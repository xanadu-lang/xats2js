(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#extern
fun
<f0:t0>
Functest(f0: f0): void
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
val x0 =
Functest$arg0<a0>()
val x1 =
Functest$arg1<a1>()
//
in
  let
  val r0 = f0(x0, x1)
  in
  println(f0, "(", x0, ", ", x1, ") = ", r0)
  end
end // end of [Functest]

(* ****** ****** *)

(* end of [Functest.dats] *)
