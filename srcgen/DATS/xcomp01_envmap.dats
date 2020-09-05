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
//
datavtype
l1cmdstk =
|
l1cmdstk_nil of
  ((*void*))
|
l1cmdstk_push of
  (l1cmdstk(*rest*))
|
l1cmdstk_cons of
  (l1cmd, l1cmdstk(*rest*))
//
(* ****** ****** *)
//
fun
l1cmdstk_pop0_lst
( xs:
& l1cmdstk >> _): l1cmdlst =
let
fun
auxlst
( xs: l1cmdstk
, ys: l1cmdlst )
: (l1cmdstk, l1cmdlst) =
(
case+ xs of
|
l1cmdstk_nil() => (xs, ys)
| ~
l1cmdstk_push(tl) => (tl, ys)
| ~
l1cmdstk_cons(x1, tl) =>
let
val ys =
list_cons(x1, ys) in auxlst(tl, ys)
end
)
in
let
val
(xs1, xs2) =
auxlst(xs, list_nil()) in (xs := xs1; xs2)
end
end
//
(* ****** ****** *)

local

datavtype
compenv =
COMPENV of @{
  l1cmdstk = l1cmdstk
}

absimpl
compenv_vtbox = compenv

in(*in-of-local*)

implement
compenv_make_nil
  ((*void*)) =
let
(*
val () =
println!("compenv_make_nil")
*)
in
//
COMPENV@{
  l1cmdstk = l1cmdstk_nil()
}
//
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
  
(* ****** ****** *)

implement
xcomp01_lcmdadd
  (env0, x0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val () =
rcd.l1cmdstk :=
l1cmdstk_cons(x0, rcd.l1cmdstk)
//
} (* end of [xcomp01_lcmdadd] *)

(* ****** ****** *)

implement
xcomp01_lcmdpush_nil
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1cmdstk
val () =
rcd.l1cmdstk := l1cmdstk_push(xs)
//
} (* end of [xcomp01_lcmdadd] *)

(* ****** ****** *)

implement
xcomp01_lcmdpop0_lst
  (env0) =
let
val () = fold@(env0) in xs
end where
{
//
val+
@COMPENV(rcd) = env0
//
val xs =
l1cmdstk_pop0_lst(rcd.l1cmdstk)
//
} (* end of [xcomp01_lcmdadd] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
xcomp01_lcmdpop0_blk
  (env0) =
(
  l1blk_some
  ( xcomp01_lcmdpop0_lst(env0) )
)
//
(* ****** ****** *)

(* end of [xats_xcomp01_envmap.dats] *)
