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
#staload "./../SATS/xcomp01.sats"
(* ****** ****** *)
//
macdef
xltmpnew_tmp0 =
xcomp01_ltmpnew_tmp0
macdef
xltmpnew_arg1 =
xcomp01_ltmpnew_arg1
//
(* ****** ****** *)

implement
fprint_val<l1tmp> = fprint_l1tmp

(* ****** ****** *)

implement
xcomp01_program
  (hpkg) =
(
  L1PKG
  (ltmps, ldcls)
) where
{
//
(*
val () =
xcomp01_initize()
*)
//
val
env0 =
compenv_make_nil()
//
val+
H0PKG(hdcls) = hpkg
//
val
ldcls =
xcomp01_h0dclist(env0, hdcls)
//
val
ltmps = compenv_free_top(env0)
//
} (* end of [xcomp01_program] *)

(* ****** ****** *)

implement
xcomp01_hdcon
  (env0, hdc) =
let
//
val
tag = hdc.tag()
//
in
//
if
(tag >= 0)
then LDCONcon(hdc)
else
let
//
val hdv =
hdcon_get_dvar(hdc)
val opt =
xcomp01_dvarfind(env0, hdv)
//
(*
val () =
println!
("auxval_fcon: hdc = ", hdc)
val () =
println!
("auxval_fcon: hdv = ", hdv)
*)
//
in
case- opt of
~Some_vt(l1v) => LDCONval(l1v)
end // end of [else]
//
end // end of [xcomp01_hdcon]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxdap1
( env0
: !compenv
, h0p0
: h0pat
, l1v1
: l1val): l1pck =
let
val-
H0Pdap1
( h0f0) = h0p0.node()
in
xcomp01_h0pat_ck0
(env0, h0f0, ltag) where
{
val
ltag =
l1val_ctag(l1v1.loc(), l1v1)
}
end // end of [auxdap1]

(* ****** ****** *)

fun
auxdapp
( env0
: !compenv
, h0p0
: h0pat
, l1v1
: l1val): l1pck =
let
val-
H0Pdapp
( h0f0
, npf1
, h0ps) = h0p0.node()
//
val
ltag =
l1val_ctag
(l1v1.loc(), l1v1)
val
pckf =
xcomp01_h0pat_ck0
( env0, h0f0, ltag )
//
in
L1PCKapp
( pckf
, auxnps(env0, npf1, h0ps))
end where
{
//
fun
auxnps
( env0:
! compenv
, npf1: int
, h0ps
: h0patlst): l1pcklst =
(
case+ h0ps of
|
list_nil() =>
list_nil()
|
list_cons _ =>
if
(npf1 > 0)
then
let
val
npf1 = npf1 - 1
val-
list_cons
(_, h0ps) = h0ps
in
auxnps
(env0, npf1, h0ps)
end
else
auxlst
(env0, h0ps, 0(*idx0*))
) (* end of [auxnps] *)
//
and
auxlst
( env0:
! compenv
, h0ps
: h0patlst
, idx0: int): l1pcklst =
(
case+ h0ps of
|
list_nil() => list_nil()
|
list_cons
(h0p1, h0ps) =>
let
val
loc1 = l1v1.loc()
val
arg1 =
l1val_carg
(loc1, l1v1, idx0)
val
pck1 = 
xcomp01_h0pat_ck0
(env0, h0p1, arg1)
in
list_cons(pck1, pcks) where
{
val
pcks = auxlst(env0, h0ps, idx0+1)
}
end
) (* end of [auxlst] *)
//
} (* end of [auxdapp] *)

(* ****** ****** *)

fun
aux_tuple
( env0
: !compenv
, h0p0
: h0pat
, l1v1
: l1val): l1pck =
let
val-
H0Ptuple
( knd0
, npf1
, h0ps) = h0p0.node()
//
fun
auxnps
( env0:
! compenv
, npf1: int
, h0ps
: h0patlst): l1pcklst =
(
case+ h0ps of
|
list_nil() =>
list_nil()
|
list_cons _ =>
if
(npf1 > 0)
then
let
val
npf1 = npf1 - 1
val-
list_cons
(_, h0ps) = h0ps
in
auxnps
(env0, npf1, h0ps)
end
else
auxlst
(env0, h0ps, 0(*idx0*))
) (* end of [auxnps] *)
//
and
auxlst
( env0:
! compenv
, h0ps
: h0patlst
, idx0: int): l1pcklst =
(
case+ h0ps of
|
list_nil() => list_nil()
|
list_cons
(h0p1, h0ps) =>
let
val
loc1 = l1v1.loc()
val
arg1 =
(
if
(knd0 > 0)
then
l1val_carg
(loc1, l1v1, idx0)
else
l1val_targ
(loc1, l1v1, idx0)): l1val
//
val
pck1 = 
xcomp01_h0pat_ck0
(env0, h0p1, arg1)
//
in
list_cons(pck1, pcks) where
{
val
pcks =
auxlst(env0, h0ps, idx0+1)
}
end
) (* end of [auxlst] *)
//
in
L1PCKtup
(knd0, auxnps(env0, npf1, h0ps))
end (* end of [aux_tuple] *)

in(*in-of-local*)

implement
xcomp01_h0pat_ck0
( env0
, h0p0, l1v1) =
let
val
loc0 = h0p0.loc()
in
//
case+
h0p0.node() of
//
|
H0Pany _ => L1PCKany()
|
H0Pvar _ => L1PCKany()
//
|
H0Pint
( tok1 ) =>
(
  L1PCKint(tok1, l1v1)
)
|
H0Pbtf
( tok1 ) =>
(
  L1PCKbtf(tok1, l1v1)
)
|
H0Pchr
( tok1 ) =>
(
  L1PCKchr(tok1, l1v1)
)
|
H0Pstr
( tok1 ) =>
(
  L1PCKstr(tok1, l1v1)
)
//
|
H0Pbang(h0p1) =>
xcomp01_h0pat_ck0
( env0, h0p1(*var*), l1v1 )
|
H0Pflat(h0p1) =>
xcomp01_h0pat_ck0
( env0, h0p1(*con*), l1v1 )
|
H0Pfree(h0p1) =>
xcomp01_h0pat_ck0
( env0, h0p1(*con*), l1v1 )
//
|
H0Pcon( hdc1 ) =>
let
val ldc1 =
xcomp01_hdcon(env0, hdc1)
in
  L1PCKcon(ldc1, l1v1(*ctag*))
end
//
|
H0Pdap1 _ =>
(
auxdap1
(env0, h0p0, l1v1(*con-val*))
)
//
|
H0Pdapp _ =>
(
auxdapp
(env0, h0p0, l1v1(*con-val*))
)
//
|
H0Ptuple _ =>
(
aux_tuple
(env0, h0p0, l1v1(*tup-val*))
)
//
|
_ (*else*) => L1PCKxpat(h0p0, l1v1)
//
end // end of [xcomp01_h0pat_ck0]

end // end of [local]

(* ****** ****** *)

local

fun
auxvar
( env0:
! compenv
, h0p0: h0pat
, l1v1: l1val): void =
(
xcomp01_dvaradd_bind
( env0, hdv0, l1v1 )
) where
{
(*
val loc0 = h0p0.loc()
*)
val-
H0Pvar(hdv0) = h0p0.node()
} (* end of [auxvar] *)

(* ****** ****** *)

local

fun
auxtalf
( l1v0
: l1val): l1val =
(
case+
l1v0.node() of
|
L1VALcarg
(l1v1, idx2) => //boxed!
let
  val loc0 = l1v0.loc( )
in
  l1val_cofs(loc0, l1v1, idx2)
end
//
| _(* else *) => l1val_talf(l1v0)
)

in(* in-of-local *)

