(* ****** ****** *)
#staload
REQ = "./required.dats"
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#define none optn_nil
#define some optn_cons
(* ****** ****** *)
//
#extern
fun<>
StreaxDemo2$dir(): int
//
#extern
fun
<a:t0>
StreaxDemo2_moves
(xs: stream(a)): streax(optn(a))
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
StreaxDemo2_moves
  (xs) =
(
let
val
ys = list_nil()
and
zs = list_nil()
in
  aux1(xs, ys, zs)
end
) where
{
(* ****** ****** *)
fun
aux0
( ys: list(a)
, zs: list(a))
: streax(optn(a)) =
$lazy
(
let
val dir =
StreaxDemo2$dir<>()
in
if
(dir > 0)
then
(
case+ zs of
|
list_nil() =>
strxcon_cons
(none(), aux0(ys, zs))
|
list_cons(z0, xs) =>
strxcon_cons
( some(z0)
, aux0(list_cons(z0, ys), zs)
)
) (* end of [then] *)
else
(
case+ ys of
|
list_nil() =>
strxcon_cons
(none(), aux0(ys, zs))
|
list_cons(y0, ys) =>
strxcon_cons
( some(y0)
, aux0(ys, list_cons(y0, zs))
)
) (* end of [else] *)
end ) (*let*) // end of [aux0]
(* ****** ****** *)
fun
aux1
( xs
: stream(a)
, ys: list(a)
, zs: list(a))
: streax(optn(a)) =
$lazy
(
let
val dir =
StreaxDemo2$dir<>()
in
if
(dir > 0)
then
(
case+ zs of
|
list_nil() =>
(
case+ !xs of
|
strmcon_nil() =>
strxcon_cons
(none(), aux0(ys, zs))
|
strmcon_cons(x0, xs) =>
strxcon_cons
( some(x0)
, aux1(xs, list_cons(x0, ys), zs)
)
) (* end of [list_nil] *)
|
list_cons(z0, zs) =>
strxcon_cons
( some(z0)
, aux1(xs, list_cons(z0, ys), zs)
)
) (* end of [then] *)
else
(
case+ ys of
|
list_nil() =>
strxcon_cons
(none(), aux1(xs, ys, zs))
|
list_cons(y0, ys) =>
strxcon_cons
( some(y0)
, aux1(xs, ys, list_cons(y0, zs))
)
) (* end of [else] *)
end ) (*let*) // end of [aux1]
(* ****** ****** *)
} (*where*) // end of [StreaxDemo2_moves]

(* ****** ****** *)
local

val the_dir = a0ref_make(0)

in(*in-of-local*)
//
fun
dir_set_next() = set(the_dir,  1)
fun
dir_set_prev() = set(the_dir, -1)
//
impltmp
StreaxDemo2$dir<>() = get(the_dir)
//
end // end of [val]
(* ****** ****** *)
//
val
theStream_moves =
StreaxDemo2_moves
($REQ.StreaxDemo2_stream((*void*)))
//
val
theStream_moves_ref = a0ref_make(theStream_moves)
//
(* ****** ****** *)
//
#extern
fun
StreaxDemo2_control_next(): void = $exname()
#extern
fun
StreaxDemo2_control_prev(): void = $exname()
#extern
fun
JS_StreaxDemo2_show_none(): void = $exname()
#extern
fun
JS_StreaxDemo2_show_some(x0: int): void = $exname()
//
(* ****** ****** *)
//
implfun
StreaxDemo2_control_next
  ((*void*)) =
let
val () =
dir_set_next()
val xs =
get(theStream_moves_ref)
val+strxcon_cons(x0, xs) = !xs
val () =
set(theStream_moves_ref, xs)
in
case- x0 of
| optn_cons(f0) => JS_StreaxDemo2_show_some(f0)
end (*let*) // end of [StreaxDemo2_control_next]
//
implfun
StreaxDemo2_control_prev
  ((*void*)) =
let
val () =
dir_set_prev()
val xs =
get(theStream_moves_ref)
val+strxcon_cons(x0, xs) = !xs
val () =
set(theStream_moves_ref, xs)
in
case+ x0 of
| optn_nil() => JS_StreaxDemo2_show_none()
| optn_cons(f0) => JS_StreaxDemo2_show_some(f0)
end (*let*) // end of [StreaxDemo2_control_prev]
//
(* ****** ****** *)

(* end of [StreaxDemo2.dats] *)
