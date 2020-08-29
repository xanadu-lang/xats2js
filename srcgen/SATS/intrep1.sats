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
//
typedef loc_t = $LOC.loc_t
typedef token = $LEX.token
//
(* ****** ****** *)
//
abstype ldvar_tbox = ptr
typedef ldvar = ldvar_tbox
//
abstype ldcon_tbox = ptr
typedef ldcon = ldcon_tbox
abstype ldcst_tbox = ptr
typedef ldcst = ldcst_tbox
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
| L1VALvar of (ldvar)
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
(* ****** ****** *)

datatype
l1cmd_node =
| L1CMDmove_val of (ldvar, l1val)

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
(* ****** ****** *)

(* end of [intrep1.sats] *)
