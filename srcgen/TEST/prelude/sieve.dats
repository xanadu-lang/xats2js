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

#symload
nil with strmcon_nil
#symload
cons with strmcon_cons

(* ****** ****** *)

fun
sieve
( xs
: stream(int)) =
$lazy
(
let
val xs = $eval(xs)
in
case- xs of
|
cons(x0, xs) =>
cons(x0, sieve(filter(xs, x0)))
end
) (* end of [sieve] *)

and
filter(xs, x0) =
$lazy
(
let
val xs = $eval(xs)
in
case- xs of
|
cons(x1, xs) =>
(
  if
  (x1%x0=0)
  then
  $eval(filter(xs, x0))
  else cons(x1, filter(xs, x0))
)
endlet
) (* filter *)

(* ****** ****** *)

val
xs =
sieve(from(2)) where
{
fun
from(n) = $lazy(cons(n, from(n+1)))
}

(* ****** ****** *)

val-
cons(x0, xs) = $eval(xs) // x0 = 2
val-
cons(x1, xs) = $eval(xs) // x1 = 3
val-
cons(x2, xs) = $eval(xs) // x2 = 5
val-
cons(x3, xs) = $eval(xs) // x3 = 7
val-
cons(x4, xs) = $eval(xs) // x4 = 11
val-
cons(x5, xs) = $eval(xs) // x5 = 13

(* ****** ****** *)

val () = println("x0 = ", x0)
val () = println("x1 = ", x1)
val () = println("x2 = ", x2)
val () = println("x3 = ", x3)
val () = println("x4 = ", x4)
val () = println("x5 = ", x5)

(* ****** ****** *)

(* end of [sieve.dats] *)
