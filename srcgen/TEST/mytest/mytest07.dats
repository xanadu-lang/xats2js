(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

fun
imul1
( x: int
, y: int): int =
(
  *(x, y) ) where
{
  #prefix * of 1000
}

(* ****** ****** *)

val () =
println
("imul1(1*2, 12) = ", imul1(1*2, 12))

(* ****** ****** *)

fun
iadd1
( x: int
, y: int): int =
(
  (x, y)+ ) where
{
  #postfix + of 1000
}

(* ****** ****** *)

val () =
println
("iadd1(8+9, 89) = ", iadd1(8+9, 89))

(* ****** ****** *)

(* end of [mytest07.dats] *)
