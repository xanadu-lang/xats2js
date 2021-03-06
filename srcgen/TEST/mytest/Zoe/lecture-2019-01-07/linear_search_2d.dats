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
search
( m: int, n: int
, f: (int, int) -> bool): (int, int) =
(
loop1(0)
) where
{
fnx
loop1(i: int): (int, int) =
if i < m then loop2(i, 0) else (-1, -1)

and
loop2(i: int, j: int): (int, int) =
if
(j < n)
then
(
if f(i, j) then (i, j) else loop2(i, j + 1)
)
else loop1(i + 1)
}

(* ****** ****** *)

#define N 11111

(* ****** ****** *)

val () =
mymain0() where
{
fun
mymain0() = let
  val f0 =
  lam
  ( i: int
  , j: int): bool => (i * j = N) 
  val (i0, j0) = search(N, N, f0)
in
  println("i0 = ", i0); println("j0 = ", j0);
end
}

(* ****** ****** *)

(* end of [linear_search_2d.dats] *)
