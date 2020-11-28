(*
(* ****** ****** *)
//
// HX-2020-10-20:
// Porting from:
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)
*)
(* ****** ****** *)
#include
"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

#define N 8

(* ****** ****** *)

abstbox board

(* ****** ****** *)

#extern
fun
board_nil(): board
#extern
fun
board_cons
(x0: int, xs: board): board

(* ****** ****** *)

local

absimpl board = list(int)

in(* in-of-local *)

implfun
board_nil() = list_nil()
implfun
board_cons(x0, xs) = list_cons(x0, xs)

impltmp
gseq_streamize
<board><int>(xs) = list_streamize<int>(xs)

end (* end of [local] *)

(* ****** ****** *)

impltmp
g_print<board>(xs) =
let
impltmp
rforeach$work<int>(x0) =
(
  loop(0)) where
{
fun
loop(i0: int): void =
if
i0 >= N
then
println((*void*))
else
(
if
(i0 = x0)
then print "Q "
else print ". "; loop(i0+1)
)
}
in
gseq_rforeach<board><int>(xs)
end (* end of [board_print] *)

(* ****** ****** *)

fun
board_check
  (x0, xs) =
(
gseq_iforall<board><int>(xs)
) where
{
impltmp
iforall$test<int>(i1, x1) =
if
(x0 != x1)
then (abs(x0 - x1) != i1 + 1) else false
} (* end of [board_check] *)

(* ****** ****** *)

fun
board_extend
  (xs) =
(
  auxmain(0) ) where
{
fun
auxmain(i0) =
if
(i0 < N) then
(
if
~board_check
 ( i0 , xs )
then auxmain(i0+1)
else
list_cons
(board_cons(i0, xs), auxmain(i0+1))
)
else list_nil((*void*))
}

fun
boardlst_extend(xss) =
(
gseq_foldr<xz><xs><r0>(xss, list_nil())
) where
{
typedef xs = board
typedef xz = list(board)
typedef r0 = list(board)
impltmp
foldr$fopr
<xs><r0>
(xs, r0) = list_append(board_extend(xs), r0)
}

(* ****** ****** *)

fun
qsolve() =
(
  loop(0, list_sing(board_nil()))
) where
{
  fun
  loop
  (i0: int, xss) =
  if i0 < N then loop(i0+1, boardlst_extend(xss)) else xss
}

(* ****** ****** *)

val () =
let
//
val
xss = qsolve()
//
val () =
(
gseq_iforeach(xss)
) where
{
impltmp
iforeach$work<board>(i0, xs) = println("Solution#", i0+1, ":\n", xs)
}
end // end of [val]

(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)
