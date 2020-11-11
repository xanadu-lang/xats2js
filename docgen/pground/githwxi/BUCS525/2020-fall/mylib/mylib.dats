(* ****** ****** *)
//
// HX: For use in
// BUCS525-2020-fall
//
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
|
mylist_nil of ()
|
mylist_cons of (a, mylist(a))
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
impltmp
<a>(*tmp*)
print_myoptn
  (xs) = 
(
case+ xs of
|
myoptn_nil() => 
print("nil()")
|
myoptn_cons(x0) =>
print("cons(", x0, ")")
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

impltmp
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
(
if
i0 > 0
then print(";")) ;
print(x0); auxlst(i0+1, xs)
//
)
) (* end of [auxlst] *)
} (* end of [print_mylist] *)

(* ****** ****** *)

(* end of [mylib.dats] *)
