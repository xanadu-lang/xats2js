(* ****** ****** *)
//
// HX: Sample
// factorial(n) = 1*2*...*n 
//
#extern
fun
factorial : int -> int
//
(* ****** ****** *)
(*
** 
** Finding the number
** of bits in int-values
**
*)
(* ****** ****** *)
//
// HX: 5 points
// The function int_test should
// return the size of an integer in C
// where the size means the number of bits.
// Note that you should only use comparison
// and addition in the implementation of the
// following function [int_test].
//
#extern
fun int_test((*void*)): int
//
(* ****** ****** *)
//
// HX: 10 points
// The function [gheep] is defined as follows:
//
#extern
fun ghaap(n: int): int =
(
  if
  (n >= 2)
  then n * ghaap(n-1) * ghaap(n-2)
  else (n+1)
  // end of [if]
)
//
// Please implement a tail-recursive function gheep
// such thats gheep(n) = ghaap(n) for all integers n
//
#extern fun gheep(n: int): int
//
(* ****** ****** *)
#define nil intlist_nil
#define :: intlist_cons
#define cons intlist_cons
(* ****** ****** *)
//
datatype
intlist =
| intlist_nil of ()
| intlist_cons of (int, intlist)
//
(* ****** ****** *)
//
// HX: 15 points
//
// intlist_append returns the concatenation
// of two given integer lists. For instance,
// given xs=(0,2,4) and ys = (1,3,5), then the
// returned list is (0, 2, 4, 1, 3, 5)
// Please give a tail-recursive implementation
// of intlist_append.
//
#extern
fun
intlist_append: (intlist, intlist) -> intlist
//
(* ****** ****** *)

(* end of [assign00.dats] *)
