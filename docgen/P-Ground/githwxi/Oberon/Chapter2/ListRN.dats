(*
Programming in OBERON, page 12
*)
(* ****** ****** *)
#include
"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

#staload RN = "./RandomNumbers.dats"

(* ****** ****** *)

#extern
fun
List(): void =
let
//
val m = 100
//
fun
loop(i: int): void =
if
(i < m)
then
(
loop(i+1) where
{
val () =
println("RN", i, ": \t", $RN.Uniform())
}
)
//
in
  loop(0)
end // end of [List]

(* ****** ****** *)

val () = List()

(* ****** ****** *)

(* end of [ListRN.dats] *)
