(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude/DATS/tuple.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/synougat.dats"
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
fun
fact1(x) =
if
x > 0
then
x*fact1(x-1) else 1
withtype ( int ) -> int
(* ****** ****** *)
val
fact1_10 = fact1(10)
val () =
(
g_print
("fact1_10 = ");
g_print(fact1_10); g_print("\n"))
(* ****** ****** *)
fun
fact2
{n}(x) =
if
x > 0
then
x*fact2(x-1) else 1
withtype {n:int}(int(n)) -> int
(* ****** ****** *)
val
fact2_10 = fact2(10)
val () =
(
g_print
("fact2_10 = ");
g_print(fact2_10); g_print("\n"))
(* ****** ****** *)

(* end of [wtype.dats] *)
