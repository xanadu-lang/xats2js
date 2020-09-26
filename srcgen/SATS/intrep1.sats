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
typedef label = $LAB.label
//
typedef loc_t = $LOC.loc_t
//
typedef token = $LEX.token
//
(* ****** ****** *)
//
(*
HX-2020-09-06:
for template instances
*)
//
abstype ltcst_tbox = ptr
typedef ltcst = ltcst_tbox
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
(*
//
abstype l1lvl_tbox = ptr
typedef l1lvl = l1lvl_tbox
//
typedef l1lvlist = List0(l1lvl)
typedef l1lvlopt = Option(l1lvl)
//
*)
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
(*
abstype l1blk_tbox = ptr
typedef l1blk = l1blk_tbox
*)
//
datatype
l1blk =
| L1BLKnone of ()
| L1BLKsome of (l1cmdlst)
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
ltcst_new_hdc
(loc: loc_t, hdc: hdcst): ltcst
//
(* ****** ****** *)
fun
ltcst_get_loc(ltcst): loc_t
overload .loc with ltcst_get_loc
fun
ltcst_get_hdc(ltcst): hdcst
overload .hdc with ltcst_get_hdc
(* ****** ****** *)
fun
ltcst_stamp_new((*void*)): stamp
fun
ltcst_get_stamp(ltcst): stamp
overload .stamp with ltcst_get_stamp
(* ****** ****** *)
//
fun
print_ltcst: print_type(ltcst)
fun
prerr_ltcst: prerr_type(ltcst)
fun
fprint_ltcst: fprint_type(ltcst)
//
overload print with print_ltcst
overload prerr with prerr_ltcst
overload fprint with fprint_ltcst
//
(* ****** ****** *)
fun
l1tmp_new_tmp
(loc: loc_t): l1tmp
fun
l1tmp_new_arg
(loc: loc_t, idx: int): l1tmp
//
fun
l1tmp_get_loc(l1tmp): loc_t
overload .loc with l1tmp_get_loc
fun
l1tmp_get_arg(tmp: l1tmp): int
overload .arg with l1tmp_get_arg
fun
l1tmp_get_ref(tmp: l1tmp): int
overload .ref with l1tmp_get_ref
(* ****** ****** *)
fun
l1tmp_get_lev(tmp: l1tmp): int
overload .lev with l1tmp_get_lev
fun
l1tmp_set_lev(l1tmp, int): void
overload .lev with l1tmp_set_lev
(* ****** ****** *)
fun
l1tmp_stamp_new((*void*)): stamp
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
(*
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
*)
(* ****** ****** *)
//
datatype
l1pck =
| L1PCKany of ()
(*
| L1PCKint of (int, l1val)
| L1PCKbtf of (bool, l1val)
*)
| L1PCKcon of
  ( hdcon, l1val )
//
| L1PCKapp of
  ( l1pck(*con-tag*)
  , l1pcklst(*con-arg*) )
//
| L1PCKtup of
  ( int//(*tup-knd*)
  , l1pcklst(*tup-arg*) )
