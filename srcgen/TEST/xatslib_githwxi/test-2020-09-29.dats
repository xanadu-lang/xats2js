(* ****** ****** *)
//
// Reported by
// HX-2017-09-29
//
(* ****** ****** *)
//
// HX-2020-09-29:
// [bar]
// needs to be generative
//
(* ****** ****** *)
//
// HX-2020-09-29:
// Note that
// it is fixed with generative
// implementation of exceptions
//
(* ****** ****** *)
//
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
#staload
"prelude\
/DATS/CATS/JS/g_print.dats"
(* ****** ****** *)

fun
foo
{n:nat}
(x: int(n)): int(n) =
let
excptcon bar of int(n)
in
if
(x = 0)
then
$raise bar(0)
else
try 1+foo(x-1) with ~bar(y) => y endtry
end // end of [foo]

(* ****** ****** *)
val foo1 = foo(1)
val (  ) =
( g_print("foo1 = ")
; g_print( foo1 ); g_print("\n"))
(* ****** ****** *)

(* end of [bug-2017-09-29] *)
