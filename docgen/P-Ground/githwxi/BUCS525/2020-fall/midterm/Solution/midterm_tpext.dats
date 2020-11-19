(* ****** ****** *)
#staload
"./../..\
/mylib/mylib.dats"
(* ****** ****** *)
#staload
"./midterm_head0.dats"
(* ****** ****** *)
#include
"./../../../../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

absimpl
tpext_type = a0ref(type0opt)

(* ****** ****** *)

implfun
tpext_new() =
a0ref_make(myoptn_nil())

(* ****** ****** *)
implfun
tpext_get(X0) = a0ref_get(X0)
(* ****** ****** *)
implfun
tpext_set
(X0, tp) =
a0ref_set(X0, myoptn_cons(tp))
(* ****** ****** *)

implfun
tpext_eqref(X1, X2) = g_eqref(X1, X2)

(* ****** ****** *)

(* end of [midterm_tpext.dats] *)
