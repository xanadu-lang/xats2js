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
vtypedef
l1tmpopt_vt = Option_vt(l1tmp)
vtypedef
l1valopt_vt = Option_vt(l1val)
//
(* ****** ****** *)
//
fun
compenv_make_nil
  ((*void*)): compenv
fun
compenv_free_nil
  (env0: compenv): void
//
(* ****** ****** *)
//
fun
xcomp01_program
  (prog: h0dclist): l1dclist
//
(* ****** ****** *)
//
fun
xcomp01_dvaradd_bind
( env0:
! compenv
, hdv0: hdvar
, l1v1: l1val): void
//
fun
xcomp01_dvaradd_fun0
  (env0: !compenv): void
fun
xcomp01_dvarpop_fun0
  (env0: !compenv): void
//
fun
xcomp01_dvarfind
( env0:
! compenv
, hdv0: hdvar): l1valopt_vt
//
(* ****** ****** *)
//
fun
xcomp01_lcmdadd
( env0:
! compenv, lcmd: l1cmd): void
//
(* ****** ****** *)
//
fun
xcomp01_lcmdpush_nil
( env0: !compenv ): void
//
fun
xcomp01_lcmdpop0_blk
( env0: !compenv): l1blk
fun
xcomp01_lcmdpop0_lst
( env0: !compenv): l1cmdlst
//
(* ****** ****** *)
//
// HX:
// for checking whether
// the pattern matches the value
//
fun
xcomp01_h0pat_ck0
( env0:
! compenv
, h0p0: h0pat
, l1v1: l1val): l1btf(*bool*)
//
// HX:
// for extracting values
// under the assumption that
// the pattern matches the value
//
fun
xcomp01_h0pat_ck1
( env0:
! compenv
, h0p0: h0pat, l1v1: l1val): void
//
(* ****** ****** *)

fun
xcomp01_h0exp_val
( env0:
! compenv, h0e0: h0exp): l1val
fun
xcomp01_h0exp_set
( env0:
! compenv
, h0e0: h0exp, tres: l1tmp): void

(* ****** ****** *)

fun
xcomp01_h0explst_val
( env0:
! compenv
, h0es: h0explst(*arg*)): l1valist
fun
xcomp01_h0explst_arg
( env0:
! compenv
, npf: int
, h0es: h0explst(*arg*)): l1valist

(* ****** ****** *)
//
fun
xcomp01_h0exp_blk
( env0:
! compenv
, h0e0: h0exp, tres: l1tmp): l1blk
fun
xcomp01_h0expopt_blk
( env0:
! compenv
, opt0: h0expopt, tres: l1tmp): l1blk
//
(* ****** ****** *)
//
fun
xcomp01_h0dcl
( env0:
! compenv, dcl0: h0dcl): l1dcl
fun
xcomp01_h0dclist
( env0:
! compenv, dcls: h0dclist): l1dclist
//
(* ****** ****** *)
//
fun
xcomp01_hvaldecl
( env0:
! compenv, dcl0: hvaldecl): lvaldecl
fun
xcomp01_hvaldeclist
( env0:
! compenv, dcls: hvaldeclist): lvaldeclist
//
(* ****** ****** *)
//
fun
xcomp01_hvardecl
( env0:
! compenv, dcl0: hvardecl): lvardecl
fun
xcomp01_hvardeclist
( env0:
! compenv, dcls: hvardeclist): lvardeclist
//
(* ****** ****** *)

(* end of [xats_xcomp01.sats] *)
