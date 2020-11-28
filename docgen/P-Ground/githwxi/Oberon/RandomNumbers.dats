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

typedef real = double

(* ****** ****** *)
val a = 16807
val m = 2147483647
val q = m/a and r = m%a
(* ****** ****** *)
val z = a0ref_make<int>(314159)
(* ****** ****** *)
#extern
fun
Uniform(): real =
(
z[] * (1.0 / m)) where
{
val b = z[]
val gamma =
a * (b % q) - r * (b / q)
val ((*void*)) =
if
(gamma > 0)
then z.set(gamma) else z.set(m+gamma)
}
(* ****** ****** *)
#extern
fun
InitSeed(seed: int): void = z.set(seed)
(* ****** ****** *)

(*
val () = println("pi = ", 314159/1E5)
val () = println("rand = ", Uniform())
val () = println("rand = ", Uniform())
val () = println("rand = ", Uniform())
*)

(* ****** ****** *)

(* end of [RandomNumbers.dats] *)
