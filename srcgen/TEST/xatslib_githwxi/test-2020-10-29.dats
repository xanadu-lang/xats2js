(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gfor.dats"
#staload
"prelude/DATS/gfun.dats"
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gios.dats"
(* ****** ****** *)
#staload
"prelude/DATS/rand.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/gflt.dats"
#staload
"prelude/DATS/string.dats"
#staload
"prelude/DATS/string_vt.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/list.dats"
#staload
"prelude/DATS/array.dats"
#staload
"prelude/DATS/stream.dats"
//
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/basics.dats"
(* ****** ****** *)

#staload "./../print.dats"

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
