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
list_head1
(
list_cons
( x0, xs ) : list(int)) = x0
fun
list_tail1
(
list_cons
( x0, xs ) : list(int)) = xs

#extern
fun
list_head2: list(int) -> int
implfun
list_head2(list_cons(x0, _)) = x0
(* ****** ****** *)
//
val xs =
list_cons
( 1
, list_cons(2, list_nil()))
//
val () =
println
("list_head1(", xs, ") = ", list_head1(xs))
//
val () =
println
("list_head2(", "list_tail1(", xs, ")) = ", list_head2(list_tail1(xs)))
//
(* ****** ****** *)

(* end of [mytest04.dats] *)
