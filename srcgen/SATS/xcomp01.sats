(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: August, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#staload "./intrep1.sats"
(* ****** ****** *)
#define
XANADU_targetloc
"./../../xanadu/srcgen/xats"
(* ****** ****** *)
//
#staload
"{$XANADU}/SATS/lexing.sats"
//
#staload
"{$XANADU}/SATS/intrep0.sats"
//
(* ****** ****** *)

absvtype
compenv_vtbox = ptr
vtypedef
compenv = compenv_vtbox

(* ****** ****** *)
//
fun
xcomp01_lcmdadd
( env:
! compenv, lcmd: l1cmd): void
//
(* ****** ****** *)
//
fun
xcomp01_lcmdpush_nil
( env: !compenv ): void
//
fun
xcomp01_lcmdpop0_blk
( env: !compenv): l1blk
fun
xcomp01_lcmdpop0_lst
( env: !compenv): l1cmdlst
//
(* ****** ****** *)

fun
xcomp01_h0exp_val
( env:
! compenv, h0e0: h0exp): l1val
fun
xcomp01_h0exp_set
( env:
! compenv, h0e0: h0exp, tres: l1tmp): void

(* ****** ****** *)
//
fun
xcomp01_h0exp_blk
( env:
! compenv, h0e0: h0exp, tres: l1tmp): l1blk
fun
xcomp01_h0expopt_blk
( env:
! compenv, opt0: h0expopt, tres: l1tmp): l1blk
//
(* ****** ****** *)

(* end of [xats_xcomp01.sats] *)