//
| L1PCKpat of (h0pat, l1val)
//
where l1pcklst = List0(l1pck)
//
fun
print_l1pck: print_type(l1pck)
fun
prerr_l1pck: prerr_type(l1pck)
fun
fprint_l1pck: fprint_type(l1pck)
//
overload print with print_l1pck
overload prerr with prerr_l1pck
overload fprint with fprint_l1pck
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
(*
| L1VALlvl of (l1lvl)
*)
//
| L1VALcon of (hdcon)
//
| L1VALfcst of (hdcst)
| L1VALtcst of (ltcst)
//
| L1VALvfix of (hdvar)
//
// HX: ctag: con_tag
// HX: carg: con_arg
//
| L1VALflat of (l1val)
//
| L1VALaddr of (l1val)
| L1VALtalf of (l1val)
//
| L1VALctag of (l1val)
| L1VALcarg of (l1val, int(*idx*))
| L1VALcofs of (l1val, int(*idx*))
| L1VALcptr of (l1val, int(*idx*))
//
| L1VALtarg of (l1val, int(*idx*))
| L1VALtofs of (l1val, int(*idx*))
| L1VALtptr of (l1val, int(*idx*))
//
| L1VALeval0 of (l1val(*src*)) // general
| L1VALeval1 of (l1val(*src*)) // ptr-dref
| L1VALeval2 of (l1val(*src*)) // lazy-eval
| L1VALeval3 of (l1val(*src*)) // llazy-eval
//
| L1VALfree0 of (l1val(*src*)) // general
| L1VALfree1 of (l1val(*src*)) // ptr-free
| L1VALfree2 of (l1val(*src*)) // con-free
| L1VALfree3 of (l1val(*src*)) // llazy-free
//
(*
| L1VALselab of (l1val, label)
*)
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
fun
l1val_flat(l1v0: l1val): l1val
//
fun
l1val_addr(l1v0: l1val): l1val
fun
l1val_talf(l1v0: l1val): l1val
//
(* ****** ****** *)
fun
l1val_ctag
( loc0: loc_t
, l1v0: l1val): l1val
fun
l1val_carg
( loc0: loc_t
, l1v1: l1val, idx2: int): l1val
fun
l1val_cofs
( loc0: loc_t
, l1v1: l1val, idx2: int): l1val
fun
l1val_cptr
( loc0: loc_t
, l1v1: l1val, idx2: int): l1val
(* ****** ****** *)
fun
l1val_targ
( loc0: loc_t
, l1v1: l1val, idx2: int): l1val
fun
l1val_tofs
( loc0: loc_t
, l1v1: l1val, idx2: int): l1val
fun
l1val_tptr
( loc0: loc_t
, l1v1: l1val, idx2: int): l1val
(* ****** ****** *)
fun
l1val_eval
( knd0: int, l1v1: l1val ): l1val
(* ****** ****** *)
fun
l1val_free
( knd0: int, l1v1: l1val ): l1val
(* ****** ****** *)
//
fun
l1val_addrize(l1v0: l1val): l1val
fun
l1val_talfize(l1v0: l1val): l1val
//
(* ****** ****** *)
(*
//
datatype
l1lvl_node =
//
| L1LVLtmp of l1tmp
//
| L1LVLpcon of (l1val, label)
| L1LVLpbox of (l1val, label)
//
| L1LVLplft of (l1val, label)
| L1LVLpptr of (l1val, label)
//
*)
(* ****** ****** *)
(*
//
fun
l1lvl_make_node
(loc_t, l1lvl_node): l1lvl
//
*)
(* ****** ****** *)
(*
//
fun
l1lvl_get_loc
(l1v0: l1lvl): loc_t
fun
l1lvl_get_node
(l1v0: l1lvl): l1lvl_node
//
overload .loc with l1lvl_get_loc
overload .node with l1lvl_get_node
//
*)
(* ****** ****** *)
(*
//
fun
print_l1lvl: print_type(l1lvl)
fun
prerr_l1lvl: prerr_type(l1lvl)
fun
fprint_l1lvl: fprint_type(l1lvl)
//
overload print with print_l1lvl
overload prerr with prerr_l1lvl
overload fprint with fprint_l1lvl
//
*)
(* ****** ****** *)

datatype
l1lamexp =
L1LAMEXP of @{
  loc= loc_t
//
, hag= hfarglst
//
, def= l1valopt
//
, lev= int//fun
, lts= l1tmplst
//
, hag_blk= l1blk
, def_blk= l1blk
//
} (* L1LAMEXP *)

datatype
l1fixexp =
L1FIXEXP of @{
  loc= loc_t
//
, nam= hdvar
, hag= hfarglst
//
, def= l1valopt
//
, lev= int//fun
, lts= l1tmplst
//
, hag_blk= l1blk
, def_blk= l1blk
//
} (* L1FIXEXP *)

(* ****** ****** *)
//
datatype
l1cmd_node =
//
| L1CMDmov of
  (l1tmp, l1val)
//
| L1CMDcon of
  ( l1tmp(*res*)
  , hdcon(*con*)
  , l1valist(*arg*))
//
// HX: 0: flat
// HX: 1: boxed
| L1CMDtup of
  ( l1tmp(*res*)
  , int // flt/box
  , l1valist(*arg*))
//
| L1CMDapp of
  ( l1tmp(*res*)
  , l1val(*fun*)
  , l1valist(*arg*))
//
| L1CMDlam of
  ( l1tmp(*res*)
  , l1lamexp(*fun*))
