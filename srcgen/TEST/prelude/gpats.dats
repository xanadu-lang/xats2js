(* ****** ****** *)
//
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gord.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gseq.dats"
#staload _ =
"prelude/DATS/unsafe.dats"
//
(* ****** ****** *)
//
#staload _ =
"prelude/DATS/bool.dats"
#staload _ =
"prelude/DATS/char.dats"
#staload _ =
"prelude/DATS/gint.dats"
#staload _ =
"prelude/DATS/string.dats"
#staload _ =
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/basics.dats"
(* ****** ****** *)

#staload "./../print.dats"

(* ****** ****** *)

fun
fact(n: int): int =
(
case+ n of
| 0 => 1
| _(*else*) => n * fact(n-1)
) (* end of [fact] *)
val () = println("fact10 = ", fact(10))

(* ****** ****** *)

(*
fun
fact(n: int): int =
(
case+ n of
| _ when (n<=0) => 1
| _ (*else*) => n * fact(n-1)
) (* end of [fact] *)
*)

(* ****** ****** *)

fun
fibo(n: int): int =
(
case+ n of
| 0 => 0
| 1 => 1
| _(*else*) => fibo(n-1)+fibo(n-2)
) (* end of [fibo] *)
val () = println("fibo10 = ", fibo(10))

(* ****** ****** *)

(*
fun
fibo(n: int): int =
(
case+ n of
| _ when (n=0) => 0
| _ when (n=1) => 1
| _ (*else*) => fibo(n-1)+fibo(n-2)
) (* end of [fibo] *)
*)

(* ****** ****** *)

(* end of [gpats.dats] *)
