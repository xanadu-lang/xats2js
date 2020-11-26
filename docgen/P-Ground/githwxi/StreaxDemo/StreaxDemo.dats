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
StreaxDemo$dir(): int
//
#extern
fun
<a:t0>
StreaxDemo_moves
(xs: stream(a)): streax(optn(a))
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
StreaxDemo_moves
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
StreaxDemo$dir<>()
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
StreaxDemo$dir<>()
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
} (*where*) // end of [StreaxDemo_moves]

(* ****** ****** *)

(* end of [StreaxDemo.dats] *)
