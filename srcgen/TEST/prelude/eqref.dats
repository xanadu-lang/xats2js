(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/bool.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/char.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/gint.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/g_eqref.dats"
(* ****** ****** *)
#staload "./../myprint.dats"
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

val () =
println("0===0: ", g_eqref(0, 0))
val () =
println("'0'==='0': ", g_eqref('0', '0'))
val () =
println("true!==true: ", g_neqrf(true, true))

(* ****** ****** *)

(* end of [eqref.dats] *)
