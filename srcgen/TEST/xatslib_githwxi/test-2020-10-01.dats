(* ****** ****** *)
//
// HX-2020-10-31:
// This example is directly
// taken from the Intro-to-ATS
// book!
//
(* ****** ****** *)
#staload "./../print.dats"
(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)
//
typedef
int4 =
( int, int
, int, int)
//
val
theCoins =
(1, 5, 10, 25): int4
//
fun
coin_get
(n: int): int =
(
if n = 0 then theCoins.0
else
if n = 1 then theCoins.1
else
if n = 2 then theCoins.2
else
if n = 3 then theCoins.3 else -1(*err*)
) (* end of [coin_get] *)
//
fun
coin_change
(sum: int): int =
let
fun
aux
(sum: int, n: int): int =
if
(sum > 0)
then
(
if n >= 0
then
( aux(sum, n-1)
+ aux
  (sum-coin_get(n), n)) else 0
)
else (if sum < 0 then 0 else 1)
// end of [aux]
in
  aux (sum, 3)
end // end of [coin_change]
//
(* ****** ****** *)
//
val ans = coin_change(100)
//
val () =
(
println
("coin_change(100) = ", ans)
)
//
(* ****** ****** *)

(* end of [test-2020-10-01.dats] *)
