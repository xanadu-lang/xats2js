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

#extern
fun
<ans:type>
kfact
( n: int
, k: int -<cref> ans): ans

implement
<ans>
kfact =
fix
kf(n, k0) =>
if n > 0
then kf(n-1, lam(r) => k0(n * r))
else k0(1) // end of [if]

val
fact =
lam(n) => kfact<int>(n, lam r => r)

(* ****** ****** *)

val fact10 =
let val ans = fact(10) in ans end

(* ****** ****** *)
//
val () =
( g_print("fact10 = ");
  g_print(fact10); g_print("\n") )
//
(* ****** ****** *)

(* end of [kfact.dats] *)