fun
auxbang
( env0:
! compenv
, h0p0: h0pat
, l1v1: l1val): void =
let
(*
val loc0 = h0p0.loc()
*)
val-
H0Pbang
( h0p1 ) = h0p0.node()
//
in
case+
h0p1.node() of
|
H0Pvar _ =>
let
val
lptr = auxtalf(l1v1)
//
(*
val () =
println!
("auxbang: H0Pvar: lptr = ", lptr)
*)
//
in
xcomp01_h0pat_ck1(env0, h0p1, lptr)
end // end of [H0Pvar]
| _ (* else *) =>
xcomp01_h0pat_ck1(env0, h0p1, l1v1)
end (*let*) // end of [auxbang]

end // end of [local]

(* ****** ****** *)

fun
auxflat
( env0:
! compenv
, h0p0: h0pat
, l1v1: l1val): void =
let
(*
val loc0 = h0p0.loc()
*)
val-
H0Pflat
( h0p1 ) = h0p0.node()
in
xcomp01_h0pat_ck1(env0, h0p1, l1v1)
end (*let*) // end of [auxflat]

(* ****** ****** *)

fun
auxfree
( env0:
! compenv
, h0p0: h0pat
, l1v1: l1val): void =
let
(*
val loc0 = h0p0.loc()
*)
val-
H0Pfree
( h0p1 ) = h0p0.node()
in
xcomp01_h0pat_ck1(env0, h0p1, l1v1)
end (*let*) // end of [auxfree]

(* ****** ****** *)

fun
auxdapp
( env0:
! compenv
, h0p0: h0pat
, l1v1: l1val): void =
let
//
val
loc0 = h0p0.loc()
//
val-
H0Pdapp
( h0f0
, npf1
, h0ps) = h0p0.node()
//
in
let
//
fun
auxh0ps
( env0:
! compenv
, npf1: int
, h0ps
: h0patlst
, idx0: int): void =
(
case+ h0ps of
|
list_nil() => ()
|
list_cons
(h0p1, h0ps) =>
if
npf1 > 0
then
let
val npf1 = npf1-1
in
auxh0ps
(env0, npf1, h0ps, idx0)
end // end of [then]
else
let
val
loc1 =
l1v1.loc()
val
carg =
l1val_carg
(loc1, l1v1, idx0)
val () =
xcomp01_h0pat_ck1
(env0, h0p1, carg)
in
let
val idx0 = idx0+1
in
auxh0ps
(env0, npf1, h0ps, idx0)
end
end // end of [else]
) (* end of [auxh0ps] *)
//
in
auxh0ps
(env0, npf1, h0ps, 0(*idx0*))
end // end of [let]
//
end (*let*) // end of [auxdapp]

(* ****** ****** *)

fun
aux_tuple
( env0:
! compenv
, h0p0: h0pat
, l1v1: l1val): void =
let
//
val
loc0 = h0p0.loc()
//
val-
H0Ptuple
( knd0
, npf1
, h0ps) = h0p0.node()
//
in
let
//
fun
auxh0ps
( env0:
! compenv
, npf1: int
, h0ps
: h0patlst
, idx0: int): void =
(
case+ h0ps of
|
list_nil() => ()
|
list_cons
(h0p1, h0ps) =>
if
npf1 > 0
then
let
val npf1 = npf1-1
in
auxh0ps
(env0, npf1, h0ps, idx0)
end // end of [then]
else
let
val
loc1 = l1v1.loc()
val
arg1 =
(
if
(knd0 > 0)
then
l1val_carg
(loc1, l1v1, idx0)
else
l1val_targ
(loc1, l1v1, idx0)): l1val
//
val () =
xcomp01_h0pat_ck1
(env0, h0p1, arg1)
//
in
auxh0ps
(env0, npf1, h0ps, idx0+1)
end // end of [else]
) (* end of [auxh0ps] *)
//
in
auxh0ps
(env0, npf1, h0ps, 0(*idx0*))
end // end of [let]
//
end (*let*) // end of [aux_tuple]

(* ****** ****** *)

in(*in-of-local*)

implement
xcomp01_h0pat_ck1
( env0
, h0p0, l1v1) =
let
val
loc0 = h0p0.loc()
in(*in-of-let*)
//
case+
h0p0.node() of
//
| H0Pany _ => ()
//
| H0Pvar _ =>
  auxvar(env0, h0p0, l1v1)
//
| H0Pbang _ =>
  auxbang(env0, h0p0, l1v1)
| H0Pflat _ =>
  auxflat(env0, h0p0, l1v1)
| H0Pfree _ =>
  auxfree(env0, h0p0, l1v1)
//
| H0Pdap1 _ => ()
| H0Pdapp _ =>
  auxdapp(env0, h0p0, l1v1)
//
| H0Ptuple _ =>
  aux_tuple(env0, h0p0, l1v1)
//
|
_ (* else *) =>
let
val lcmd =
l1cmd_make_node
(loc0, L1CMDmatch(h0p0, l1v1))
in
xcomp01_lcmdadd_lcmd(env0, lcmd)
end
//
end // end of [xcomp01_h0pat_ck1]

end // end of [local]

(* ****** ****** *)
implement
xcomp01_h0pat_ck01
(env0, h0p0, l1v1) =
let
val
loc0 = h0p0.loc()
val
lpck =
xcomp01_h0pat_ck0
(env0, h0p0, l1v1)
val
lcmd =
l1cmd_make_node
(loc0, L1CMDpatck(lpck))
val () =
xcomp01_lcmdadd_lcmd(env0, lcmd)
//
in
xcomp01_h0pat_ck1(env0, h0p0, l1v1)
end // end of [xcomp01_h0pat_ck01]
(* ****** ****** *)

local

fun
auxh0g0
( env0:
! compenv
, h0g0
: h0gua): l1pck =
(
case+
h0g0.node() of
|
H0GUAexp
(h0e1) =>
let
val () =
xcomp01_lcmdpush_nil(env0)
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
in
L1PCKgexp(l1v1, blk1) where
{
  val
  blk1 =
  xcomp01_lcmdpop0_blk(env0)
}
end // end of [H0GUAexp]
|
H0GUAmat
( h0e1
, h0p2) =>
L1PCKgmat(h0e1, h0p2)
)
and
auxh0gs
( env0:
! compenv
, h0gs
: h0gualst): l1pcklst =
(
case+ h0gs of
|
list_nil() =>
list_nil()
|
list_cons
(h0g1, h0gs) =>
(
list_cons(pck1, pcks)
) where
{
val pck1 = auxh0g0(env0, h0g1)
val pcks = auxh0gs(env0, h0gs)
}
)

in(*in-of-local*)

implement
xcomp01_h0gpat_ck0
( env0
, hgp0, l1v1) =
(
case-
hgp0.node() of
|
H0GPATpat(h0p1) =>
xcomp01_h0pat_ck0
( env0, h0p1, l1v1 )
|
H0GPATgua(h0p1, h0gs) =>
let
//
val
pck1 =
xcomp01_h0pat_ck0
( env0, h0p1, l1v1 )
//
val
pcks =
auxh0gs( env0, h0gs )
//
in
  L1PCKgpat(pck1, pcks)
end
) where
{
(*
val () =
println! (
"xcomp01_h0gpat_ck0: hgp0 = ", hgp0
) (* println! *)
*)
} (* end of [xcomp01_h0gpat_ck0] *)

end // end of [local]

(* ****** ****** *)

implement
xcomp01_h0gpat_ck1
( env0
, hgp0, l1v1) =
(
case-
hgp0.node() of
|
H0GPATpat(h0p1) =>
xcomp01_h0pat_ck1
( env0, h0p1, l1v1 )
|
H0GPATgua(h0p1, h0gs) =>
let
  val () = 
  xcomp01_h0pat_ck1
  ( env0, h0p1, l1v1 )
in
(*
  xcomp01_h0gualst_ck1(h0gs)
*)
end
) (* end of [xcomp01_h0gpat_ck1] *)

(* ****** ****** *)

local

