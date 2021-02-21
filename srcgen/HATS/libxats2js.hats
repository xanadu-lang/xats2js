(* ****** ****** *)
//
(*
#ifdef
XATS2JS$XATSOPT_targetloc
#then
#define
XATSOPT_targetloc
XATS2JS$XATSOPT_targetloc
#endif // end of [#ifdef]
*)
//
#ifdef
XATSOPT_targetloc
#then
// it is already defined
#else
#define
XATSOPT_targetloc
"./../../xatsopt/srcgen/xats"
#endif
//
(* ****** ****** *)
#staload
"{$XATSOPT}/SATS/xbasics.sats"
(* ****** ****** *)
#staload STM =
"{$XATSOPT}/SATS/xstamp0.sats"
(* ****** ****** *)
#staload SYM =
"{$XATSOPT}/SATS/xsymbol.sats"
(* ****** ****** *)
#staload LAB =
"{$XATSOPT}/SATS/xlabel0.sats"
(* ****** ****** *)
#staload GLO =
"{$XATSOPT}/SATS/xglobal.sats"
(* ****** ****** *)
#staload ERR =
"{$XATSOPT}/SATS/xerrory.sats"
(* ****** ****** *)
#staload FP0 =
"{$XATSOPT}/SATS/filpath.sats"
(* ****** ****** *)
#staload LOC =
"{$XATSOPT}/SATS/locinfo.sats"
(* ****** ****** *)
//
#staload LEX =
  "{$XATSOPT}/SATS/lexing0.sats"
#staload PAR =
  "{$XATSOPT}/SATS/parsing.sats"
//
(* ****** ****** *)
#staload D0E =
  "{$XATSOPT}/SATS/dynexp0.sats"
(* ****** ****** *)
#staload S1E =
  "{$XATSOPT}/SATS/staexp1.sats"
#staload S2E =
  "{$XATSOPT}/SATS/staexp2.sats"
(* ****** ****** *)
//
#staload INTREP0 =
  "{$XATSOPT}/SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload XATSOPT =
  "{$XATSOPT}/SATS/xatsopt.sats"
//
(* ****** ****** *)

(* end of [libxats2js.hats] *)
