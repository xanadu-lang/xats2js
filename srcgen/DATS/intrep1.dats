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

local

val
stamper =
$STM.stamper_new()

in (* in-of-local *)

implement
l1exn_stamp_new() =
$STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)
local

absimpl
l1exn_tbox = $rec
{
  l1exn_loc= loc_t // location
, l1exn_stamp= stamp (* unicity *)
} // end of [l1exn]

in (* in-of-local *)

implement
l1exn_new_loc
  (  loc  ) =
$rec
{ l1exn_loc= loc
, l1exn_stamp= stamp(*unicity*)
} where
{
  val stamp = l1exn_stamp_new()
}

(* ****** ****** *)
implement
l1exn_get_loc(ltc) = ltc.l1exn_loc
implement
l1exn_get_stamp(ltc) = ltc.l1exn_stamp
(* ****** ****** *)

end // end of [local]
(* ****** ****** *)

local

val
stamper =
$STM.stamper_new()

in (* in-of-local *)

implement
l1tmp_stamp_new() =
$STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

typedef
l1tmp_struct =
@{
  l1tmp_loc= loc_t
, l1tmp_arg= int // 0/1 : let/arg
, l1tmp_ref= int // 0/1 : val/ref
, l1tmp_ret= int // return status
, l1tmp_lev= int // function level
, l1tmp_stamp= stamp (* unicity *)
} // end of [l1tmp]
absimpl
l1tmp_tbox = ref(l1tmp_struct)

in (* in of [local] *)

(* ****** ****** *)

implement
l1tmp_new_tmp
  (loc) =
let
val
stamp =
l1tmp_stamp_new()
in
ref<l1tmp_struct>
@{
  l1tmp_loc= loc
, l1tmp_arg= 0(*let*)
, l1tmp_ref= 0(*val*)
, l1tmp_ret= 0(*nret*)
, l1tmp_lev= ~1 // uninited
, l1tmp_stamp= stamp(*unicity*)
} end // l1tmp_new_tmp
implement
l1tmp_new_arg
( loc
, idx ) =
ref<l1tmp_struct>
@{
  l1tmp_loc= loc
, l1tmp_arg= idx // idx >= 1
, l1tmp_ref= 0(*val*)
, l1tmp_ret= 0(*nret*)
, l1tmp_lev= ~1 // uninitied
, l1tmp_stamp= stamp(*unicity*)
} where
{
  val stamp = l1tmp_stamp_new()
}

(* ****** ****** *)
//
implement
l1tmp_get_loc(tmp) = tmp->l1tmp_loc
implement
l1tmp_get_arg(tmp) = tmp->l1tmp_arg
implement
l1tmp_get_ref(tmp) = tmp->l1tmp_ref
//
implement
l1tmp_get_lev
  (tmp) =
  tmp->l1tmp_lev
implement
l1tmp_set_lev
  (tmp, lev) =
(
  tmp->l1tmp_lev := lev
)
//
implement
l1tmp_get_stamp(tmp) = tmp->l1tmp_stamp
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
local

val
stamper =
$STM.stamper_new()

in (* in-of-local *)

implement
ltcst_stamp_new() =
$STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)
local

absimpl
ltcst_tbox = $rec
{
  ltcst_loc= loc_t // location
, ltcst_hdc= hdcst // original
, ltcst_stamp= stamp (* unicity *)
} // end of [ltcst]

in (* in-of-local *)

implement
ltcst_new_hdc
  (loc, hdc) =
$rec
{
  ltcst_loc= loc
, ltcst_hdc= hdc
, ltcst_stamp= stamp(*unicity*)
} where
{
  val stamp = ltcst_stamp_new()
}
(* ****** ****** *)

implement
ltcst_get_loc(ltc) = ltc.ltcst_loc
implement
ltcst_get_hdc(ltc) = ltc.ltcst_hdc
implement
ltcst_get_stamp(ltc) = ltc.ltcst_stamp

(* ****** ****** *)

end // end of [local]
(* ****** ****** *)

local

absimpl
l1val_tbox = $rec
{ l1val_loc= loc_t
, l1val_node= l1val_node
} (* end of [absimpl] *)

in

(* ****** ****** *)

implement
l1val_make_node
  (loc, node) = $rec
{
  l1val_loc=loc, l1val_node=node
}

(* ****** ****** *)