(* ****** ****** *)
//
fun
auxpat_ck01
( env0:
! compenv
, arg0: int
, h0p1: h0pat): void =
let
//
val
loc0 = h0p1.loc()
//
val l1v0 =
l1val_tmp(tmp0) where
{
val tmp0 =
xltmpnew_arg1(env0, loc0, arg0)
}
//
in
xcomp01_h0pat_ck01(env0, h0p1, l1v0)
end // end of [auxpat_ck01]
//
(* ****** ****** *)
//
fun
auxnps_ck01
( env0:
! compenv
, arg0: int
, npf0: int
, h0ps: h0patlst): int =
(
case+
h0ps of
|
list_nil() => arg0
|
list_cons(h0p1, h0ps) =>
(
if
npf0 > 0
then
let
val npf0 = npf0 - 1
in
auxnps_ck01
(env0, arg0, npf0, h0ps)
end // end of [then]
else let
val
arg0 = arg0 + 1
val () =
auxpat_ck01(env0, arg0, h0p1)
in
  auxnps_ck01(env0, arg0, npf0, h0ps)
end // end of [else]
)
) (* end of [auxnps_ck01] *)
//
(* ****** ****** *)
//
fun
auxhfg_ck01
( env0:
! compenv
, arg0: int
, hfg0: hfarg): int =
(
case+
hfg0.node() of
//
| HFARGnpats
  (npf0, h0ps) =>
  auxnps_ck01
  ( env0
  , arg0, npf0, h0ps)
//
| HFARGnone0() => arg0
| HFARGnone1(ptr) => arg0
)
and
auxlst_ck01
( env0:
! compenv
, arg0: int
, hfgs: hfarglst): int =
(
case+ hfgs of
|
list_nil() => arg0
|
list_cons(x0, xs) =>
let
  val arg1 =
  auxhfg_ck01(env0, arg0, x0)
in
  auxlst_ck01(env0, arg1, xs)
 end // list_cons
) (* end of [auxlst_ck01] *)
//
(* ****** ****** *)

in(*in-of-local*)

implement
xcomp01_hfarglst_ck01
  (env0, hfgs) =
(
xcomp01_lcmdpop0_blk(env0)
) where
{
//
  val () =
  xcomp01_lcmdpush_nil(env0)
//
  val i0 = 0 (* arg index *)
//
  val narg =
  auxlst_ck01(env0, i0, hfgs)
//
} // end of [xcomp01_hfarglst_ck01]

end // end of [local]

(* ****** ****** *)

local

(*
#define VARG 0 // arg. vars
#define VLOC 0 // local vars
#define VENV 1 // environ. vars
*)
#define VFIX 2 // fixed binding
(*
#define VTOP %(~1) // top-level vars
*)

fun
auxval_var
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val 
loc0 = h0e0.loc()
val-
H0Evar(x0) = h0e0.node()
//
val
opt0 = xcomp01_dvarfind(env0, x0)
in
//
case+ opt0 of
| ~
Some_vt(l1v1) => l1v1
| ~
None_vt((*void*)) =>
l1val_make_node(loc0, L1VALvfix(x0))
//
end // end of [auxval_var]

fun
auxval_vknd
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val 
loc0 = h0e0.loc()
val-
H0Evknd
(k0, x0) = h0e0.node()
//
in
//
ifcase
|
k0 = VFIX =>
l1val_make_node
( loc0, L1VALvfix(x0) )
|
_ (* else *) =>
let
val
opt0 =
xcomp01_dvarfind(env0, x0)
//
in
//
case+ opt0 of
| ~
Some_vt(l1v1) => l1v1
| ~
None_vt((*void*)) =>
l1val_make_node(loc0, L1VALnone1(h0e0))
//
end // end-of-else
end // end of [auxval_vknd]

(* ****** ****** *)

fun
auxval_fcon
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val 
loc0 = h0e0.loc()
val-
H0Efcon
( hdc ) = h0e0.node()
//
in
let
val ldc =
xcomp01_hdcon(env0, hdc)
in
l1val_make_node(loc0, L1VALcon(ldc))
end
end // end of [auxval_fcon]

fun
auxval_tcon
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val 
loc0 = h0e0.loc()
val-
H0Etcon
(hdc, _) = h0e0.node()
//
in
//
let
val ldc =
xcomp01_hdcon(env0, hdc)
in
l1val_make_node(loc0, L1VALcon(ldc))
end
//
end // end of [auxval_tcon]

(* ****** ****** *)

fun
auxval_fcst
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val 
loc0 = h0e0.loc()
val-
H0Efcst(hdc) = h0e0.node()
//
in
//
if
hdcst_fcastq(hdc)
then
let
val
nam = "XATS2JS_fcast"
in
l1val_make_node(loc0, L1VALnam(nam))
end
else
l1val_make_node(loc0, L1VALfcst(hdc))
//
end // end of [auxval_fcst]

(* ****** ****** *)

fun
auxval_timp
( env0:
! compenv
, h0e0: h0exp): l1val =
let
val
loc0 = h0e0.loc()
val-
H0Etimp
( stmp
, h0e1, targ
, hdcl, tsub) = h0e0.node()
//
val-
H0Etcst
( hdc1, htia) = h0e1.node()
//
val
ltc1 =
ltcst_new_hdc( loc0, hdc1 )
val
ldcl =
xcomp01_h0dcl_timp(env0, hdcl)
//
val () =
(
xcomp01_lcmdadd_lcmd(env0, lcmd)
) where
{
val
lcmd =
l1cmd_make_node(loc0, L1CMDdcl(ldcl))
}
//
in
  l1val_make_node(loc0, L1VALtcst(ltc1))
end // end of [auxval_timp]

(* ****** ****** *)

fun
auxval_pcon
( env0
: !compenv
, h0e0: h0exp): l1val =
let
val
loc0 = h0e0.loc()
val-
H0Epcon
( h0e1
, lab2) = h0e0.node()
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
//
in
let
val
opt2 =
$LAB.label_get_int(lab2)
//
val-~Some_vt(idx2) = opt2
//
in
  l1val_carg(loc0, l1v1, idx2)
end
//
end // end of [auxval_pcon]

(* ****** ****** *)

fun
auxval_pbox
( env0
: !compenv
, h0e0: h0exp): l1val =
let
val
loc0 = h0e0.loc()
val-
H0Epbox
( h0e1
, lab2
, idx2) = h0e0.node()
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
//
in
let
//
(*
val
opt2 =
$LAB.label_get_int(lab2)
val-~Some_vt(idx2) = opt2
*)
//
in
l1val_carg(loc0, l1v1, idx2)
end // end of [let]
//
end // end of [auxval_pbox]

(* ****** ****** *)

fun
auxval_proj
( env0
: !compenv
, h0e0: h0exp): l1val =
let
val
loc0 = h0e0.loc()
val-
H0Eproj
( h0e1
, lab2
, idx2) = h0e0.node()
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
//
in
let
//
(*
val
opt2 =
$LAB.label_get_int(lab2)
val-~Some_vt(idx2) = opt2
*)
//
in
l1val_targ(loc0, l1v1, idx2)
end // end of [let]
//
end // end of [auxval_proj]

(* ****** ****** *)

fun
auxval_plft
( env0
: !compenv
, h0e0: h0exp): l1val =
let
val
loc0 = h0e0.loc()
val-
H0Eplft
( h0e1
, lab2
, idx2) = h0e0.node()
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
//
in
let
//
(*
val
opt2 =
$LAB.label_get_int(lab2)
val-~Some_vt(idx2) = opt2
*)
//
in
l1val_tptr(loc0, l1v1, idx2)
end // end of [let]
//
end // end of [auxval_plft]

(* ****** ****** *)

fun
auxval_pptr
( env0
: !compenv
, h0e0: h0exp): l1val =
let
val
loc0 = h0e0.loc()
val-
H0Epptr
( h0e1
, lab2
, idx2) = h0e0.node()
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
//
in
let
//
(*
val
opt2 =
$LAB.label_get_int(lab2)
val-~Some_vt(idx2) = opt2
*)
//
in
l1val_tptr(loc0, l1v1, idx2)
end // end of [let]
//
end // end of [auxval_pptr]

(* ****** ****** *)

local

