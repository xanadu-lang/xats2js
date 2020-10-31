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

datatype
abc =
| A of int
| B of string
| C of (abc, abc)

(* ****** ****** *)

#extern
fun
print_abc
(x0: abc): void
impltmp
g_print<abc> = print_abc

(* ****** ****** *)

implfun
print_abc(x0) =
(
case+ x0 of
| A(int) =>
  print("A(", int, ")")
| B(str) =>
  print("B(", str, ")")
| C(x1, x2) =>
  print
  ("C(", x1, "; ", x2, ")")
)

(* ****** ****** *)

val a1 = A(5)
val b2 = B("5")
val c3 = C(a1, b2)

(* ****** ****** *)

val () = println("a1 = ", a1)
val () = println("b2 = ", b2)
val () = println("c3 = ", c3)

(* ****** ****** *)

(* end of [test-2020-10-29.dats] *)
