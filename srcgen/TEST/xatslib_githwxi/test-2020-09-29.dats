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
//
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
try
1+foo(x-1) with ~bar(y) => y endtry
end // end of [foo]
//
(* ****** ****** *)
(*
//
(*
HX:
throwing an exception
is the correct behavior!
*)
//
val foo1 = foo(1)
val (  ) = println("foo1 = ", foo1)
//
*)
(* ****** ****** *)

(* end of [bug-2017-09-29] *)
