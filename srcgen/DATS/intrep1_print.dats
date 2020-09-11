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
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
#staload $INTREP0(* open *)
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)

overload
fprint with $STM.fprint_stamp
overload
fprint with $LEX.fprint_token

(* ****** ****** *)
implement
fprint_val<hdvar> = fprint_hdvar
implement
fprint_val<hdcon> = fprint_hdcon
implement
fprint_val<hdcst> = fprint_hdcst
implement
fprint_val<hfarg> = fprint_hfarg
implement
fprint_val<htqarg> = fprint_htqarg
(* ****** ****** *)

implement
fprint_val<ltcst> = fprint_ltcst
implement
fprint_val<l1tmp> = fprint_l1tmp

(* ****** ****** *)
implement
fprint_val<l1val> = fprint_l1val
implement
fprint_val<l1cmd> = fprint_l1cmd
implement
fprint_val<l1blk> = fprint_l1blk
(* ****** ****** *)

implement
fprint_val<l1dcl> = fprint_l1dcl

(* ****** ****** *)
//
implement
print_ltcst(x0) =
fprint_ltcst(stdout_ref, x0)
implement
prerr_ltcst(x0) =
fprint_ltcst(stderr_ref, x0)
implement
fprint_ltcst(out, x0) =
fprint!
(out, x0.hdc(), "(", x0.stamp(), ")")
//
(* ****** ****** *)
//
implement
print_l1tmp(x0) =
fprint_l1tmp(stdout_ref, x0)
implement
prerr_l1tmp(x0) =
fprint_l1tmp(stderr_ref, x0)
implement
fprint_l1tmp(out, x0) =
let
val arg = x0.arg()
in
if
arg <= 0
then
fprint!
(out, "tmp(", x0.stamp(), ")")
else
fprint!
(out, "arg[", arg, "](", x0.stamp(), ")")
end // end of [fprint_l1tmp]
//
(* ****** ****** *)
//
implement
print_l1int(x0) =
fprint_l1int(stdout_ref, x0)
implement
prerr_l1int(x0) =
fprint_l1int(stderr_ref, x0)

implement
fprint_l1int(out, x0) =
(
case+ x0 of
| L1INTint(int) =>
  fprint!(out, "L1INTint(", int, ")")
| L1INTtmp(tmp) =>
  fprint!(out, "L1INTtmp(", tmp, ")")
(*
| L1INTval(l1v) =>
  fprint!(out, "L1INTval(", l1v, ")")
*)
)
//
(* ****** ****** *)
//
implement
print_l1btf(x0) =
fprint_l1btf(stdout_ref, x0)
implement
prerr_l1btf(x0) =
fprint_l1btf(stderr_ref, x0)
//
implement
fprint_l1btf(out, x0) =
(
case+ x0 of
| L1BTFbtf(btf) =>
  fprint!(out, "L1BTFbtf(", btf, ")")
| L1BTFtmp(tmp) =>
  fprint!(out, "L1BTFtmp(", tmp, ")")
(*
| L1BTFval(l1v) =>
  fprint!(out, "L1BTFval(", l1v, ")")
*)
)
//
(* ****** ****** *)
//
implement
print_l1val(x0) =
fprint_l1val(stdout_ref, x0)
implement
prerr_l1val(x0) =
fprint_l1val(stderr_ref, x0)
//
implement
fprint_l1val(out, x0) =
(
case+
x0.node() of
//
|
L1VALint(tok) =>
fprint!(out, "L1VALint(", tok, ")")
//
|
L1VALbtf(tok) =>
fprint!(out, "L1VALbtf(", tok, ")")
//
|
L1VALchr(tok) =>
fprint!(out, "L1VALchr(", tok, ")")
//
|
L1VALtmp(tmp) =>
fprint!(out, "L1VALtmp(", tmp, ")")
//
|
L1VALfcst(hdc) =>
fprint!(out, "L1VALfcst(", hdc, ")")
|
L1VALtcst(ltc) =>
fprint!(out, "L1VALtcst(", ltc, ")")
//
|
L1VALctag(l1v1) =>
fprint!(out, "L1VALctag(", l1v1, ")")
|
L1VALcarg(l1v1, idx2) =>
fprint!
(out, "L1VALctag(", l1v1, "; ", idx2, ")")
|
L1VALnone0() =>
fprint!(out, "L1VALnone0(", ")")
|
L1VALnone1(h0e1) =>
fprint!(out, "L1VALnone1(", h0e1, ")")
//
| _ (* else *) => fprint!(out, "L1VAL...(...)")
//
) (* end of [fprint_l1val] *)
//
(* ****** ****** *)
//
implement
print_l1cmd(x0) =
fprint_l1cmd(stdout_ref, x0)
implement
prerr_l1cmd(x0) =
fprint_l1cmd(stderr_ref, x0)
//
implement
fprint_l1cmd(out, x0) =
(
case+
x0.node() of
//
|
L1CMDmov
(tres, l0v1) =>
fprint!
( out
, "L1CMDmov(", tres, "; ", l0v1, ")")
//
|
L1CMDcon
(tres, hdc1, l0vs) =>
fprint!
( out
, "L1CMDcon("
, tres, "; ", hdc1, "; ", l0vs, ")")
(*
|
L1CMDcst
(tres, hdc1, l0vs) =>
fprint!
( out
, "L1CMDcst("
, tres, "; ", hdc1, "; ", l0vs, ")")
*)
//
|
L1CMDapp
(tres, l0v1, l0vs) =>
fprint!
( out
, "L1CMDapp("
, tres, "; ", l0v1, "; ", l0vs, ")")
//
|
L1CMDdcl(dcl0) =>
fprint!(out, "L1CMDdcl(", dcl0, ")")
//
|
L1CMDif0
(l1v1, blk2, blk3) =>
fprint!
( out
, "L1CMDif0("
, l1v1, "; ", blk2, "; ", blk3, ")")
//
|
L1CMDassrt(l1v1) =>
fprint!(out, "L1CMDassrt(", l1v1, ")")
|
L1CMDpatck0
(tres, h0p1, l1v2) =>
fprint!
( out
, "L1CMDpatck0("
, tres, "; ", h0p1, "; ", l1v2, ")")
|
L1CMDpatck1
(h0p1, l1v2) =>
fprint!
( out
, "L1CMDpatck1(", h0p1, "; ", l1v2, ")")
//
(*
| _ (* else *) => fprint!(out, "L1CMD...(...)")
*)
//
) (* end of [fprint_l1cmd] *)
//
(* ****** ****** *)
//
implement
print_l1blk(x0) =
fprint_l1blk(stdout_ref, x0)
implement
prerr_l1blk(x0) =
fprint_l1blk(stderr_ref, x0)
//
implement
fprint_l1blk(out, x0) =
(
case+ x0 of
|
L1BLKnone() =>
fprint!(out, "L1BLKnone(", ")")
|
L1BLKsome(cmds) =>
fprint!(out, "L1BLKsome(", cmds, ")")
)
//
(* ****** ****** *)

