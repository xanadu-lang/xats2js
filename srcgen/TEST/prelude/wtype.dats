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
fact(x) =
if
x > 0
then
x*fact(x-1) else 1
withtype ( int ) -> int

(* ****** ****** *)
val
fact_10 = fact(10)
val () =
(
g_print
("fact_10 = "); g_print(fact_10); g_print("\n"))
(* ****** ****** *)

(* end of [wtype.dats] *)