fun
auxlst_h0dcl
( env0
: !compenv
, dcls: h0dclist): void =
(
case+ dcls of
|
list_nil() => ()
|
list_cons
(hdcl, dcls) =>
(
auxlst_h0dcl(env0, dcls)
) where
{
val
ldcl =
xcomp01_h0dcl(env0, hdcl)
val
lcmd =
l1cmd_make_node
(hdcl.loc(), L1CMDdcl(ldcl))
val () =
xcomp01_lcmdadd_lcmd(env0, lcmd)
}
) (* end of [auxlst_h0dcl] *)

in(*in-of-local*)

fun
auxval_let
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val-
H0Elet
(dcls, h0e1) = h0e0.node()
//
val () =
auxlst_h0dcl( env0, dcls )
//
in
xcomp01_h0exp_val(env0, h0e1)
end // end of [auxval_let]

end // end of [local]

(* ****** ****** *)

fun
auxval_seqn
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val
loc0 = h0e0.loc()
val-
H0Eseqn
( h0es
, h0ez) = h0e0.node()
//
val () =
auxlst(env0, h0es) where
{
fun
auxlst
( env0:
! compenv
, h0es: h0explst): void =
(
case+ h0es of
|
list_nil() => ()
|
list_cons
(h0e1, h0es) =>
auxlst(env0, h0es) where
{
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
)
} (* where *) // end-of-val
//
in
  xcomp01_h0exp_val(env0, h0ez)
end // end of [auxval_seqn]

(* ****** ****** *)

fun
auxval_assgn
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val
loc0 = h0e0.loc()
val-
H0Eassgn
(h0e1, h0e2) = h0e0.node()
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
val
l1v2 =
xcomp01_h0exp_val(env0, h0e2)
//
val () =
let
val
lcmd =
l1cmd_make_node
(loc0, L1CMDassgn(l1v1, l1v2))
in
xcomp01_lcmdadd_lcmd(env0, lcmd)
end // end of [val]
//
in
l1val_make_node(loc0, L1VALnone0())
end // end of [auxval_assgn]

(* ****** ****** *)

fun
auxval_addr
( env0
: !compenv
, h0e0: h0exp): l1val =
let
//
val loc0 = h0e0.loc()
//
val-
H0Eaddr
( h0e1 ) = h0e0.node()
//
in
//
case+
h0e1.node() of
| _ (* else *) =>
l1val_addrize(l1v1) where
{
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
//
end // end of [auxval_addr]

(* ****** ****** *)

fun
auxval_flat
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val
loc0 = h0e0.loc()
val-
H0Eflat
( h0e1 ) = h0e0.node()
//
in
  l1val_flat(l1v1) where
{
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
end // end of [auxval_flat]

(* ****** ****** *)

fun
auxval_talf
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val
loc0 = h0e0.loc()
val-
H0Etalf
( h0e1 ) = h0e0.node()
//
in
//
case+
h0e1.node() of
|
_ (* else *) =>
l1val_talfize(l1v1) where
{
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
//
end // end of [auxval_talf]

(* ****** ****** *)

fun
auxval_eval
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val
loc0 = h0e0.loc()
val-
H0Eeval
( knd0
, h0e1 ) = h0e0.node()
//
in
//
case+
h0e1.node() of
|
_ (* else *) =>
//
// HX-2020-09-22:
// knd0=0: general
// knd0=1: ptr-dref
// knd0=2: lazy-eval
// knd0=3: llazy-eval
l1val_eval
(knd0, l1v1(*src*)) where
{
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
//
end // end of [auxval_eval]

(* ****** ****** *)

fun
auxval_free
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val
loc0 = h0e0.loc()
val-
H0Efree
( knd0
, h0e1 ) = h0e0.node()
//
in
//
case+
h0e1.node() of
|
_ (* else *) =>
//
// HX-2020-09-22:
// knd0=0: general
// knd0=1: ptr-free
// knd0=2: con-free
// knd0=3: llazy-free
l1val_free
(knd0, l1v1(*src*)) where
{
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
//
end // end of [auxval_free]

(* ****** ****** *)

fun
auxval_raise
( env0:
! compenv
, h0e0: h0exp): l1val =
let
//
val
loc0 = h0e0.loc()
val-
H0Eraise
( h0e1 ) = h0e0.node()
//
val () =
let
val
lcmd =
l1cmd_make_node
( loc0
, L1CMDraise(l1v1)) where
{
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
in
xcomp01_lcmdadd_lcmd(env0, lcmd)
end // end of [val]
//
in
l1val_make_node(loc0, L1VALnone0())
end // end of [auxval_raise]

(* ****** ****** *)

fun
auxset_dapp
( env0:
! compenv
, h0e0: h0exp
, tres: l1tmp): void =
let
//
val
loc0 = h0e0.loc()
val-
H0Edapp
( h0f0
, npf1
, h0es) = h0e0.node()
//
val () =
xcomp01_lcmdpush_nil(env0)
//
in
let
val
lapp =
l1cmd_make_node
( loc0
, L1CMDapp(tres, l1f0, l1vs))
val () =
xcomp01_lcmdadd_lcmd(env0, lapp)
//
val lblk =
l1cmd_make_node
(loc0, L1CMDblk(blk0)) where
{
val
blk0 = xcomp01_lcmdpop0_blk(env0)
}
in
  xcomp01_lcmdadd_lcmd(env0, lblk)
end where
{
val l1f0 =
xcomp01_h0exp_val(env0, h0f0)
val l1vs =
xcomp01_h0explst_arg(env0, npf1, h0es)
}
end (*let*) // end of [auxset_dapp]

(* ****** ****** *)

fun
auxset_tuple
( env0
: !compenv
, h0e0: h0exp
, tres: l1tmp): void =
let
//
val
loc0 = h0e0.loc()
val-
H0Etuple
( knd0
, npf1
, h0es) = h0e0.node()
//
val () =
xcomp01_lcmdpush_nil(env0)
//
in
let
val
ltup =
l1cmd_make_node
( loc0
, L1CMDtup(tres, knd0, l1vs))
val () =
xcomp01_lcmdadd_lcmd(env0, ltup)
//
val lblk =
l1cmd_make_node
(loc0, L1CMDblk(blk0)) where
{
val
blk0 = xcomp01_lcmdpop0_blk(env0)
}
in
  xcomp01_lcmdadd_lcmd(env0, lblk)
end where
{
val l1vs =
xcomp01_h0explst_arg(env0, npf1, h0es)
}
end (*let*) // end of [auxset_tuple]

(* ****** ****** *)

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
val-
H0Eif0
( h0e1
, h0e2
, opt3) = h0e0.node()
//
val l1v1 =
xcomp01_l1valize
  (env0, l1v1) where
{
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
//
val blk2 =
xcomp01_h0exp_blk(env0, h0e2, tres)
val blk3 =
xcomp01_h0expopt_blk(env0, opt3, tres)
//
in
  let
  val
  lcmd =
  l1cmd_make_node
  ( loc0
  , L1CMDif0(l1v1, blk2, blk3))
  in
    xcomp01_lcmdadd_lcmd(env0, lcmd)
  end
end (*let*) // end of [ auxset_if0 ]

(* ****** ****** *)

local
//
fun
auxpck0
( env0:
! compenv
, l1v1
: l1val
, hcl1
: h0clau): l1pck =
(
case-
hcl1.node() of
| H0CLAUpat
  (hgp1) =>
  xcomp01_h0gpat_ck0
  ( env0, hgp1, l1v1 )
| H0CLAUexp
  (hgp1, h0e1) =>
  xcomp01_h0gpat_ck0
  ( env0, hgp1, l1v1 )
)
and
auxpck0lst
( env0:
! compenv
, l1v1
: l1val
, hcls
: h0claulst): l1pcklst =
(
case+ hcls of
|
list_nil() => list_nil()
|
list_cons(hcl1, hcls) =>
list_cons(pck1, pcks) where
{
val pck1 =
auxpck0(env0, l1v1, hcl1)
val pcks =
auxpck0lst(env0, l1v1, hcls)
}
) (* end of [auxpck0lst] *)
//
fun
auxpck1
( env0:
! compenv
, l1v1
: l1val
, hcl1
: h0clau
, tres: l1tmp): l1blk =
(
case-
hcl1.node() of
|
H0CLAUexp
(h0gp, h0e1) =>
let
val () =
xcomp01_lcmdpush_nil(env0)
//
val () =
xcomp01_h0exp_set
( env0, h0e1, tres ) where
{
val () =
xcomp01_h0gpat_ck1(env0, h0gp, l1v1)
}
//
in
  xcomp01_lcmdpop0_blk(env0)
end // end of [H0CLAUexp]
)
//
and
auxpck1lst
( env0:
! compenv
, l1v1
: l1val
, hcls
: h0claulst
, tres: l1tmp): l1blklst =
(
case+ hcls of
|
list_nil() => list_nil()
|
list_cons(hcl1, hcls) =>
list_cons
( auxpck1
  (env0, l1v1, hcl1, tres)
, auxpck1lst
  (env0, l1v1, hcls, tres))
)
//
in(*in-of-local*)

(* ****** ****** *)

fun
auxset_case
( env0:
! compenv
, h0e0: h0exp
, tres: l1tmp): void =
let
//
val
loc0 = h0e0.loc()
val-
H0Ecase
( knd0
, h0e1
, hcls) = h0e0.node()
//
val
l1v1 =
xcomp01_l1valize
  ( env0, l1v1 ) where
{
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
//
val
tcas =
xltmpnew_tmp0(env0, loc0)
val
pcks =
auxpck0lst(env0, l1v1, hcls)
val
blks =
auxpck1lst(env0, l1v1, hcls, tres)
//
in
let
val
lcmd =
l1cmd_make_node
( loc0,
  L1CMDcase
  ( knd0
  , l1v1, tcas, pcks, blks))
in
  xcomp01_lcmdadd_lcmd(env0, lcmd)
end (* end-of-let *) end (* auxset_case *)

(* ****** ****** *)

fun
auxset_try0
( env0:
! compenv
, h0e0: h0exp
, tres: l1tmp): void =
let
//
val
loc0 = h0e0.loc()
val-
H0Etry0
( tok0
, h0e1
, hcls) = h0e0.node()
//
val
blk1 =
let
val () =
xcomp01_lcmdpush_nil(env0)
in
let
val () =
xcomp01_h0exp_set
(env0, h0e1, tres)
in
xcomp01_lcmdpop0_blk(env0)
end // end of [let]
end // end of [let]
//
val
texn =
l1exn_new_loc(loc0)
val
l1v1 = l1val_exn(texn)
val
tcas =
xltmpnew_tmp0(env0, loc0)
val
pcks =
auxpck0lst(env0, l1v1, hcls)
val
blks =
auxpck1lst(env0, l1v1, hcls, tres)
//
in
let
val
lcmd =
l1cmd_make_node
( loc0,
  L1CMDtry0
  ( blk1
  , texn, tcas, pcks, blks))
in
  xcomp01_lcmdadd_lcmd(env0, lcmd)
end (* end-of-let *) end (* auxset_try0 *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

fun
auxset_lam
( env0:
! compenv
, h0e0: h0exp
, tres: l1tmp): void =
let
//
val
loc0 = h0e0.loc()
val-
H0Elam
( knd0
, hfgs
, h0e1) = h0e0.node()
//
var res1
  : l1valopt = None()
//
val () =
xcomp01_flevinc(env0)
val () =
xcomp01_dvaradd_fun0(env0)
val () =
xcomp01_ltmpadd_fun0(env0)
//
val
flev =
xcomp01_flevget(env0)
//
val
blk0 =
xcomp01_hfarglst_ck01
  (env0, hfgs(*multi*))
//
val
blk1 =
let
val () =
xcomp01_lcmdpush_nil(env0)
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
val () = (res1 := Some(l1v1))
//
in
  xcomp01_lcmdpop0_blk( env0 )
end : l1blk // end of [val]
//
in
let
//
  val () =
  xcomp01_flevdec(env0)
  val () =
  xcomp01_dvarpop_fun0(env0)
  val flts =
  xcomp01_ltmppop_fun0(env0)
//
(*
val () =
(
 println!
 ("auxset_lam: lts = ", lts)
)
*)
//
in
let
  val
  l1am =
  L1LAMEXP@{
    loc=loc0
  , hag=hfgs
  , def=res1
  , lev=flev
  , lts=flts
  , hag_blk=blk0, def_blk=blk1
  } (* L1LAMEXP *)
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDlam(tres, l1am) )
in
  xcomp01_lcmdadd_lcmd(env0, lcmd)
end // end of [let]
end // end of [let]
end (*let*) // end of [auxset_lam]

(* ****** ****** *)

fun
auxset_fix
( env0:
! compenv
, h0e0: h0exp
, tres: l1tmp): void =
let
//
val
loc0 = h0e0.loc()
val-
H0Efix
( knd0
, hdv0
, hfgs
, h0e1) = h0e0.node()
//
var res1
  : l1valopt = None()
//
val () =
xcomp01_flevinc(env0)
val () =
xcomp01_dvaradd_fun0(env0)
val () =
xcomp01_ltmpadd_fun0(env0)
//
val
flev =
xcomp01_flevget(env0)
//
val
blk0 =
xcomp01_hfarglst_ck01
  (env0, hfgs(*multi*))
//
val
blk1 =
let
val () =
xcomp01_lcmdpush_nil(env0)
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
val () = (res1 := Some(l1v1))
//
in
  xcomp01_lcmdpop0_blk( env0 )
end : l1blk // end of [val]
//
in
let
//
  val () =
  xcomp01_flevdec(env0)
  val () =
  xcomp01_dvarpop_fun0(env0)
  val flts =
  xcomp01_ltmppop_fun0(env0)
//
(*
val () =
println!("auxset_fix: lts = ", lts)
*)
//
in
let
  val
  lfix =
  L1FIXEXP@{
    loc=loc0
  , nam=hdv0
  , hag=hfgs
  , def=res1
  , lev=flev
  , lts=flts
  , hag_blk=blk0, def_blk=blk1
  } (* L1FIXEXP *)
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDfix(tres, lfix) )
in
  xcomp01_lcmdadd_lcmd(env0, lcmd)
end // end of [let]
end // end of [let]
end (*let*) // end of [auxset_fix]

(* ****** ****** *)

fun
auxset_lazy
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
H0Elazy
( h0e1 ) = h0e0.node()
//
val
hfg0 =
hfarg_make_node
(loc0, HFARGnone0())
val
hfgs = list_sing(hfg0)
//
var res1
  : l1valopt = None( )
//
val () =
xcomp01_flevinc( env0 )
val () =
xcomp01_dvaradd_fun0(env0)
val () =
xcomp01_ltmpadd_fun0(env0)
//
val
flev =
xcomp01_flevget(env0)
//
val
blk0 = l1blk_none()
//
val
blk1 =
let
val () =
xcomp01_lcmdpush_nil(env0)
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
val () = (res1 := Some(l1v1))
//
in
  xcomp01_lcmdpop0_blk( env0 )
end : l1blk // end of [val]
//
in
let
//
  val () =
  xcomp01_flevdec(env0)
  val () =
  xcomp01_dvarpop_fun0(env0)
  val flts =
  xcomp01_ltmppop_fun0(env0)
//
(*
val () =
println!
("auxset_lazy: lts = ", lts)
*)
//
in
let
  val
  l1am =
  L1LAMEXP@{
    loc=loc0
  , hag=hfgs
  , def=res1
  , lev=flev
  , lts=flts
  , hag_blk=blk0, def_blk=blk1
  } (* L1LAMEXP *)
  val
  tlam =
  xltmpnew_tmp0(env0, loc0)
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDlam(tlam, l1am) )
  val () =
  xcomp01_lcmdadd_lcmd(env0, lcmd)
in
//
let
  val
  l1v1 = l1val_tmp(tlam)
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDlazy(tres, l1v1) )  
in
  xcomp01_lcmdadd_lcmd(env0, lcmd)
end // end of [let]
//
end // end of [let]
end // end of [let]
end (*let*) // end of [auxset_lazy]

(* ****** ****** *)

fun
auxset_llazy
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
H0Ellazy
( h0e1
, h0es ) = h0e0.node()
//
val
hfg0 =
hfarg_make_node
(loc0, HFARGnone0())
val
hfgs = list_sing(hfg0)
//
var res1
  : l1valopt = None( )
var res2
  : l1valopt = None( )
//
val () =
xcomp01_flevinc( env0 )
val () =
xcomp01_dvaradd_fun0(env0)
val () =
xcomp01_ltmpadd_fun0(env0)
//
val
flev =
xcomp01_flevget(env0)
//
val
blk0 =
l1blk_none() // argless
//
val
blk1 =
let
val () =
xcomp01_lcmdpush_nil(env0)
val
lres =
xcomp01_h0exp_val(env0, h0e1)
val () = (res1 := Some(lres))
//
in
  xcomp01_lcmdpop0_blk( env0 )
end : l1blk // end of [val blk1]
//
val
blk2 =
let
fun
auxlst
( env0:
! compenv
, xs: h0explst): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  auxlst(env0, xs)
) where
{
val _ =
xcomp01_h0exp_val(env0, x0)
}
) (* end of [auxlst] *)
//
val () =
xcomp01_lcmdpush_nil(env0)
val () = auxlst(env0, h0es)
//
in
  xcomp01_lcmdpop0_blk(env0)
end : l1blk // end of [val blk2]
//
in
let
//
  val () =
  xcomp01_flevdec(env0)
  val () =
  xcomp01_dvarpop_fun0(env0)
  val flts =
  xcomp01_ltmppop_fun0(env0)
//
(*
val () =
println!
("auxset_llazy: lts = ", lts)
*)
//
in
let
//
  val
  l1am =
  L1LAMEXP@{
    loc=loc0
  , hag=hfgs
  , def=res1
  , lev=flev
  , lts=flts
  , hag_blk=blk0, def_blk=blk1
  } (* L1LAMEXP *)
  val
  tlam =
  xltmpnew_tmp0(env0, loc0)
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDlam(tlam, l1am) )
  val () =
  xcomp01_lcmdadd_lcmd(env0, lcmd)
//
  val
  lfrs =
  L1LAMEXP@{
    loc=loc0
  , hag=hfgs
  , def=res2
  , lev=flev
  , lts=flts
  , hag_blk=blk0, def_blk=blk2
  } (* L1LAMEXP *)
  val
  tfrs =
  xltmpnew_tmp0(env0, loc0)
  val
  lcmd =
  l1cmd_make_node
  ( loc0, L1CMDlam(tfrs, lfrs) )
  val () =
  xcomp01_lcmdadd_lcmd(env0, lcmd)
//
in
//
let
  val
  l1v1 = l1val_tmp(tlam)
  val
  l1v2 = l1val_tmp(tfrs)
  val
  lcmd =
  l1cmd_make_node
  ( loc0
  , L1CMDllazy(tres, l1v1, l1v2))
in
  xcomp01_lcmdadd_lcmd(env0, lcmd)
end // end of [let]
//
end // end of [let]
end // end of [let]
end (*let*) // end of [auxset_llazy]

(* ****** ****** *)

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
//
| H0Ei00(int) =>
  l1val_make_node
  (loc0, L1VALi00(int))
| H0Eb00(btf) =>
  l1val_make_node
  (loc0, L1VALb00(btf))
| H0Es00(str) =>
  l1val_make_node
  (loc0, L1VALs00(str))
//
| H0Eint(tok) =>
  l1val_make_node
  (loc0, L1VALint(tok))
| H0Ebtf(tok) =>
  l1val_make_node
  (loc0, L1VALbtf(tok))
| H0Echr(tok) =>
  l1val_make_node
  (loc0, L1VALchr(tok))
//
| H0Eflt(tok) =>
  l1val_make_node
  (loc0, L1VALflt(tok))
| H0Estr(tok) =>
  l1val_make_node
  (loc0, L1VALstr(tok))
//
| H0Etop(tok) =>
  l1val_make_node
  (loc0, L1VALtop(tok))
//
| H0Evar _ =>
  auxval_var(env0, h0e0)
| H0Evknd _ =>
  auxval_vknd(env0, h0e0)
//
| H0Efcon _ =>
  auxval_fcon(env0, h0e0)
| H0Etcon _ =>
  auxval_tcon(env0, h0e0)
//
| H0Efcst _ =>
  auxval_fcst(env0, h0e0)
//
| H0Etimp _ =>
  auxval_timp(env0, h0e0)
//
|
H0Edapp _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_dapp(env0, h0e0, tres)
} (* end of [H0Edapp] *)
//
| H0Epcon _ =>
  auxval_pcon(env0, h0e0)
| H0Epbox _ =>
  auxval_pbox(env0, h0e0)
//
| H0Eproj _ =>
  auxval_proj(env0, h0e0)
| H0Eplft _ =>
  auxval_plft(env0, h0e0)
| H0Epptr _ =>
  auxval_pptr(env0, h0e0)
//
| H0Elet _ =>
  auxval_let( env0, h0e0 )
//
| H0Eseqn _ =>
  auxval_seqn( env0, h0e0 )
//
| H0Eassgn _ =>
  auxval_assgn( env0, h0e0 )
//
|
H0Etuple _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_tuple(env0, h0e0, tres)
} (* end of [H0Etuple] *)
//
| H0Eif0 _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_if0(env0, h0e0, tres)
} (* end of [ H0Eif0 ] *)
//
|
H0Ecase _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_case(env0, h0e0, tres)
} (* end of [H0Ecase] *)
//
| H0Elam _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_lam(env0, h0e0, tres)
} (* end of [ H0Elam ] *)
//
| H0Efix _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_fix(env0, h0e0, tres)
} (* end of [ H0Efix ] *)
//
| H0Etry0 _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_try0(env0, h0e0, tres)
} (* end of [H0Etry0] *)
//
| H0Eaddr _ =>
  auxval_addr(env0, h0e0)
