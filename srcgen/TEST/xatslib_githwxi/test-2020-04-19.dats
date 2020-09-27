(* ****** ****** *)
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude/DATS/list.dats"
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)

val xs =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4,
list_cons(5, list_nil())))))

(* ****** ****** *)
//
val xss = list_nchoose1(xs, 2)
val len = stream_vt_length(xss)
//
val (  ) =
( g_print("len = ")
; g_print( len ); g_print('\n') )
//
(* ****** ****** *)
//
val xss2 = list_nchoose2(xs, 2)
val len2 = stream_vt_length(xss2)
//
val (  ) =
( g_print("len2 = ")
; g_print( len2 ); g_print('\n') )
//
(* ****** ****** *)

(* end of [test-2020-04-19.dats] *)