| L1CMDfix of
  ( l1tmp(*res*)
  , l1fixexp(*fun*))
//
| L1CMDlazy of
  ( l1tmp(*res*)
  , l1val(*thunk*) )
| L1CMDllazy of
  ( l1tmp(*res*)
  , l1val(*thunk*)
  , l1val(*frees*) )
//
| L1CMDblk of (l1blk)
| L1CMDdcl of (l1dcl)
//
| L1CMDif0 of
  (l1val, l1blk, l1blk)
//
| L1CMDcase of
  ( int(*knd*)
  , l1val
  , l1tmp(*tcas*)
  , l1pcklst, l1blklst)
//
| L1CMDpatck of (l1pck)
| L1CMDmatch of (h0pat, l1val)
//
| L1CMDflat of
  (l1tmp(*res*), l1val(*lval*))
//
| L1CMDcarg of
  ( l1tmp(*res*)
  , l1val(*lval*), int(*index*))
| L1CMDcofs of
  ( l1tmp(*res*)
  , l1val(*lval*), int(*index*))
| L1CMDtarg of
  ( l1tmp(*res*)
  , l1val(*lval*), int(*index*))
| L1CMDtofs of
  ( l1tmp(*res*)
  , l1val(*lval*), int(*index*))
//
| L1CMDassgn of // assignment
  (l1val(*lval*), l1val(*rval*))
//
| L1CMDeval0 of // unknown
  (l1tmp(*res*), l1val(*source*))
| L1CMDeval1 of // ptr-dref
  (l1tmp(*res*), l1val(*source*))
| L1CMDeval2 of // lazy-eval
  (l1tmp(*res*), l1val(*source*))
| L1CMDeval3 of // llazy-eval
  (l1tmp(*res*), l1val(*source*))
//
| L1CMDfree0 of // unknown
  (l1tmp(*res*), l1val(*source*))
| L1CMDfree1 of // ptr-free
  (l1tmp(*res*), l1val(*source*))
| L1CMDfree2 of // con-free
  (l1tmp(*res*), l1val(*source*))
