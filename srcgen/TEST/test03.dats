(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
(* ****** ****** *)

(*
val-
list_cons
( x1
, list_nil()) =
list_cons(1, list_cons(2, list_nil()))
val x2 = x1 + x1
*)

(* ****** ****** *)

datatype
mylist =
mylist_nil | mylist_cons of (int, mylist)

(* ****** ****** *)

fun
mylist_length
(xs: mylist): int =
(
case+ xs of
| mylist_nil() => 0
| mylist_cons(_, xs) => 1 + mylist_length(xs)
)

(* ****** ****** *)

(* end of [test03.dats] *)
