(* ****** ****** *)
#staload "./../myprint.dats"
(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)

val cs =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
val cs = listize(cs)
val () = println("cs = ", cs)

(* ****** ****** *)
val
the_input = "1\n2\n3\n"
val
the_lines =
string_split_lines(the_input)
(* ****** ****** *)
val () =
loop(1, the_lines) where
{
fun
loop
( i0: int
, xs: stream_vt(string)): void =
(
case+ !xs of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(x0, xs) =>
(println("line#", i0, " = ", x0); loop(i0+1, xs))
)
}
(* ****** ****** *)

(* end of [test-2020-11-03.dats] *)
