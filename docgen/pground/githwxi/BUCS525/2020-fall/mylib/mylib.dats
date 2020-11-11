(* ****** ****** *)
(*
HX: Option type
*)
datatype
myoptn(a:type) =
| myoptn_nil of () // none
| myoptn_cons of (a) // some
(* ****** ****** *)
(*
HX: Type For lists
*)
datatype
mylist(a:type) =
| mylist_nil of ()
| mylist_cons of (a, mylist(a))
//
(* ****** ****** *)
#extern
fun
<a:t0>
print_myoptn
(xs: myoptn(a)): void
(* ****** ****** *)
impltmp
{a:t0}
g_print
<myoptn(a)> = print_myoptn<a>
(* ****** ****** *)
implement
<a>(*tmp*)
print_myoptn
  (xs) = 
(
case+ xs of
|
myoptn_nil() => 
print(out, "nil()")
|
myoptn_cons(x0) =>
print(out, "cons(", x0, ")")
) (* end of [print_myoptn] *)
(* ****** ****** *)
#extern
fun
<a:t0>
print_mylist
(xs: mylist(a)): void
(* ****** ****** *)
impltmp
{a:t0}
g_print
<mylist(a)> = print_mylist<a>
(* ****** ****** *)

implement
{a:t0}
print_mylist
  (xs) =
(
  auxlst(0, xs)
) where
{
fun
auxlst
( i0: int
, xs: mylist(a)): void =
(
case+ xs of
|
mylist_nil() => ()
|
mylist_cons(x0, xs) =>
(
  if
  i0 > 0
  then print(out, ";");
  print(x0); auxlst(i0+1, xs)
)
) (* end of [auxlst] *)
} (* end of [print_mylist] *)

(* ****** ****** *)

(* end of [mylib.dats] *)