| H0Eflat _ =>
  auxval_flat(env0, h0e0)
| H0Etalf _ =>
  auxval_talf(env0, h0e0)
//
| H0Eeval _ =>
  auxval_eval(env0, h0e0)
| H0Efree _ =>
  auxval_free(env0, h0e0)
//
|
H0Efold _ =>
l1val_make_node
(loc0, L1VALnone0(*void*))
//
|
H0Enone0 _ =>
l1val_make_node
(loc0, L1VALnone0(*void*))
//
|
H0Eraise _ =>
(
  auxval_raise(env0, h0e0)
)
//
| H0Elazy _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_lazy(env0, h0e0, tres)
} (* end of [H0Elazy] *)
//
| H0Ellazy _ =>
(
  l1val_tmp(tres)
) where
{
val
tres =
xltmpnew_tmp0(env0, loc0)
val () =
auxset_llazy(env0, h0e0, tres)
} (* end of [H0Ellazy] *)
//
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
//
|
H0Edapp _ =>
auxset_dapp(env0, h0e0, tres)
//
|
H0Etuple _ =>
auxset_tuple(env0, h0e0, tres)
//
|
H0Eif0 _ =>
(
  auxset_if0(env0, h0e0, tres)
)
|
H0Ecase _ =>
(
  auxset_case(env0, h0e0, tres)
)
//
| H0Elam _ =>
(
  auxset_lam(env0, h0e0, tres)
)
| H0Efix _ =>
(
  auxset_fix(env0, h0e0, tres)
)
//
| H0Etry0 _ =>
(
  auxset_try0(env0, h0e0, tres)
)
//
|
H0Elazy _ =>
(
  auxset_lazy(env0, h0e0, tres)
)
|
H0Ellazy _ =>
(
  auxset_llazy(env0, h0e0, tres)
)
//
|
_ (*rest-of-h0exp*) =>
let
val
l1v0 =
xcomp01_h0exp_val(env0, h0e0)
in
let
val
cmd0 =
l1cmd_make_node
( loc0, L1CMDmov(tres, l1v0) )
in
xcomp01_lcmdadd_lcmd(env0, cmd0)
end
end // end of [rest-of-h0exp]
//
end // end of [xcomp01_h0exp_set]

