(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#extern
fun
<a:t0>
StreamDemo$get(): stream(a)
#extern
fun
<a:t0>
StreamDemo$set(xs: stream(a)): void
(* ****** ****** *)
#extern
fun
<a:t0>
StreamDemo$next((*void*)): optn(a)
(* ****** ****** *)
impltmp
<a>(*tmp*)
StreamDemo$next() =
let
val xs = StreamDemo$get<a>()
in
case+ !xs of
|
strmcon_nil
((*nil*)) => optn_nil()
|
strmcon_cons
( x0, xs ) => let
  val () = 
  StreamDemo$set<a>(xs) in optn_cons(x0)
end // [strmcon_cons]
end // end of [impltmp]
(* ****** ****** *)

(* end of [StreamDemo.dats] *)
