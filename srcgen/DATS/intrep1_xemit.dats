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
implement
xemit01_int
(out, int) =
(
  fprint(out, int)
)
(* ****** ****** *)
implement
xemit01_txt
(out, txt) =
(
fprint(out, txt)
)
implement
xemit01_txtln
(out, txt) =
(
fprint(out, txt);
fprint(out, '\n');
)
(* ****** ****** *)
implement
xemit01_blnk1
( out ) =
(
  fprint(out, ' ')
)
(* ****** ****** *)
implement
xemit01_newln
( out ) =
(
  fprint(out, '\n')
)
(* ****** ****** *)

implement
xemit01_nblnk
( out, n0) =
( loop(n0) ) where
{
fun
loop(n0: int): void =
if n0 > 0
then
(xemit01_blnk1(out); loop(n0-1)) else ()
} (* end of [xemit01_nblnk] *)

(* ****** ****** *)

implement
xemit01_indnt
(out, nind) =
loop(nind) where
{
fun
loop(n0: int): void =
if n0 > 0
then
(xemit01_blnk1(out); loop(n0-1)) else ()
} (* end of [xemit01_indnt] *)

(* ****** ****** *)

implement
xemit01_l1tmp
(out, tmp0) =
(
fprint!(out, tmp0)
)

(* ****** ****** *)

implement
xemit01_l1val
(out, l1v0) =
(
fprint!(out, l1v0)
)

(* ****** ****** *)

local
//
fun
aux_if0
( out
: FILEref
, lcmd
: l1cmd): void =
{
//
val() =
xemit01_txtln(out, "if")
val() = xemit01_txt(out, "(")
val() = xemit01_l1val(out, l1v1)
val() = xemit01_txtln(out, ")")
//
val() =
xemit01_txtln(out, "then")
val() = xemit01_txtln(out, "{")
val() = xemit01_l1blk(out, blk2)
val() = xemit01_txtln(out, "} // then")
//
val() =
xemit01_txtln(out, "else")
val() = xemit01_txtln(out, "{")
val() = xemit01_l1blk(out, blk3)
val() = xemit01_txtln(out, "} // else")
//
} where
{
val-
L1CMDif0
(l1v1, blk2, blk3) = lcmd.node()
} (* where *) // end of [aux_if0]

in(*in-of-local*)
//
implement
xemit01_l1cmd
(out, lcmd) =
(
case+
lcmd.node() of
|
L1CMDif0 _ => aux_if0(out, lcmd)
//
|
_ (* else *) => fprint!(out, lcmd)
//
) (* end of [xemit01_l1cmd] *)
//
implement
xemit01_l1cmdlst
  (out, cmds) =
(
  loop( cmds )
) where
{
fun
loop
( cmds
: l1cmdlst): void =
(
case+ cmds of
|
list_nil() => ()
|
list_cons
(x0, cmds) =>
loop(cmds) where
{
val()=
xemit01_l1cmd(out, x0)
val()=
xemit01_txtln(out, ";")
}
)
} (* end of [xemit01_l1cmdlst] *)
//
end // end of [local]

(* ****** ****** *)
implement
xemit01_l1blk
(out, blk0) =
(
case+ blk0 of
|
L1BLKnone() => ()
|
L1BLKsome(cmds) =>
{
val()=xemit01_l1cmdlst(out, cmds)
}
) (* end of [xemit01_l1blk] *)
(* ****** ****** *)

local

fun
aux_fundecl
( out
: FILEref
, dcl0: l1dcl): void =
let
//
fun
auxlfd0
( lfd0
: lfundecl): void =
{
val () =
xemit01_txtln
(out, "function")
val () =
xemit01_txtln(out, "{")
val () =
xemit01_l1blk(out, rcd.def_blk)
val () =
xemit01_txtln(out, "}")
} where
{
val+LFUNDECL(rcd) = lfd0
}
and
auxlfds
( lfds
: lfundeclist): void =
(
case lfds of
|
list_nil() => ()
|
list_cons
(lfd0, lfds) =>
{
  val () = auxlfd0(lfd0)
  val () = auxlfds(lfds)
}
)
//
in
{
val () = auxlfds(lfds)
} where {
//
val-
L1DCLfundecl
  (lfds) = dcl0.node()
} end // end of [aux_fundecl]

in(*in-of-local*)
//
implement
xemit01_l1dcl
(out, dcl0) =
let
val () =
fprint!(out, dcl0)
val () =
fprint_newline(out)
in(*in-of-let*)
//
case+
dcl0.node() of
(*
|
L1DCLimpdecl _ =>
aux_impdecl(out, dcl0)
*)
|
L1DCLfundecl _ =>
{
val()=aux_fundecl(out, dcl0)
}
//
| _ (* else *) => fprint!(out, "L1DCL...(...)")
//
end // end of [xemit01_l1dcl]
//
end // end of [local]

(* ****** ****** *)

implement
xemit01_program
  (out, dcls) =
(
  auxlst(dcls) 
) where
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
  val () =
  xemit01_l1dcl(out, x0)
  val () = xemit01_newln(out)
  val () = xemit01_newln(out) in auxlst(xs)
end
) (* auxlst *)
} (* end of [xemit01_program] *)

(* ****** ****** *)

(* end of [xats_intrep1_xemit.dats] *)
