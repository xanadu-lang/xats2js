(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#extern
fun
StreaxDemo2_stream
((*void*)) : stream(int)
(* ****** ****** *)
impltmp
StreaxDemo2_stream
  ((*void*)) =
(
  fibo(0, 1)) where
{
fun
fibo(f0, f1) =
$lazy(strmcon_cons(f0, fibo(f1, f0+f1)))
} (* end of [StreaxDemo2_stream] *)
(* ****** ****** *)

(* end of [required.dats] *)

