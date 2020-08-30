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
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)

#staload "./../SATS/intrep1.sats"

(* ****** ****** *)

overload
fprint with $STM.fprint_stamp
overload
fprint with $LEX.fprint_token

(* ****** ****** *)

implement
fprint_val<l1val> = fprint_l1val
implement
fprint_val<l1cmd> = fprint_l1cmd
implement
fprint_val<l1dcl> = fprint_l1dcl

(* ****** ****** *)

implement
print_l1tmp(x0) =
fprint_l1tmp(stdout_ref, x0)
implement
prerr_l1tmp(x0) =
fprint_l1tmp(stderr_ref, x0)

implement
fprint_l1tmp(out, x0) =
fprint!(out, "tmp(", x0.stamp(), ")")

(* ****** ****** *)

implement
print_l1val(x0) =
fprint_l1val(stdout_ref, x0)
implement
prerr_l1val(x0) =
fprint_l1val(stderr_ref, x0)

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
| _ (* else *) => fprint!(out, "L1VAL...(...)")
//
) (* end of [fprint_l1val] *)

(* ****** ****** *)

implement
print_l1cmd(x0) =
fprint_l1cmd(stdout_ref, x0)
implement
prerr_l1cmd(x0) =
fprint_l1cmd(stderr_ref, x0)

(* ****** ****** *)

implement
fprint_l1cmd(out, x0) =
(
case+
x0.node() of
//
|
L1CMDmov(tmp0, l0v1) =>
fprint!
( out
, "L1CMDmov(", tmp0, "; ", l0v1, ")")
//
| L1CMDapp(tmp0, l0v1, l0vs) =>
  fprint!
  ( out
  , "L1CMDapp("
  , tmp0, "; ", l0v1, "; ", l0vs, ")")
//
| _ (* else *) => fprint!(out, "L1CMD...(...)")
//
) (* end of [fprint_l1cmd] *)

(* ****** ****** *)

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
| _ (* else *) => fprint!(out, "L1DCL...(...)")
//
) (* end of [fprint_l1dcl] *)

(* ****** ****** *)

(* end of [intrep1_print.dats] *)
