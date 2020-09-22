(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)

fun
fact1(n) =
let
fun
loop(n: int, r: &int) =
  if
  (n > 0)
  then
  let
  val () =
  (r := n * r) in loop(n-1, r)
  end
  else ()
in
  let
  var r: int = 1
  in
    let val () = loop(n, r) in r end
  end
end

val fact10 = fact1(10)

(* ****** ****** *)

val
fact1_10 = fact1(10)
val () =
(
g_print
("fact1_10 = "); g_print(fact1_10); g_print("\n"))

(* ****** ****** *)

fun
fact2(n:int): int =
let
//
typedef
int2 = @(int, int)
//
fun
loop(nr: &int2): int =
if
(nr.0 > 0)
then
let
val n = nr.0
and r = nr.1
in
nr.0 := n-1;
nr.1 := n*r; loop(nr)
end
else nr.1 // end of [if]
//
in
  let var nr = @(n, 1) in loop(nr) end
end

(* ****** ****** *)

val
fact2_10 = fact2(10)
val () =
(
g_print
("fact2_10 = "); g_print(fact2_10); g_print("\n"))

(* ****** ****** *)

fun
fact3(n:int): int =
let
//
vwtpdef
int2 = $(int, int)
//
fun
loop(nr: &int2): int =
if
(nr.0 > 0)
then
let
val n = nr.0
and r = nr.1
in
nr.0 := n-1;
nr.1 := n*r; loop(nr)
end
else nr.1 // end of [if]
//
in
  let var nr = $(n, 1) in loop(nr) end
end

(* ****** ****** *)

val
fact3_10 = fact3(10)
val () =
(
g_print
("fact3_10 = "); g_print(fact3_10); g_print("\n"))

(* ****** ****** *)

(* end of [cbref.dats] *)
