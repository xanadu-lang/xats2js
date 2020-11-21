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
length
(xs: list(int)): nint =
(
  loop(xs, 0)
) where
{
fun
loop(xs, res) =
(
case+ xs of
| list_nil() => res
| list_cons(_, xs) => loop(xs, res+1)
)
} (* end of [length] *)

(* ****** ****** *)
//
val xs =
list_cons
( 1
, list_cons(2, list_nil()))
//
val () =
println("length(", xs, ") = ", length(xs))
//
(* ****** ****** *)

(* end of [mytest06.dats] *)
