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
#extern
fun<>
mylist_append
(xs: mylist, ys: mylist): mylist
implement
<>
mylist_append
  (xs, ys) =
(
  append(xs, ys)
) where
{
fun
append
(xs: mylist, ys: mylist): mylist =
case+ xs of
| mylist_nil() => ys
| mylist_cons(x0, xs) =>
  mylist_cons(x0, append(xs, ys))
}
(* ****** ****** *)

val mylist0 = mylist_nil()
val mylist123 =
mylist_cons(1, mylist_cons(2, mylist_cons(3, mylist_nil())))

(* ****** ****** *)

val mylist1230 = mylist_append(mylist123, mylist0)

(* ****** ****** *)

(* end of [test03.dats] *)
