(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload "./StreamDemo.dats"
(* ****** ****** *)

val
thePrimes =
helper(fromto(2)) where
{
fun
fromto
(n: int): stream(int) =
$lazy
(
strmcon_cons(n, fromto(n+1))
)
fun
helper
(xs: stream(int)): stream(int) =
$lazy
(
let
val-
strmcon_cons(x0, xs) = !xs
in
strmcon_cons
(x0, helper(stream_filter(xs))) where
{
impltmp filter$test<int>(x1) = (x1 % x0 > 0)
}
end
) (* end of [helper] *)
} (* en dof [thePrimes] *)

(* ****** ****** *)

val
thePrimes_ref = a0ref_make(thePrimes)

(* ****** ****** *)

local
impltmp
StreamDemo$get<int>() = get(thePrimes_ref)
impltmp
StreamDemo$set<int>(xs) = set(thePrimes_ref, xs)
in
//
#extern
fun
JS_StreamDemo_next(): void = $exname()
#extern
fun
JS_StreamDemo_show_int(x0: int): void = $exname()
implfun
JS_StreamDemo_next() =
let
val opt = StreamDemo$next<int>()
in
case- opt of optn_cons(x0) => JS_StreamDemo_show_int(x0)
end (*let*) // end of [JS_StreamDemo_next]
//
end // end of [local]

(* ****** ****** *)

(* end of [JS_StreamDemo.dats] *)
