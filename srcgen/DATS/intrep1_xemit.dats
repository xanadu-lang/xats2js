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
#staload $INTREP0(* open *)
(* ****** ****** *)

#staload "./../SATS/intrep1.sats"

(* ****** ****** *)

implement
{}(*tmp*)
xemit01_out() = stdout_ref

(* ****** ****** *)
implement
{}(*tmp*)
xemit01_int
(int) =
(
fprint(out, int)
) where
{
val out = xemit01_out<>()
}
(* ****** ****** *)
implement
{}(*tmp*)
xemit01_text
(text) =
(
fprint(out, text)
) where
{
val out = xemit01_out<>()
}
(* ****** ****** *)
implement
{}(*tmp*)
xemit01_blnk1
((*void*)) =
(
fprint(out, ' ')
) where
{
val out = xemit01_out<>()
}
(* ****** ****** *)
implement
{}(*tmp*)
xemit01_newln
((*void*)) =
(
fprint(out, '\n')
) where
{
val out = xemit01_out<>()
}
(* ****** ****** *)

implement
{}(*tmp*)
xemit01_nblnk
  (n0) =
let
val
xblnk1 =
xemit01_blnk1<>
in
  loop(n0) where
{
fun
loop(n0: int): void =
if n0 > 0
then
(xblnk1(); loop(n0-1)) else ()
}
end // end of [xemit01_nblnk]

(* ****** ****** *)

implement
{}(*tmp*)
xemit01_indnt
  (nind) =
let
val
xblnk1 =
xemit01_blnk1<>
in
  loop(nind) where
{
fun
loop(n0: int): void =
if n0 > 0
then
(xblnk1(); loop(n0-1)) else ()
}
end // end of [xemit01_indnt]

(* ****** ****** *)

implement
{}(*tmp*)
xemit01_l1tmp
  (tmp0) =
(
fprint!(out, tmp0)
) where
{
val out = xemit01_out<>()
}

(* ****** ****** *)

implement
{}(*tmp*)
xemit01_l1val
  (l1v0) =
(
fprint!(out, l1v0)
) where
{
val out = xemit01_out<>()
}

(* ****** ****** *)

implement
{}(*tmp*)
xemit01_l1cmd
  (lcmd) =
(
fprint!(out, lcmd)
) where
{
val out = xemit01_out<>()
}

(* ****** ****** *)

implement
{}(*tmp*)
xemit01_l1dcl
  (dcl0) =
(
fprint!(out, dcl0)
) where
{
val out = xemit01_out<>()
}

(* ****** ****** *)
implement
{}(*tmp*)
xemit01_program
  (dcls) = let
//
val
xindnt = xemit01_indnt<>
val
xnewln = xemit01_newln<>
val
xl1dcl = xemit01_l1dcl<>
//
in
//
auxlst(dcls) where
{
fun
auxlst
( xs
: l1dclist): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
let
(*
  val () = xindnt(0)
*)
  val () = xl1dcl(x0)
  val () = xnewln(  ) in auxlst(xs)
end
) (* auxlst *)
} (* end of [where] *)
//
end // end of [xemit01_program]

(* ****** ****** *)

(* end of [xats_intrep1_emit0.dats] *)
