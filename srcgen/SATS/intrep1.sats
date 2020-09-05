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
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
#staload $INTREP0
(* ****** ****** *)
//
typedef stamp = $STM.stamp
//
typedef loc_t = $LOC.loc_t
typedef token = $LEX.token
//
(* ****** ****** *)
//
abstype l1tmp_tbox = ptr
typedef l1tmp = l1tmp_tbox
//
typedef l1tmplst = List0(l1tmp)
typedef l1tmpopt = Option(l1tmp)
//
(* ****** ****** *)
//
abstype l1val_tbox = ptr
typedef l1val = l1val_tbox
//
typedef l1valist = List0(l1val)
typedef l1valopt = Option(l1val)
//
(* ****** ****** *)
//
abstype l1cmd_tbox = ptr
typedef l1cmd = l1cmd_tbox
//
typedef l1cmdlst = List0(l1cmd)
typedef l1cmdopt = Option(l1cmd)
//
(* ****** ****** *)
//
abstype l1blk_tbox = ptr
typedef l1blk = l1blk_tbox
//
typedef l1blklst = List0(l1blk)
//
(* ****** ****** *)
//
abstype l1dcl_tbox = ptr
typedef l1dcl = l1dcl_tbox
//
typedef l1dclist = List0(l1dcl)
typedef l1dclopt = Option(l1dcl)
//
(* ****** ****** *)
//
fun
l1tmp_new(loc: loc_t): l1tmp
fun
l1tmp_stamp_new((*void*)): stamp
//
(* ****** ****** *)
fun
l1tmp_get_loc(l1tmp): loc_t
overload .loc with l1tmp_get_loc
fun
l1tmp_get_stamp(l1tmp): stamp
overload .stamp with l1tmp_get_stamp
(* ****** ****** *)
//
fun
print_l1tmp: print_type(l1tmp)
fun
prerr_l1tmp: prerr_type(l1tmp)
fun
fprint_l1tmp: fprint_type(l1tmp)
//
overload print with print_l1tmp
overload prerr with prerr_l1tmp
overload fprint with fprint_l1tmp
//
(* ****** ****** *)
//
datatype
l1int =
| L1INTint of int
| L1INTtmp of l1tmp
(*
| L1INTval of l1val
*)
//
fun
print_l1int: print_type(l1int)
fun
prerr_l1int: prerr_type(l1int)
fun
fprint_l1int: fprint_type(l1int)
//
overload print with print_l1int
overload prerr with prerr_l1int
overload fprint with fprint_l1int
//
(* ****** ****** *)
//
datatype
l1btf =
| L1BTFbtf of bool
| L1BTFtmp of l1tmp
(*
| L1BTFval of l1val
*)
//
#define
L1BTFbtf_tt L1BTFbtf(true)
#define
L1BTFbtf_ff L1BTFbtf(false)
//
fun
print_l1btf: print_type(l1btf)
fun
prerr_l1btf: prerr_type(l1btf)
fun
fprint_l1btf: fprint_type(l1btf)
//
overload print with print_l1btf
overload prerr with prerr_l1btf
overload fprint with fprint_l1btf
//
(* ****** ****** *)
//
datatype
l1val_node =
//
| L1VALint of (token)
| L1VALbtf of (token)
| L1VALchr of (token)
| L1VALflt of (token)
| L1VALstr of (token)
//
| L1VALtop of (token)
//
| L1VALtmp of (l1tmp)
//
| L1VALcst of (hdcst)
//
// HX: ctag: con_tag
// HX: carg: con_arg
| L1VALctag of (l1val)
| L1VALcarg of (l1val, int)
//
(*
| L1VALselab of (l1val, l1lab)
*)
//
| L1VALnone0 of () | L1VALnone1 of (h0exp)
//
(* ****** ****** *)
//
fun
l1val_make_node
(loc_t, l1val_node): l1val
//
(* ****** ****** *)
//
fun
l1val_get_loc
(l1v0: l1val): loc_t
fun
l1val_get_node
(l1v0: l1val): l1val_node
//
overload .loc with l1val_get_loc
overload .node with l1val_get_node
//
(* ****** ****** *)
//
fun
print_l1val: print_type(l1val)
fun
prerr_l1val: prerr_type(l1val)
fun
fprint_l1val: fprint_type(l1val)
//
overload print with print_l1val
overload prerr with prerr_l1val
overload fprint with fprint_l1val
//
(* ****** ****** *)
//
datatype
l1cmd_node =
//
| L1CMDmov of
  (l1tmp, l1val)