| L1CMDfree3 of // llazy-free
  (l1tmp(*res*), l1val(*source*))
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
//
fun
print_l1lamexp:
print_type(l1lamexp)
fun
prerr_l1lamexp:
prerr_type(l1lamexp)
fun
fprint_l1lamexp:
fprint_type(l1lamexp)
//
overload print with print_l1lamexp
overload prerr with prerr_l1lamexp
overload fprint with fprint_l1lamexp
//
(* ****** ****** *)
//
fun
print_l1fixexp:
print_type(l1fixexp)
fun
prerr_l1fixexp:
prerr_type(l1fixexp)
fun
fprint_l1fixexp:
fprint_type(l1fixexp)
//
overload print with print_l1fixexp
overload prerr with prerr_l1fixexp
overload fprint with fprint_l1fixexp
//
(* ****** ****** *)
//
fun
l1blk_none(): l1blk
fun
l1blk_some(cmds: l1cmdlst): l1blk
//
(* ****** ****** *)
//
fun
print_l1blk: print_type(l1blk)
fun
prerr_l1blk: prerr_type(l1blk)
fun
fprint_l1blk: fprint_type(l1blk)
//
overload print with print_l1blk
overload prerr with prerr_l1blk
overload fprint with fprint_l1blk
//
(* ****** ****** *)
//
datatype
limpdecl =
LIMPDECL of @{
  loc= loc_t
, hdc= hdcst
//
, hag= hfarglst
//
, def= l1valopt
//
, lev= int//fun
, lts= l1tmplst
//
, hag_blk= l1blk
, def_blk= l1blk
}
//
(* ****** ****** *)
//
fun
print_limpdecl:
print_type(limpdecl)
fun
prerr_limpdecl:
prerr_type(limpdecl)
fun
fprint_limpdecl:
fprint_type(limpdecl)
//
overload print with print_limpdecl
overload prerr with prerr_limpdecl
overload fprint with fprint_limpdecl
//
(* ****** ****** *)
//
datatype
lfundecl =
LFUNDECL of @{
  loc= loc_t
, nam= hdvar
, hdc= hdcst
//
, hag=
    hfarglstopt
//
, def= l1valopt
//
, lev= int//fun
, lts= l1tmplst
//
, hag_blk= l1blk
, def_blk= l1blk
}
//
typedef
lfundeclist = List0(lfundecl)
//
(* ****** ****** *)
//
fun
print_lfundecl:
print_type(lfundecl)
fun
prerr_lfundecl:
prerr_type(lfundecl)
fun
fprint_lfundecl:
fprint_type(lfundecl)
//
overload print with print_lfundecl
overload prerr with prerr_lfundecl
overload fprint with fprint_lfundecl
//
(* ****** ****** *)
//
datatype
lvaldecl =
LVALDECL of @{
  loc= loc_t
, pat= h0pat
, def= l1valopt
, def_blk= l1blk
}
//
typedef
lvaldeclist = List0(lvaldecl)
//
(* ****** ****** *)
//
fun
print_lvaldecl:
print_type(lvaldecl)
fun
prerr_lvaldecl:
prerr_type(lvaldecl)
fun
fprint_lvaldecl:
fprint_type(lvaldecl)
//
overload print with print_lvaldecl
overload prerr with prerr_lvaldecl
overload fprint with fprint_lvaldecl
//
(* ****** ****** *)
//
datatype
lvardecl =
LVARDECL of @{
  loc= loc_t
, hdv= hdvar
, ini= l1valopt
, hdv_tmp= l1tmp
, ini_blk= l1blk
}
//
typedef
lvardeclist = List0(lvardecl)
//
(* ****** ****** *)
//
fun
print_lvardecl:
print_type(lvardecl)
fun
prerr_lvardecl:
prerr_type(lvardecl)
fun
fprint_lvardecl:
fprint_type(lvardecl)
//
overload print with print_lvardecl
overload prerr with prerr_lvardecl
overload fprint with fprint_lvardecl
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
|
L1DCLimpdecl of (limpdecl)
|
L1DCLfundecl of (lfundeclist)
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
//
// HX-2020-09-06
// For code emission
//
(* ****** ****** *)
//
(*
fun
xemit01_int
(FILEref, int): void
*)
//
fun
xemit01_txt00
(FILEref, string): void
fun
xemit01_txtln
(FILEref, string): void
//
(* ****** ****** *)
//
fun
xemit01_newln(FILEref): void
fun
xemit01_blnk1(FILEref): void
fun
xemit01_nblnk(FILEref, int): void
fun
xemit01_indnt(FILEref, int): void
//
(* ****** ****** *)
fun
xemit01_hdvar(FILEref, hdvar): void
(* ****** ****** *)
fun
xemit01_hdcon(FILEref, hdcon): void
fun
xemit01_hdcst(FILEref, hdcst): void
(* ****** ****** *)
fun
xemit01_ltcst(FILEref, ltcst): void
(* ****** ****** *)
fun
xemit01_hfarg
( FILEref
, int(*flvl*)
, hfarg, int(*base*)): int
fun
xemit01_hfarglst
( FILEref
, int(*flvl*)
, hfarglst, int(*base*)): int
(* ****** ****** *)
//
fun
xemit01_lvint(FILEref, token): void
fun
xemit01_lvbtf(FILEref, token): void
fun
xemit01_lvchr(FILEref, token): void
fun
xemit01_lvstr(FILEref, token): void
//
fun
xemit01_lvtop(FILEref, token): void
//
(* ****** ****** *)
fun
xemit01_l1tmp(FILEref, l1tmp): void
(* ****** ****** *)
fun
xemit01_l1pck(FILEref, l1pck): void
(* ****** ****** *)
fun
xemit01_l1val(FILEref, l1val): void
(* ****** ****** *)
//
fun
xemit01_l1cmd(FILEref, l1cmd): void
fun
xemit01_l1blk(FILEref, l1blk): void
//
(* ****** ****** *)
fun
xemit01_l1cmdlst(FILEref, l1cmdlst): void
(* ****** ****** *)
fun
xemit01_ftmpdecs(FILEref, l1tmplst): void
(* ****** ****** *)
//
fun
xemit01_l1dcl(FILEref, l1dcl): void
fun
xemit01_l1dclist(FILEref, l1dclist): void
//
(* ****** ****** *)
//
fun
xemit01_program
(out:FILEref, prog:l1dclist(*prog*)): void
//
(* ****** ****** *)

(* end of [xats_intrep1.sats] *)
