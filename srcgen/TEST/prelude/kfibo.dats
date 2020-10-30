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

fun
kfibo(n, k) =
if n > 1
then
kfibo
( n-1
, lam(r1) =>
  kfibo
  (n-2, lam(r2) => k(r1+r2))
)
else k(n)

val
fibo =
lam(n) => kfibo(n, lam r => r)

(* ****** ****** *)

val fibo10 =
let val ans = fibo(10) in ans end

(* ****** ****** *)
//
val () =
( g_print("fibo10 = ");
  g_print(fibo10); g_print("\n") )
//
(* ****** ****** *)

(* end of [kfibo.dats] *)
