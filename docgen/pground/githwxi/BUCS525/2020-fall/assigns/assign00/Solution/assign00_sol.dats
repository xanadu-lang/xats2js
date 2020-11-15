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

(* end of [assign00_sol.dats] *)
