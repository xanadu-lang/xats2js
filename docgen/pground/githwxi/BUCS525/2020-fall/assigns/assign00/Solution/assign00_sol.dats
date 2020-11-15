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
("factorial(10) = ", factorial(10))

(* ****** ****** *)

(* end of [assign00_sol.dats] *)