local

implement
fprint_val<l1dcl> = fprint_l1dcl
implement
fprint_val<limpdecl> = fprint_limpdecl
implement
fprint_val<lfundecl> = fprint_lfundecl
implement
fprint_val<lvaldecl> = fprint_lvaldecl
implement
fprint_val<lvardecl> = fprint_lvardecl

in

implement
fprint_l1dcl(out, x0) =
(
case+
x0.node() of
//
|
L1DCLlocal
(head, body) =>
fprint!
( out
, "L1DCLlocal(", head, "; ", body, ")")
//
|
L1DCLimpdecl(limp) =>
fprint!(out, "L1DCLimpdecl(", limp, ")")
|
L1DCLfundecl(lfds) =>
fprint!(out, "L1DCLfundecl(", lfds, ")")
|
L1DCLvaldecl(lvds) =>
fprint!(out, "L1DCLvaldecl(", lvds, ")")
|
L1DCLvardecl(lvds) =>
fprint!(out, "L1DCLvardecl(", lvds, ")")
//
| L1DCLnone0() =>
  fprint!(out, "L1DCLnone0(", ")")
| L1DCLnone1(hdcl) =>
  fprint!(out, "L1DCLnone1(", hdcl, ")")
//
| _ (* else *) => fprint!(out, "L1DCL...(...)")
//
) (* end of [fprint_l1dcl] *)

end // end of [local]

(* ****** ****** *)
//
implement
print_limpdecl(x0) =
fprint_limpdecl(stdout_ref, x0)
implement
prerr_limpdecl(x0) =
fprint_limpdecl(stderr_ref, x0)
//
implement
fprint_limpdecl
  (out, x0) = let
//
val+LIMPDECL(rcd) = x0
//
in
//
fprint!
( out
, "LIMPDECL@{"
, "hdc=", rcd.hdc, ", "
, "hag=", rcd.hag, ", "
, "def=", rcd.def, ", "
, "hag_blk=", rcd.hag_blk, ", "
, "def_blk=", rcd.def_blk, ", ", "}")
//
end // end of [fprint_limpdecl]
//
(* ****** ****** *)
//
implement
print_lfundecl(x0) =
fprint_lfundecl(stdout_ref, x0)
implement
prerr_lfundecl(x0) =
fprint_lfundecl(stderr_ref, x0)
//
implement
fprint_lfundecl
  (out, x0) = let
//
val+LFUNDECL(rcd) = x0
//
in
//
case+
rcd.hag of
|
None() =>
fprint!
( out
, "LFUNDECL@{"
, "nam=", rcd.nam, ", "
, "hdc=", rcd.hdc, ", ", "}")
|
Some(rcd_hag) =>
fprint!
( out
, "LFUNDECL@{"
, "nam=", rcd.nam, ", "
, "hdc=", rcd.hdc, ", "
, "hag=", rcd_hag, ", "
, "def=", rcd.def, ", "
, "hag_blk=", rcd.hag_blk, ", "
, "def_blk=", rcd.def_blk, ", ", "}")
//
end // end of [fprint_lfundecl]
//
(* ****** ****** *)
//
implement
print_lvaldecl(x0) =
fprint_lvaldecl(stdout_ref, x0)
implement
prerr_lvaldecl(x0) =
fprint_lvaldecl(stderr_ref, x0)
//
implement
fprint_lvaldecl
  (out, x0) = let
//
val+LVALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "LVALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def
  , ", def_blk=", rcd.def_blk, "}")
end // end of [fprint_lvaldecl]
//
(* ****** ****** *)
//
implement
print_lvardecl(x0) =
fprint_lvardecl(stdout_ref, x0)
implement
prerr_lvardecl(x0) =
fprint_lvardecl(stderr_ref, x0)
//
implement
fprint_lvardecl
  (out, x0) = let
//
val+LVARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "LVARDECL@{"
  , ", pat=", rcd.hdv
  , ", ini=", rcd.ini
  , ", ini_blk=", rcd.ini_blk, "}")
end // end of [fprint_lvardecl]
//
(* ****** ****** *)

(* end of [xats_intrep1_print.dats] *)
