(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload "./StreaxDemo.dats"
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

local

val the_dir = a0ref_make(0)

in
//
fun
dir_set_next() = set(the_dir,  1)
fun
dir_set_prev() = set(the_dir, -1)
//
impltmp
StreaxDemo$dir<>() = get(the_dir)
//
end // end of [val]

(* ****** ****** *)

val
thePrimes_moves =
StreaxDemo_moves(thePrimes)
val
thePrimes_moves_ref =
a0ref_make(thePrimes_moves)

(* ****** ****** *)
//
#extern
fun
JS_StreaxDemo_next(): void = $exname()
#extern
fun
JS_StreaxDemo_prev(): void = $exname()
#extern
fun
JS_StreaxDemo_show_none(): void = $exname()
#extern
fun
JS_StreaxDemo_show_some(x0: int): void = $exname()
//
implfun
JS_StreaxDemo_next() =
let
val () =
dir_set_next()
val xs =
get(thePrimes_moves_ref)
val+strxcon_cons(x0, xs) = !xs
val () =
set(thePrimes_moves_ref, xs)
in
case- x0 of
| optn_cons(p0) => JS_StreaxDemo_show_some(p0)
end (*let*) // end of [JS_StreaxDemo_next]
//
implfun
JS_StreaxDemo_prev() =
let
val () =
dir_set_prev()
val xs =
get(thePrimes_moves_ref)
val+strxcon_cons(x0, xs) = !xs
val () =
set(thePrimes_moves_ref, xs)
in
case+ x0 of
| optn_nil() => JS_StreaxDemo_show_none()
| optn_cons(p0) => JS_StreaxDemo_show_some(p0)
end (*let*) // end of [JS_StreaxDemo_prev]
//
(* ****** ****** *)

(* end of [JS_StreaxDemo.dats] *)