end // end of [local]

(* ****** ****** *)

implement
xcomp01_h0explst_val
  (env0, h0es) =
(
case+ h0es of
|
list_nil() =>
list_nil()
|
list_cons(h0e1, h0es) =>
let
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
in
list_cons(l1v1, l1vs) where
{
val l1vs =
xcomp01_h0explst_val(env0, h0es)
}
end
) (* end of [xcomp01_h0explst_val] *)

(* ****** ****** *)

implement
xcomp01_h0explst_arg
  (env0, npf1, h0es) =
(
case+ h0es of
|
list_nil() =>
list_nil()
|
list_cons(h0e1, h0es) =>
if
npf1 <= 0
then
let
val l1v1 =
xcomp01_h0exp_val(env0, h0e1)
in
  list_cons(l1v1, l1vs) where
  {
  val l1vs =
  xcomp01_h0explst_val(env0, h0es)
  }
end // end of [then]
else
let
val npf1 = npf1 - 1
in
xcomp01_h0explst_arg(env0, npf1, h0es)
end // end of [else]
) (* end of [xcomp01_h0explst_arg] *)

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

local
//
fun
aux_local
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
val
loc0 = dcl0.loc()
val-
H0Clocal
( head
, body) = dcl0.node()
//
val head =
xcomp01_h0dclist(env0, head)
val body =
xcomp01_h0dclist(env0, body)
//
in
l1dcl_make_node
( loc0, L1DCLlocal(head, body) )
end // end of [aux_local]
//
(*
HX-2020-09-23:
Recusion is handled
*)
//
fun
aux_fundecl
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
val
loc0 = dcl0.loc()
val-
H0Cfundecl
( knd0
, mopt
, tqas, hfds) = dcl0.node()
in
case+ tqas of
| list_nil() => // function
  aux_fundecl_none(env0, dcl0)
