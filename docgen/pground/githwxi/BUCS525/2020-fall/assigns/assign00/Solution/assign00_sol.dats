#include
"./../../../../../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#include "./../assign00.dats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

implfun
factorial
  (n0) =
(
loop(0, 1)) where
{
fun
loop
(i0: int, r0: int) =
if i0 < n0
then
let
val i1 = i0+1 in loop(i1, i1*r0)
end
else r0
} (* end of [factorial] *)

(* ****** ****** *)

val () =
println
("factorial(10)=", factorial(10))

(* ****** ****** *)

implfun
gheep(n0) =
(
if
(n0 >= 2)
then loop(2, 2, 1) else (n0+1)
) where
{
fun
loop
( i0: int
, r1: int, r0: int): int =
let
val r2 = i0 * r1 * r0
in
if
(i0 < n0)
then loop(i0+1, r2, r1) else r2
end
} (*where*) // end of [gheep]

(* ****** ****** *)

val () =
println("ghaap(3) = ", ghaap(3))
val () =
println("gheep(3) = ", gheep(3))

(* ****** ****** *)

implfun
intlist_append
  (xs, ys) =
(
rappend(reverse(xs), ys)
) where
{
fun
reverse(xs) = rappend(xs, nil())
and
rappend(xs, ys) =
(
case+ xs of
| intlist_nil() => ys
| intlist_cons(x0, xs) => rappend(xs, cons(x0, ys))
)
} (* end of [mylist_append] *)

(* ****** ****** *)
//
fun
intlist_print
(xs: intlist): void =
(
  auxlst(xs, 0)
) where
{
fun
auxlst(xs, i0) =
case+ xs of
|
intlist_nil() => ()
|
intlist_cons(x0, xs) =>
(if i0 > 0
 then print(";");
 print(x0); auxlst(xs, i0+1))
}

impltmp
g_print<intlist> = intlist_print
//
(* ****** ****** *)

val xs = 1 :: 2 :: nil()
val ys = cons(3, cons(4, cons(5, nil())))

(* ****** ****** *)

val () = println("xs = ", xs)
val () = println("ys = ", ys)
val () = println("xs+ys = ", intlist_append(xs, ys))

(* ****** ****** *)

(* end of [assign00_sol.dats] *)
