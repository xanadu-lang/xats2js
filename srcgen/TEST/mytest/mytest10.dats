(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload =
"prelude/DATS/CATS/JS/jsbasics.dats"
(* ****** ****** *)
val kxs =
XATS2JS_jsobjmap_make_nil<string>()
(* ****** ****** *)
val-
optn_vt_nil() = 
XATS2JS_jsobjmap_insert_opt(kxs, "a", sint('a'))
val-
optn_vt_nil() = 
XATS2JS_jsobjmap_insert_opt(kxs, "b", sint('b'))
(* ****** ****** *)
val keys =
println("kxs['a'] = ", XATS2JS_jsobjmap_keyq(kxs, "a"))
val keys =
println("kxs['z'] = ", XATS2JS_jsobjmap_keyq(kxs, "z"))
(* ****** ****** *)

(* end of [mytest10.dats] *)