| list_cons _ => // template
  aux_fundecl_some(env0, dcl0)
end // end of [aux_fundecl]
//
and
aux_fundecl_none
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
val
loc0 = dcl0.loc()
val-
H0Cfundecl
( knd0
, mopt
, tqas
, hfds) = dcl0.node()
//
val () =
xcomp01_dvaradd_fun0(env0)
//
val () =
let
//
// HX: for recursion
//
fun
auxlst_bind
( env0
: !compenv
, hfds
: hfundeclist): void =
(
case+ hfds of
|
list_nil() => ()
|
list_cons
(hfd1, hfds) =>
let
  val+
  HFUNDECL
  ( rcd ) = hfd1
  val loc = rcd.loc
  val nam = rcd.nam
  val hdc = rcd.hdc
  val
  itm =
  l1val_make_node
  (loc, L1VALfcst(hdc))
  val () =
  xcomp01_dvaradd_bind
  (env0, nam, itm(*l1val*))
in
  auxlst_bind( env0, hfds )
end
) (* end of [auxlst_bind] *)
//
in
  auxlst_bind( env0, hfds )
end
//
val
lfds =
xcomp01_hfundeclist(env0, hfds)
//
val () = xcomp01_dvarpop_fun0(env0)
//
in
l1dcl_make_node(loc0, L1DCLfundecl(lfds))
end // end of [aux_fundecl_none]
//
and
aux_fundecl_some
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
//
val loc0 = dcl0.loc()
(*
HX: should template be compiled?
*)
in
l1dcl_make_node(loc0, L1DCLnone0(*void*))
end // end of [aux_fundecl_some]
//
(* ****** ****** *)
//
(*
HX-2020-09-23:
non-recursion is assumed
*)
//
fun
aux_valdecl
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
val
loc0 = dcl0.loc()
val-
H0Cvaldecl
( knd0
, mopt, hvds) = dcl0.node()
val
lvds =
xcomp01_hvaldeclist(env0, hvds)
in
l1dcl_make_node(loc0, L1DCLvaldecl(lvds))
end // end of [aux_valdecl]
//
(* ****** ****** *)

fun
aux_vardecl
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
val
loc0 = dcl0.loc()
val-
H0Cvardecl
( knd0
, mopt, hvds) = dcl0.node()
val
lvds =
xcomp01_hvardeclist(env0, hvds)
in
l1dcl_make_node(loc0, L1DCLvardecl(lvds))
end // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_excptcon
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
val
loc0 = dcl0.loc()
val-
H0Cexcptcon
( hdcs ) = dcl0.node()
//
val
blk0 = let
val () =
xcomp01_lcmdpush_nil(env0)
in
let
val () =
auxhdcs(env0, hdcs) where
{
fun
auxhdcs
( env0:
! compenv
, hdcs: hdconlst): void =
(
case+ hdcs of
|
list_nil() => ()
|
list_cons
(hdc1, hdcs) =>
(
  auxhdcs(env0, hdcs)
) where
{
//
val
loc1 = hdc1.loc()
val
tmp1 =
xltmpnew_tmp0(env0, loc1)
//
val
hdv1 =
hdcon_get_dvar(hdc1)
//
(*
val () =
println!
("aux_excptcon: hdc1 = ", hdc1)
val () =
println!
("aux_excptcon: hdv1 = ", hdv1)
*)
//
val () =
xcomp01_dvaradd_bind
(env0, hdv1, l1val_tmp(tmp1))
//
local
val
cmd1 =
l1cmd_make_node
(loc1, L1CMDexcon(tmp1))
in
val () =
xcomp01_lcmdadd_lcmd(env0, cmd1)
end // end of [local]
//
} (* end of [where] *)
) (* end of [auxhdcs] *)
} (* where *) // end-of-val
in
  xcomp01_lcmdpop0_blk(env0)
end
end // end of [val()=auxhdcs()]
//
in
l1dcl_make_node
(loc0, L1DCLexcptcon(hdcs, blk0(*init*)))
end // end of [aux_excptcon]

(* ****** ****** *)

fun
aux_impdecl3
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
//
val-
H0Cimpdecl3
( tok0
, stmp, mopt
, htqa
, hdc1, htia
, hfgs, body) = dcl0.node()
//
in
case+ htia of
|
HTIARGnone _ =>
aux_impdecl3_none(env0, dcl0)
|
HTIARGsome _ => // function-template
aux_impdecl3_some(env0, dcl0)
end // end of [aux_impdecl3]
//
and
aux_impdecl3_none
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
//
val-
H0Cimpdecl3
( tok0
, stmp, mopt
, htqa
, hdc1, htia
, hfgs, body) = dcl0.node()
//
var res1
  : l1valopt = None()
//
val () =
xcomp01_flevinc(env0)
val () =
xcomp01_dvaradd_fun0(env0)
val () =
xcomp01_ltmpadd_fun0(env0)
//
val
flev =
xcomp01_flevget(env0)
//
val
blk0 =
xcomp01_hfarglst_ck01
  (env0, hfgs(*multi*))
//
val
blk1 =
let
val ( ) =
xcomp01_lcmdpush_nil(env0)
//
val
l1v1 =
xcomp01_h0exp_val(env0, body)
val ( ) = (res1 := Some(l1v1))
//
in
  xcomp01_lcmdpop0_blk( env0 )
end // end of [Some]
//
in
let
//
val () =
xcomp01_flevdec(env0)
val () =
xcomp01_dvarpop_fun0( env0 )
val tmps =
xcomp01_ltmppop_fun0( env0 )
//
(*
val ( ) =
println!
("xcomp01_impdecl3: tmps = ", tmps)
*)
//
val
loc0 = dcl0.loc()
//
val
limp =
LIMPDECL@{
  loc=loc0
, hdc=hdc1
, hag=hfgs
, def=res1
, lev=flev
, lts=tmps
, hag_blk=blk0, def_blk=blk1
} (* LIMPDECL *)
//
in
  l1dcl_make_node
  ( loc0, L1DCLimpdecl(limp) )
