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
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/xats2js.sats"

(* ****** ****** *)
//
#dynload "./../DATS/intrep1.dats"
#dynload "./../DATS/intrep1_print.dats"
#dynload "./../DATS/intrep1_xemit.dats"
//
#dynload "./../DATS/xats2js_main0.dats"
//
#dynload "./../DATS/xcomp01_util0.dats"
#dynload "./../DATS/xcomp01_envmap.dats"
#dynload "./../DATS/xcomp01_dynexp.dats"
//
(* ****** ****** *)
//
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then
(
  xats2js_main0(argc, argv)
)
else
{
val () =
prerrln!
("Hello from ATS3(xats2js)!")
//
val
XATSHOME = the_XATSHOME_get()
val
((*void*)) =
prerrln!
("xats2js: XATSHOME=",XATSHOME)
//
} (* else *) // end of [if]
) where
{
// (*
val out = stderr_ref
val ( ) =
$XATSOPT.echo_argc_argv(out, argc, argv)
// *)
} (* end of [main] *)
//
(* ****** ****** *)

(* end of [xats_xats2js.dats] *)
