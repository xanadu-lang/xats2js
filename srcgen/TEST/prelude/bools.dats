(* ****** ****** *)
#staload _ =
"prelude/DATS/bool.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/char.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)
//
#staload _ =
"prelude/DATS/synougat.dats"
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

val b0 = true
val b1 = not(b0)
val () = g_print(b0)
val () = char_print( '\n' )
val () = g_print(b1)
val () = char_print( '\n' )
val () = g_print(b0 + b1)
val () = char_print( '\n' )
val () = g_print(b0 * b1)
val () = char_print( '\n' )

(* ****** ****** *)

(* end of [bools.dats] *)
