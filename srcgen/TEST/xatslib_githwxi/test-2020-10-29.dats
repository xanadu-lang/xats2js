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

datatype ab =
| A of int | B of string

(* ****** ****** *)

fun
print_ab(ab) =
(
case+ ab of
| A(int) =>
  print("A(", int, ")")
| B(str) =>
  print("B(", str, ")")
)

(* ****** ****** *)

impltmp
g_print<ab> = print_ab

(* ****** ****** *)

val ab1 = A(5)
val ab2 = B("5")

(* ****** ****** *)

val () = println("ab1 = ", ab1)
val () = println("ab2 = ", ab2)

(* ****** ****** *)

(* end of [test-2020-10-29.dats] *)
