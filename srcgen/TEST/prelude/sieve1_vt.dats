(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)
#staload "./../myprint.dats"
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
fun
sieve
( xs
: stream_vt(int)) =
$llazy
(
g_free(xs);
let
val xs = !xs
in
case- xs of
|
~strmcon_vt_cons(x0, xs) =>
(
 strmcon_vt_cons
 (x0, sieve(stream_vt_filter0(xs)))
) where
{
implement
filter0$test<int>(x1) = (x1 % x0 > 0)
}
end
) (* end of [sieve] *)

(* ****** ****** *)

val
xs =
sieve(from(2)) where
{
fun
from(n) =
$llazy(strmcon_vt_cons(n, from(n+1)))
}

(* ****** ****** *)

val-
~strmcon_vt_cons(x0, xs) = !xs // x0 = 2
val-
~strmcon_vt_cons(x1, xs) = !xs // x1 = 3
val-
~strmcon_vt_cons(x2, xs) = !xs // x2 = 5
val-
~strmcon_vt_cons(x3, xs) = !xs // x3 = 7
val-
~strmcon_vt_cons(x4, xs) = !xs // x4 = 11
val-
~strmcon_vt_cons(x5, xs) = !xs // x5 = 13

(* ****** ****** *)

val () = println("x0 = ", x0)
val () = println("x1 = ", x1)
val () = println("x2 = ", x2)
val () = println("x3 = ", x3)
val () = println("x4 = ", x4)
val () = println("x5 = ", x5)

(* ****** ****** *)

(* end of [sieve1_vt.dats] *)
