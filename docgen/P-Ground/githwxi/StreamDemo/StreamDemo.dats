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
StreamDemo$dir(): int
//
#extern
fun
<a:t0>
StreamDemo_moves
(xs: stream(a)): stream(optn(a))
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
StreamDemo_moves
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
: stream(optn(a)) =
$lazy
(
let
val dir =
StreamDemo$dir<>()
in
if
(dir > 0)
then
(
case+ zs of
|
list_nil() =>
strmcon_cons
(none(), aux0(ys, zs))
|
list_cons(z0, xs) =>
strmcon_cons
( some(z0)
, aux0(list_cons(z0, ys), zs)
)
) (* end of [then] *)
else
(
case+ ys of
|
list_nil() =>
strmcon_cons
(none(), aux0(ys, zs))
|
list_cons(y0, ys) =>
strmcon_cons
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
: stream(optn(a)) =
$lazy
(
let
val dir =
StreamDemo$dir<>()
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
strmcon_cons
(none(), aux0(ys, zs))
|
strmcon_cons(x0, xs) =>
strmcon_cons
( some(x0)
, aux1(xs, list_cons(x0, ys), zs)
)
) (* end of [list_nil] *)
|
list_cons(z0, zs) =>
strmcon_cons
( some(z0)
, aux1(xs, list_cons(z0, ys), zs)
)
) (* end of [then] *)
else
(
case+ ys of
|
list_nil() =>
strmcon_cons
(none(), aux1(xs, ys, zs))
|
list_cons(y0, ys) =>
strmcon_cons
( some(y0)
, aux1(xs, ys, list_cons(y0, zs))
)
) (* end of [else] *)
end ) (*let*) // end of [aux1]
(* ****** ****** *)
} (*where*) // end of [StreamDemo_moves]

(* ****** ****** *)

(* end of [StreamDemo.dats] *)
