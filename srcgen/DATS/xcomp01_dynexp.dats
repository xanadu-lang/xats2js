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

implement
xcomp01_program
  (dcls) = dcls where
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
val
dcls =
xcomp01_h0dclist(env0, dcls)
//
val () = compenv_free_nil(env0)
//
} (* end of [xcomp01_program] *)

(* ****** ****** *)

local

in(*in-of-local*)

implement
xcomp01_h0pat_ck0
( env0
, h0p0, l1v1) =
let
val
loc0 = h0p0.loc()
in
case+
h0p0.node() of
//
| H0Pany _ =>
  L1BTFbtf_tt
| H0Pvar _ =>
  L1BTFbtf_tt
//
|
_ (* else *) =>
L1BTFtmp(tres) where
{
//
val
tres =
l1tmp_new(loc0)
val
lcmd =
l1cmd_make_node
( loc0
, L1CMDpatck0
  (tres, h0p0, l1v1))
//
val () =
xcomp01_lcmdadd(env0, lcmd)
//
}
end // end of [xcomp01_h0pat_ck0]

end // end of [local]

(* ****** ****** *)

local

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
(*
| H0Pvar _ =>
  auxvar(env0, h0p0, l1v1)
*)
//
| _ (* else *) =>
  (
    xcomp01_lcmdadd(env0, lcmd)
  ) where
  {
  val lcmd =
  l1cmd_make_node
  (loc0, L1CMDpatck1(h0p0, l1v1))
  }
//
end // end of [xcomp01_h0pat_ck1]

end // end of [local]

(* ****** ****** *)

local

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
//
val-
H0Edapp
( h0f0
, npf1
, h0es) = h0e0.node()
//
in
let
val
lcmd =
l1cmd_make_node
( loc0
, L1CMDapp(tres, l1f0, l1vs))
in
  xcomp01_lcmdadd(env0, lcmd)
end where
{
val l1f0 =
xcomp01_h0exp_val(env0, h0f0)
val l1vs =
xcomp01_h0explst_arg(env0, npf1, h0es)
}
end // end of [auxset_dapp]

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
//
|
H0Eint(tok) =>
l1val_make_node
(loc0, L1VALint(tok))
|
H0Ebtf(tok) =>
l1val_make_node
(loc0, L1VALbtf(tok))
//
|
H0Edapp _ =>
let
val
tres = l1tmp_new(loc0)
val () =
auxset_dapp(env0, h0e0, tres)
in
l1val_make_node(loc0, L1VALtmp(tres))
end
//
| H0Eif0 _ =>
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
//
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
( knd
, mopt, hvds) = dcl0.node()
val
lvds =
xcomp01_hvaldeclist(env0, hvds)
in
l1dcl_make_node(loc0, L1DCLvaldecl(lvds))
end // end of [aux_valdecl]

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
| H0Cvaldecl _ =>
  aux_valdecl(env0, dcl0)
//
| _ (* else *) =>
  let
  val loc0 = dcl0.loc()
  in
  l1dcl_make_node(loc0, L1DCLnone1(dcl0))
  end
//
end // end of [xcomp01_h0dcl]

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
let
val ( ) =
xcomp01_lcmdpush_nil(env0)
//
val
l1v1 =
xcomp01_h0exp_val(env0, h0e1)
val ( ) = (res := Some(l1v1))
//
val
lbtf =
xcomp01_h0pat_ck0(env0, pat, l1v1)
//
val ( ) =
let
  val lcmd =
  l1cmd_make_node
  (loc, L1CMDassrt(lbtf))
in
  xcomp01_lcmdadd(env0, lcmd)
end
//
val (  ) =
xcomp01_h0pat_ck1(env0, pat, l1v1)
//
in
  xcomp01_lcmdpop0_blk(env0)
end
)
in
LVALDECL@{
  loc=loc, pat=pat, def=res, blk=blk
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
val l1v =
xcomp01_h0exp_val(env0, h0e)
val ( ) = (res := Some(l1v))
//
(*
val ( ) =
xcomp01_bind(env0, hdv, l1v)
*)
//
in
  xcomp01_lcmdpop0_blk(env0)
end
)
in
LVARDECL@{
  loc=loc, hdv=hdv, ini=res, blk=blk
} (* LVARDECL *)
end // end of [xcomp01_hvardecl]

(* ****** ****** *)

implement
xcomp01_hvardeclist
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
val x0 = xcomp01_hvardecl(env0, x0)
val xs = xcomp01_hvardeclist(env0, xs)
}
) (* end of [xcomp01_hvardeclist] *)

(* ****** ****** *)

(* end of [xats_xcomp01_dynexp.dats] *)