//
| L1CMDcon of
  ( l1tmp(*ret*)
  , hdcon(*con*)
  , l1valist(*arg*))
| L1CMDapp of
  ( l1tmp(*ret*)
  , l1val(*fun*)
  , l1valist(*arg*))
//
| L1CMDif0 of
  (l1val, l1blk, l1blk)
//
| L1CMDassrt of (l1val)
//
| L1CMDpatck0 of
  ( l1tmp(*ret*)
  , h0pat, l1val)
| L1CMDpatck1 of (h0pat, l1val)
//
(* ****** ****** *)
//
fun
l1cmd_make_node
(loc_t, l1cmd_node): l1cmd
//
(* ****** ****** *)
//
fun
l1cmd_get_loc
(lcmd: l1cmd): loc_t
fun
l1cmd_get_node
(lcmd: l1cmd): l1cmd_node
//
overload .loc with l1cmd_get_loc
overload .node with l1cmd_get_node
//
(* ****** ****** *)
//
fun
print_l1cmd: print_type(l1cmd)
fun
prerr_l1cmd: prerr_type(l1cmd)
fun
fprint_l1cmd: fprint_type(l1cmd)
//
overload print with print_l1cmd
overload prerr with prerr_l1cmd
overload fprint with fprint_l1cmd
//
(* ****** ****** *)

fun
l1blk_none(): l1blk
fun
l1blk_some(cmds: l1cmdlst): l1blk

(* ****** ****** *)
//
datatype
lvaldecl =
LVALDECL of @{
  loc= loc_t
, pat= h0pat
, def= l1blk
}
//
typedef
lvaldeclist = List0(lvaldecl)
//
(* ****** ****** *)
//
datatype
lvardecl =
LVARDECL of @{
  loc= loc_t
, hdv= hdvar
, ini= l1blk
}
//
typedef
lvardeclist = List0(lvardecl)
//
(* ****** ****** *)
//
datatype
l1dcl_node =
//
| L1DCLnil of ()
| L1DCLlist of (l1dclist)
//
|
L1DCLlocal of
( l1dclist(*head*)
, l1dclist(*body*))
//
(*
|
L1DCLfundecl of (lfundeclist)
*)
|
L1DCLvaldecl of (lvaldeclist)
|
L1DCLvardecl of (lvardeclist)
//
| L1DCLnone0 of () | L1DCLnone1 of h0dcl
//
(* ****** ****** *)
//
fun
l1dcl_make_node
(loc_t, l1dcl_node): l1dcl
//
(* ****** ****** *)
//
fun
l1dcl_get_loc
(ldcl: l1dcl): loc_t
fun
l1dcl_get_node
(ldcl: l1dcl): l1dcl_node
//
overload .loc with l1dcl_get_loc
overload .node with l1dcl_get_node
//
(* ****** ****** *)
//
fun
print_l1dcl: print_type(l1dcl)
fun
prerr_l1dcl: prerr_type(l1dcl)
fun
fprint_l1dcl: fprint_type(l1dcl)
//
overload print with print_l1dcl
overload prerr with prerr_l1dcl
overload fprint with fprint_l1dcl
//
(* ****** ****** *)

(* end of [xats_intrep1.sats] *)
