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

val Ab = "Ab"
val ab = string_lower(Ab)
val AB = string_upper(ab)
val () = println("Ab = ", Ab)
val () = println("ab = ", ab)
val () = println("AB = ", AB)

(* ****** ****** *)
val () =
println("('a' - 'b') = ", 'a' - 'b')
(* ****** ****** *)

(* end of [mytest03.dats] *)
