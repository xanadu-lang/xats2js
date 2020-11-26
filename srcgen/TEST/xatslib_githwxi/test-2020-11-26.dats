(* ****** ****** *)
(*
HX-2020-11-26:
For testing xdebug
*)
(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"xatslib\
/githwxi/DATS/xdebug.dats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
fun
fact1(x: int): int =
if x > 0
then x * fact1(x-1) else 1
(* ****** ****** *)
fun
fact2
(x: int, r: int): int =
if x > 0
then fact2(x-1, x*r) else r
(* ****** ****** *)

val () =
FI$pinfo(fact1) where
{
  impltmp FI$name<>() = "fact1"
}
val () =
FI$pinfo(fact2) where
{
  impltmp FI$name<>() = "fact2"
}

(* ****** ****** *)

(* end of [test-2020-11-26.dats] *)
