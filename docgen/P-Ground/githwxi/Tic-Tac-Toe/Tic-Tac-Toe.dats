(* ****** ****** *)
(*
** Tic-Tac-Toe:
** An experiment with React.js
**
** HX:
** Translated from a previous
** version done circa 2017-12-??
**
*)
(* ****** ****** *)
#include
"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
//
datatype
move =
MOVE of (int, int)
//
(* ****** ****** *)

#define X = 1
#define O = 2

(* ****** ****** *)
//
fun
player_next
  (p: int): int =
(
ifval(p = X, O, X)
)
//
(* ****** ****** *)
//
val
thePlayer = a0ref(X)
val
theWinner = a0ref(0)
val
theNMoves = a0ref(0)
val
theSquares =
a1ref_make_nval<int>(3*3, 0)
//
(* ****** ****** *)
//
fun
player2string(p: int) =
case+ p of
| X => "X" | O => "O" | _ => ""
//
(* ****** ****** *)
//
#extern
fun
theSquares_get
  (i: int, j: int): int = $exname()
#extern
fun
theSquares_get_text
  (i: int, j: int): string = $exname()
implfun
theSquares_get
  (i, j) = theSquares[3*i+j]
implfun
theSquares_get_text
  (i, j) =
  player2string(theSquares_get(i, j))
//
(* ****** ****** *)
//
#extern
fun
thePlayer_get
((*void*)): int = $exname()
implfun
thePlayer_get() = thePlayer[]
//
#extern
fun
theWinner_get
((*void*)): int = $exname()
implfun
theWinner_get() = theWinner[]
//
#extern
fun
theStatus_get
((*void*)): string = $exname()
implfun
theStatus_get() =
if
(
theWinner[] != 0
)
then
(
string_append
("The Winner: ", player2string(theWinner[]))
)
else
(
if
(
theNMoves[] >= 9
)
then
(
  "Game Over: No Winner!!!"
)
else
(
string_append
("Next Player: ", player2string(thePlayer[]))
)
)
//
(* ****** ****** *)

fun
theState_winner
  (): int = let
//
fun
check
(
i1: int, j1: int
,
i2: int, j2: int
,
i3: int, j3: int
) : bool =
(
(
theSquares[3*i1+j1] =
theSquares[3*i2+j2]
)
*
(
theSquares[3*i1+j1] =
theSquares[3*i3+j3]
)
)
//
in
//
(
if
check
(0, 0, 0, 1, 0, 2)
then theSquares[3*0+0]
else
(
if
check
(1, 0, 1, 1, 1, 2)
then theSquares[3*1+0]
else
(
if
check
(2, 0, 2, 1, 2, 2)
then theSquares[3*2+0]
else
(
(
if
check
(0, 0, 1, 0, 2, 0)
then theSquares[3*0+0]
else
(
if
check
(0, 1, 1, 1, 2, 1)
then theSquares[3*0+1]
else
(
if
check
(0, 2, 1, 2, 2, 2)
then theSquares[3*0+2]
else
(
if
check
(0, 0, 1, 1, 2, 2)
then theSquares[3*1+1]
else
(
if
check
(0, 2, 1, 1, 2, 0)
then theSquares[3*1+1]
else (0) // no winner
)
)
)
)
)
)
)
)
)
//
end // end of [theState_winner]

(* ****** ****** *)
//
#extern
fun
theState_update
  : (move) -> void
//
implfun
theState_update
  (MOVE(i, j)) = let
  val p1 = thePlayer[]
  val p2 = player_next(p1)
  val () = thePlayer[] := p2
  val () = theSquares[3*i+j] := p1
  val () = theNMoves[] := theNMoves[] + 1
  val () = theWinner[] := theState_winner()
in
  // nothing
end // end of [theState_update]
//
(* ****** ****** *)
//
#extern
fun
alert
(rep: string): void = $exname()
//
(* ****** ****** *)
//
#extern
fun
Square_handle_click
  (i: int, j: int): void = $exname()
//
(*
implfun
Square_handle_click
  (i, j) =
(
  alert(String(i) + String(j))
)
*)
implfun
Square_handle_click
  (i, j) = let
//
val x = theSquares_get(i, j)
//
in
//
if
(
theWinner[] != 0
)
then
(
alert
("The game is over!!!")
)
else
(
if
(
theNMoves[] >= 9
)
then
(
alert
("The game is over!!!")
)
else
(
if
(x <= 0)
then
theState_update(MOVE(i, j))
else
(
//
alert
("The square is already filled!!!")
//
)
)
)
end // end of [Square_handle_click]
//
(* ****** ****** *)

(* end of [Tic-Tac-Toe.dats] *)