end
//
end // end of [aux_impdecl3_none]
//
and
aux_impdecl3_some
( env0:
! compenv
, dcl0: h0dcl): l1dcl =
let
val loc0 = dcl0.loc()
in
l1dcl_make_node(loc0, L1DCLnone0(*none*))
end // end of [aux_impdecl3_some]

(* ****** ****** *)

in(*in-of-local*)

implement
xcomp01_h0dcl
  (env0, dcl0) =
let
(*
val
loc0 = dcl0.loc()
*)
in
//
case+
dcl0.node() of
//
|
H0Clocal _ =>
aux_local(env0, dcl0)
//
|
H0Cfundecl _ =>
aux_fundecl(env0, dcl0)
//
|
H0Cvaldecl _ =>
aux_valdecl(env0, dcl0)
|
H0Cvardecl _ =>
aux_vardecl(env0, dcl0)
//
|
H0Cexcptcon _ =>
aux_excptcon(env0, dcl0)
//
|
H0Cimpdecl3 _ =>
aux_impdecl3(env0, dcl0)
//
| _ (* else *) =>
  let
  val loc0 = dcl0.loc()
  in
  l1dcl_make_node(loc0, L1DCLnone1(dcl0))
  end
//
end // end of [xcomp01_h0dcl]

(* ****** ****** *)

implement
xcomp01_h0dcl_timp
  (env0, dcl0) =
(
case+
dcl0.node() of
//
|
H0Cfundecl _ =>
aux_fundecl_none(env0, dcl0)
//
|
H0Cimpdecl3 _ =>
aux_impdecl3_none(env0, dcl0)
//
|
_ (* else *) =>
let
  val loc0 = dcl0.loc()
in
l1dcl_make_node(loc0, L1DCLnone1(dcl0))
end // end of [non-H0Cfundecl]
//
) (* end of [xcomp01_h0dcl_timp] *)

end // end of [local]

(* ****** ****** *)

implement
xcomp01_h0dclist
  (env0, dcls) =
(
case+ dcls of
|
list_nil() =>
list_nil()
|
list_cons(dcl1, dcls) =>
let
val dcl1 =
xcomp01_h0dcl(env0, dcl1)
in
list_cons(dcl1, dcls) where
{
  val dcls =
  xcomp01_h0dclist(env0, dcls)
}
end
) (* end of [xcomp01_h0dclist] *)

(* ****** ****** *)

implement
xcomp01_hfundecl
  (env0, dcl0) =
let
//
val+
HFUNDECL
( rcd ) = dcl0
//
val loc = rcd.loc
val nam = rcd.nam
val hdc = rcd.hdc
val hag = rcd.hag
val def = rcd.def
//
var res
  : l1valopt = None()
//
val () =
xcomp01_flevinc(env0)
val () =
xcomp01_dvaradd_fun0(env0)
val () =
xcomp01_ltmpadd_fun0(env0)
//
(*
//
(*
HX:
This needs to be done
earlier due to recursion
*)
//
local
  val
  itm =
  l1val_make_node
  (loc, L1VALfcst(hdc))
in
  val () =
  xcomp01_dvaradd_bind
  (env0, nam, itm(*l1val*))
end // end of [local]
//
*)
//
val
flev =
xcomp01_flevget(env0)
//
val
blk0 =
(
case+ hag of
|
None() =>
l1blk_none()
|
Some(hfgs) =>
xcomp01_hfarglst_ck01
( env0, hfgs(*multi*) )
) : l1blk // end-of-val
//
val
blk1 =
(
case+ def of
|
None() => l1blk_none()
|
Some(h0e1) =>
let
val ( ) =
xcomp01_lcmdpush_nil(env0)
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
val ( ) = (res := Some(l1v1))
//
in
  xcomp01_lcmdpop0_blk( env0 )
end // end of [Some]
) : l1blk // end of [val]
//
//
in
let
//
  val () =
  xcomp01_flevdec(env0)
  val () =
  xcomp01_dvarpop_fun0(env0)
  val flts =
  xcomp01_ltmppop_fun0(env0)
//
(*
val ( ) =
println!
("xcomp01_hfundecl: lts = ", lts)
*)
//
in
  LFUNDECL@{
    loc=loc
  , nam=nam, hdc=hdc
  , hag=hag
  , def=res
  , lev=flev
  , lts=flts
  , hag_blk=blk0, def_blk=blk1
} (* LFUNDECL *)
end
end // end of [xcomp01_hfundecl]

(* ****** ****** *)

implement
xcomp01_hfundeclist
  (env0, xs) =
(
case+ xs of
|
list_nil() =>
list_nil()
|
list_cons(x0, xs) =>
list_cons(x0, xs) where
{
val x0 = xcomp01_hfundecl(env0, x0)
val xs = xcomp01_hfundeclist(env0, xs)
}
) (* end of [xcomp01_hfundeclist] *)

(* ****** ****** *)

implement
xcomp01_hvaldecl
  (env0, dcl0) =
let
//
val+
HVALDECL
( rcd ) = dcl0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
//
var res
  : l1valopt = None()
//
val blk =
(
case+ def of
|
None() => l1blk_none()
|
Some(h0e1) =>
(
xcomp01_lcmdpop0_blk(env0)
) where
{
val () =
xcomp01_lcmdpush_nil(env0)
//
val
l1v1 =
xcomp01_l1valize
  (env0, l1v1) where
{
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
}
val () = ( res := Some(l1v1) )
//
val () =
xcomp01_h0pat_ck01(env0, pat, l1v1)
//
} (* end of [Some] *)
) : l1blk // end of [val]
//
in
  LVALDECL@{
    loc=loc
  , pat=pat, def=res, def_blk=blk
  } (* LVALDECL *)
end // end of [xcomp01_hvaldecl]

(* ****** ****** *)

implement
xcomp01_hvaldeclist
  (env0, xs) =
(
case+ xs of
|
list_nil() =>
list_nil()
|
list_cons(x0, xs) =>
list_cons(x0, xs) where
{
val x0 = xcomp01_hvaldecl(env0, x0)
val xs = xcomp01_hvaldeclist(env0, xs)
}
) (* end of [xcomp01_hvaldeclist] *)

(* ****** ****** *)

implement
xcomp01_hvardecl
  (env0, dcl0) =
let
//
val+
HVARDECL
( rcd ) = dcl0
//
val loc = rcd.loc
val hdv = rcd.hdv
val ini = rcd.ini
//
var res
  : l1valopt = None()
//
val blk =
(
case+ ini of
|
None() => l1blk_none()
|
Some(h0e) =>
let
val ( ) =
xcomp01_lcmdpush_nil(env0)
//
val ini =
xcomp01_h0exp_val(env0, h0e)
val ( ) = (res := Some(ini))
//
(*
val ( ) =
xcomp01_bind(env0, hdv, l1v)
*)
//
in
  xcomp01_lcmdpop0_blk(env0)
end // end of [Some]
) : l1blk // end of [val]
//
val tmp = 
xltmpnew_tmp0(env0, loc)
val ( ) =
let
val l1v =
l1val_make_node
(loc, L1VALtmp(tmp))
in
xcomp01_dvaradd_bind(env0, hdv, l1v)
end // end of [val]
//
in
  LVARDECL@{
    loc=loc
  , hdv=hdv, ini=res
  , hdv_tmp=tmp, ini_blk=blk
  } (* LVARDECL *)
end // end of [xcomp01_hvardecl]

(* ****** ****** *)

implement
xcomp01_hvardeclist
  (env0, xs) =
(
case+ xs of
|
list_nil() => list_nil()
|
list_cons(x0, xs) =>
list_cons(x0, xs) where
{
val x0 = xcomp01_hvardecl(env0, x0)
val xs = xcomp01_hvardeclist(env0, xs)
}
) (* end of [xcomp01_hvardeclist] *)

(* ****** ****** *)

(* end of [xats_xcomp01_dynexp.dats] *)
