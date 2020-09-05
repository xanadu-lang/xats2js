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

datavtype
l1cmdstk =
| l1cmdstk_nil of ()
| l1cmdstk_mark of ()
| l1cmdstk_cons of (l1cmd, l1cmdstk)

datavtype
compenv =
COMPENV of @{
  l1cmdstk = l1cmdstk
}

absimpl
compenv_vtbox = compenv

in

implement
compenv_make_nil
  ((*void*)) =
let
in
COMPENV@{
  l1cmdstk = l1cmdstk_nil()
}
end // end of [compenv_make_nil]

(* ****** ****** *)

implement
compenv_free_nil
  ( env0 ) =
  free@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val-
~l1cmdstk_nil() = rcd.l1cmdstk
//
} (* end of [compenv_free_nil] *)
  
end // end of [local]

(* ****** ****** *)

implement
xcomp01_lcmdadd(env0, x0) = ()

(* ****** ****** *)
implement
xcomp01_lcmdpush_nil(env0) = ()
(* ****** ****** *)
implement
xcomp01_lcmdpop0_lst
  (env0) = list_nil((*void*))
(* ****** ****** *)
implement
xcomp01_lcmdpop0_blk
  (env0) =
l1blk_some(xcomp01_lcmdpop0_lst(env0))
(* ****** ****** *)

(* end of [xats_xcomp01_envmap.dats] *)
