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
//
#extern
fun
<a:type>
mylist_get_at_opt
( xs
: mylist(a), i0: int): myoptn(a)
//
(* ****** ****** *)
//
impltmp
<a>
mylist_get_at_opt
( xs, i0 ) =
(
  auxlst(xs, i0)
) where
{
fun
auxlst
(xs: mylist(a), i0: int): myoptn(a) =
(
case+ xs of
| mylist_nil() =>
  myoptn_nil()
| mylist_cons(x0, xs) =>
  if
  (i0 > 0)
  then auxlst(xs, i0-1) else myoptn_cons(x0)
)
} (* end of [mylist_get_at_opt] *)
//
(* ****** ****** *)
//
#extern
fun
<a:type>
<b:type>
mylist_map_cfr
( xs
: mylist(a)
, f0: (a) -<cfr> b): mylist(b)
//
(* ****** ****** *)

impltmp
<a><b>
mylist_map_cfr
(xs, f0) =
auxlst(xs) where
{
fun
auxlst
( xs
: mylist(a)): mylist(b) =
(
case+ xs of
| mylist_nil() =>
  mylist_nil()
| mylist_cons(x0, xs) =>
  mylist_cons(f0(x0), auxlst(xs))
)
}

(* ****** ****** *)

(* end of [mylib.dats] *)
