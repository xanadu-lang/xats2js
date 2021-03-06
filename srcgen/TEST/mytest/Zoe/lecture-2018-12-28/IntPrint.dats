(* ****** ****** *)
#include
"./../../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

fun
foo(x: int): void =
if
(x < 10)
then println(x)
else (println(x%10); foo(x/10))

(* ****** ****** *)

fun
bar(x: int): void =
if
(x < 10)
then println(x)
else (bar(x/10); println(x%10))

(* ****** ****** *)

val () =
mymain0() where {fun mymain0() = bar(12345)}

(* ****** ****** *)

(* end of [IntPrint.dats] *)
