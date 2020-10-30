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
#staload
"prelude\
/DATS/CATS/JS/g_print.dats"
(* ****** ****** *)

#symload
nil_vt with strmcon_vt_nil
#symload
cons_vt with strmcon_vt_cons

(* ****** ****** *)

fun
sieve
( xs
: stream_vt(int)
)
: stream_vt(int) =
$llazy
(
let
val xs = $eval(xs)
in
case- xs of
|
~cons_vt(x0, xs) =>
 cons_vt(x0, sieve(filter(xs, x0)))
endlet
) (* end of [sieve] *)

and
filter
(xs, x0) =
$llazy
(
let
val xs = $eval(xs)
in
case- xs of
|
~cons_vt(x1, xs) =>
(
  if
  (x1%x0=0)
  then $eval(filter(xs, x0))
  else cons_vt(x1, filter(xs, x0))
)
endlet
) // end of [filter]

(* ****** ****** *)

val
xs =
sieve(from(2)) where
{
fun
from(n) = $llazy(cons_vt(n, from(n+1)))
}

(* ****** ****** *)

val-
~cons_vt(x0, xs) = $eval(xs) // x0 = 2
val-
~cons_vt(x1, xs) = $eval(xs) // x1 = 3
val-
~cons_vt(x2, xs) = $eval(xs) // x2 = 5
val-
~cons_vt(x3, xs) = $eval(xs) // x3 = 7
val-
~cons_vt(x4, xs) = $eval(xs) // x4 = 11
val-
~cons_vt(x5, xs) = $eval(xs) // x4 = 13

(* ****** ****** *)

val () =
( g_print("x0 = ")
; g_print(x0); g_print('\n') )
val () =
( g_print("x1 = ")
; g_print(x1); g_print('\n') )
val () =
( g_print("x2 = ")
; g_print(x2); g_print('\n') )
val () =
( g_print("x3 = ")
; g_print(x3); g_print('\n') )
val () =
( g_print("x4 = ")
; g_print(x4); g_print('\n') )
val () =
( g_print("x5 = ")
; g_print(x5); g_print('\n') )

(* ****** ****** *)

(* end of [sieve_vt.dats] *)
