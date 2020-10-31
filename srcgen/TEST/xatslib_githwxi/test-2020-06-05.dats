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
//
fun
string_permutize
( cs
: string)
: stream_vt(string) =
gseq_permutize<string><cgtz>(cs)
//
(* ****** ****** *)

val cs1 = "12345"
val css = string_permutize(cs1)
val css = stream_vt_print_len(css, 6)
val ( ) = g_print("\n")

(* ****** ****** *)

(* end of [test-2020-06-05.dats] *)