implement
l1val_get_loc(x0) = x0.l1val_loc
implement
l1val_get_node(x0) = x0.l1val_node

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
l1val_flat(l1v) =
l1val_make_node
(l1v.loc(), L1VALflat(l1v))
//
implement
l1val_addr(l1v) =
l1val_make_node
(l1v.loc(), L1VALaddr(l1v))
implement
l1val_talf(l1v) =
l1val_make_node
(l1v.loc(), L1VALtalf(l1v))
//
(* ****** ****** *)
implement
l1val_eval(knd, l1v) =
let
val loc = l1v.loc()
in
ifcase
| knd = 1 =>
l1val_make_node(loc, L1VALeval1(l1v))
| knd = 2 =>
l1val_make_node(loc, L1VALeval2(l1v))
| knd = 3 =>
l1val_make_node(loc, L1VALeval3(l1v))
| _ (*else*) =>
l1val_make_node(loc, L1VALeval0(l1v))
end // end of [l1val_eval]
(* ****** ****** *)
implement
l1val_free(knd, l1v) =
let
val loc = l1v.loc()
in
ifcase
| knd = 1 =>
l1val_make_node(loc, L1VALfree1(l1v))
| knd = 2 =>
l1val_make_node(loc, L1VALfree2(l1v))
| knd = 3 =>
l1val_make_node(loc, L1VALfree3(l1v))
| _ (*else*) =>
l1val_make_node(loc, L1VALfree0(l1v))
end // end of [l1val_free]
(* ****** ****** *)
//
implement
l1val_addrize(l1v0) =
(
case+
l1v0.node() of
|
L1VALflat(l1v1) => l1v1
//
|
L1VALcarg
(l1v1, idx2) =>
let
val
loc0 = l1v0.loc()
in
l1val_cofs(loc0, l1v1, idx2)
end
//
|
L1VALtarg
(l1v1, idx2) =>
let
val
loc0 = l1v0.loc()
in
l1val_tptr
(loc0, l1v1, idx2) where
{
val l1v1 = l1val_addrize(l1v1)
}
end // end of [L1VALtarg]
//
| L1VALeval1(l1v1) => l1v1
//
| _(*rest-of-l1val*) => l1val_addr(l1v0)
)
//
(* ****** ****** *)
//
implement
l1val_talfize(l1v0) =
(
case+
l1v0.node() of
|
L1VALflat(l1v1) => l1v1
//
|
L1VALcarg
(l1v1, idx2) =>
let
val
loc0 = l1v0.loc()
in
l1val_cofs(loc0, l1v1, idx2)
end
//
|
L1VALtarg
(l1v1, idx2) =>
let
val
loc0 = l1v0.loc()
in
l1val_tptr
(loc0, l1v1, idx2) where
{
val l1v1 = l1val_talfize(l1v1)
}
end // end of [L1VALtarg]
//
| L1VALeval1(l1v1) => l1v1
//
| _(*rest-of-l1val*) => l1val_talf(l1v0)
)
//
(* ****** ****** *)
//
implement
l1val_ctag
(loc, l1v) =
l1val_make_node
(loc, L1VALctag(l1v))
implement
l1val_carg
(loc, l1v, idx) =
l1val_make_node
(loc, L1VALcarg(l1v, idx))
implement
l1val_cofs
(loc, l1v, idx) =
l1val_make_node
(loc, L1VALcofs(l1v, idx))
//
(* ****** ****** *)
//
implement
l1val_targ
(loc, l1v, idx) =
l1val_make_node
(loc, L1VALtarg(l1v, idx))
implement
l1val_tptr
(loc, l1v, idx) =
l1val_make_node
(loc, L1VALtptr(l1v, idx))
//
(* ****** ****** *)
//
(*
local

absimpl
l1lvl_tbox = $rec
{ l1lvl_loc= loc_t
, l1lvl_node= l1lvl_node
} (* end of [absimpl] *)

in(*in-of-local*)

(* ****** ****** *)

implement
l1lvl_make_node
  (loc, node) = $rec
{
  l1lvl_loc=loc, l1lvl_node=node
}

(* ****** ****** *)

implement
l1lvl_get_loc(x0) = x0.l1lvl_loc
implement
l1lvl_get_node(x0) = x0.l1lvl_node

(* ****** ****** *)

end // end of [local]
*)
//
(* ****** ****** *)

local

absimpl
l1cmd_tbox = $rec
{ l1cmd_loc= loc_t
, l1cmd_node= l1cmd_node
} (* end of [absimpl] *)

in

implement
l1cmd_make_node
  (loc, node) = $rec
{
  l1cmd_loc=loc, l1cmd_node=node
}

(* ****** ****** *)

implement
l1cmd_get_loc(x0) = x0.l1cmd_loc
implement
l1cmd_get_node(x0) = x0.l1cmd_node

end // end of [local]

(* ****** ****** *)

implement
l1blk_none() = L1BLKnone()
implement
l1blk_some(xs) = L1BLKsome(xs)

(* ****** ****** *)

local

absimpl
l1dcl_tbox = $rec
{ l1dcl_loc= loc_t
, l1dcl_node= l1dcl_node
} (* end of [absimpl] *)

in

implement
l1dcl_make_node
  (loc, node) = $rec
{
  l1dcl_loc=loc, l1dcl_node=node
}

(* ****** ****** *)

implement
l1dcl_get_loc(x0) = x0.l1dcl_loc
implement
l1dcl_get_node(x0) = x0.l1dcl_node

end // end of [local]

(* ****** ****** *)

(* end of [xats_intrep1.dats] *)
