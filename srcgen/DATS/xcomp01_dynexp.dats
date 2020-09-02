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
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
#staload $INTREP0(* open *)
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xcomp01.sats"
(* ****** ****** *)

local

fun
auxset_if0
( env0:
! compenv
, h0e0: h0exp
, tres: l1tmp): void =
let
//
val
loc0 = h0e0.loc()
//
val-
H0Eif0
( h0e1
, h0e2
, opt3) = h0e0.node()
//
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
val blk2 =
xcomp01_h0exp_blk(env0, h0e2, tres)
val blk3 =
xcomp01_h0expopt_blk(env0, opt3, tres)
//
in
  xcomp01_lcmdadd(env0, lcmd) where
  {
    val
    lcmd =
    l1cmd_make_node
    (loc0, L1CMDif0(l1v1, blk2, blk3))
  }
end // end of [auxset_if0]

in(*in-of-local*)

implement
xcomp01_h0exp_val
  (env0, h0e0) =
let
val loc0 = h0e0.loc()
in(*in-of-let*)
//
case+
h0e0.node() of
|
H0Eif0 _ =>
let
val
tres = l1tmp_new(loc0)
val () =
auxset_if0(env0, h0e0, tres)
in
l1val_make_node(loc0, L1VALtmp(tres))
end
| _ (* else *) =>
(
l1val_make_node(loc0, L1VALnone1(h0e0))
)
//
end // end of [xcomp01_h0exp_val]

implement
xcomp01_h0exp_set
  (env0, h0e0, tres) =
let
val loc0 = h0e0.loc()
in(*in-of-let*)
//
case+
h0e0.node() of
|
H0Eif0 _ =>
auxset_if0(env0, h0e0, tres)
| _ (* else *) =>
let
  val l1v0 =
  xcomp01_h0exp_val(env0, h0e0)
in
  xcomp01_lcmdadd(env0, cmd0) where
  {
  val cmd0 =
  l1cmd_make_node(loc0, L1CMDmov(tres, l1v0))
  }
end
//
end // end of [xcomp01_h0exp_val]

end // end of [local]

(* ****** ****** *)
//
implement
xcomp01_h0exp_blk
  (env0, h0e0, tres) =
(
xcomp01_lcmdpop0_blk(env0)
) where
{
val () =
xcomp01_lcmdpush_nil(env0)
val () =
xcomp01_h0exp_set(env0, h0e0, tres)
} (* end of [xcomp01_h0exp_blk] *)

(* ****** ****** *)
//
implement
xcomp01_h0expopt_blk
  (env0, opt0, tres) =
(
case+ opt0 of
| None() => l1blk_none()
| Some(h0e0) =>
  xcomp01_h0exp_blk(env0, h0e0, tres)
)
//
(* ****** ****** *)

(* end of [xats_xcomp01_dynexp.dats] *)
