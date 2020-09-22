(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafe.sats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)

(*
val one = 1
val two = 2
val three = one + two
*)

(* ****** ****** *)

(*
impltmp
gint_add_sint_sint<>
  (x, y) =
(
JS_gint_add_sint_sint(x, y)
)
*)

(* ****** ****** *)
//
(*
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
*)
(*
fun
fact
(x: int): int =
loop(0, 1) where
{
fun
loop
( i: int
, r: int): int =
if i < x then loop(i+1, (i+1)*r) else r
}
*)
//
(* ****** ****** *)
(*
#extern
fun
fact2(x: int, r: int): int
implement
fact2(x, r) =
if x > 0 then fact2(x-1, x*r) else r
*)
(* ****** ****** *)
(*
#extern
fun
fact2(x: int)(r: int): int
implement
fact2(x)(r) =
if x > 0 then fact2(x-1)(x*r) else r
*)
(* ****** ****** *)
(*
fun
test_p2tr_get
((*void*)): int =
let
var x0: int = 1
val p0 = $addr(x0)
val () = (x0 := 10)
in
  x0 := x0 + x0; x0
end
*)
(* ****** ****** *)

val
_2_times =
lam(x: int) => x+x

(* ****** ****** *)

val () =
g_print("10 + 10 = ")
val () =
g_print(_2_times( 10 ))
val () = g_print( "\n" )

(* ****** ****** *)

(* end of [test01.dats] *)
