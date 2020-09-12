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
#staload $LEX(* open *)
(* ****** ****** *)
#staload $INTREP0(* open *)
(* ****** ****** *)
overload
fprint with $STM.fprint_stamp
overload
fprint with $SYM.fprint_symbol
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
xemit01_txt00
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
loop(n0-1) where
{
val () = xemit01_blnk1(out)
}
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
loop(n0-1) where
{
val () = xemit01_blnk1(out)
}
} (* end of [xemit01_indnt] *)

(* ****** ****** *)
implement
xemit01_hdcon
(out, hdc) =
(
  fprint(out, hdc)
)
(* ****** ****** *)
implement
xemit01_hdcst
(out, hdc) =
{
val () =
fprint(out, sym)
(*
val () =
fprint(out, "__")
val () =
fprint(out, stmp)
*)
} where
{
  val sym = hdc.sym()
(*
  val stmp = hdc.stamp()
*)
} (* end of [xemit01_hdcst] *)
(* ****** ****** *)
implement
xemit01_ltcst
(out, ltc) =
{
val () =
xemit01_hdcst
(out, ltc.hdc())
(*
val () =
fprint(out, "__")
val () =
fprint(out, stmp)
*)
} where
{
(*
  val stmp = ltc.stamp()
*)
} (* end of [xemit01_ltcst] *)
(* ****** ****** *)

implement
xemit01_hfarg
( out
, lvl
, hfg, i0) =
(
case+
hfg.node() of
|
HFARGnpats
(npf1, h0ps) => i1 where
{
val () = xemit01_txt00(out, "(")
val i1 = auxlst(npf1, i0, i0, h0ps)
val () = xemit01_txt00(out, ")")
}
|
HFARGnone1 _ =>
let
  val () =
  fprint!(out, "(*ERROR*)") in i0
end
) where
{
//
fun
auxlst
( npf1: int
, i0: int
, i1: int
, h0ps: h0patlst): int =
(
case+ h0ps of
|
list_nil() => i1
|
list_cons
(h0p1, h0ps) =>
if
npf1 > 0
then
let
val npf1 = npf1-1
in
auxlst(npf1, i0, i1, h0ps)
end
else
let
//
val () =
if
(i1 > i0)
then
xemit01_txt00(out, ", ")
//
val i1 = i1 + 1
//
val () =
fprint!
(out, "a", lvl, "x", i1)
in
auxlst(npf1, i0, i1, h0ps)
end
) (* end of [auxlst] *)
//
} (* end of [xemit01_hfarg] *)

(* ****** ****** *)

implement
xemit01_hfarglst
( out
, lvl
, hfgs, i0) =
(
case+ hfgs of
|
list_nil() => i0
|
list_cons(hfg1, hfgs) =>
let
val i1 =
xemit01_hfarg(out, lvl, hfg1, i0)
in
xemit01_hfarglst(out, lvl, hfgs, i1)
end
) (* end of [xemit01_hfarglst] *)

(* ****** ****** *)
//
implement
xemit01_l1int
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_INT1(rep) => fprint(out, rep)
//
end // end of [xemit01_l1int]
(* ****** ****** *)
//
implement
xemit01_l1tmp
(out, tmp0) =
let
val arg = tmp0.arg()
in
//
if
(arg > 0)
then
let
val lvl = tmp0.lvl()
in
fprint!
(out, "a", lvl, "x", arg)
end // end of [then]
else
let
val stm = tmp0.stamp()
in
  fprint!(out, "tmp", stm)
end // end of [else]
//
end // end of [xemit01_l1tmp]
//
(* ****** ****** *)

implement
xemit01_l1val
(out, l1v0) =
(
case+
l1v0.node() of
//
|
L1VALint(tok) =>
xemit01_l1int(out, tok)
(*
|
L1VALcon(hdc1) =>
xemit01_hdcon(out, hdc1)
*)
|
L1VALtmp(tmp1) =>
xemit01_l1tmp(out, tmp1)
//
|
L1VALfcst(hdc1) =>
xemit01_hdcst(out, hdc1)
|
L1VALtcst(ltc1) =>
xemit01_ltcst(out, ltc1)
//
| _ (* else *) => fprint(out, l1v0)
//
) (* end of [xemit01_l1val] *)

(* ****** ****** *)

local
//
fun
aux_mov
( out
: FILEref
, lcmd
: l1cmd): void =
{
val () =
xemit01_l1tmp(out, tres)
val () =
xemit01_txt00(out, " = ")
val () =
xemit01_l1val(out, l1v1)
} where
{
val-
L1CMDmov
(tres, l1v1) = lcmd.node()
}
//
fun
aux_app
( out
: FILEref
, lcmd
: l1cmd): void =
{
val () =
xemit01_l1tmp(out, tres)
val () =
xemit01_txt00(out, " = ")
//
val () =
xemit01_l1val(out, l1f0)
//
val () = xemit01_txt00(out, "(")
//
local
fun
loop
( n0: int
, xs
: l1valist): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  loop(n0+1, xs)
) where
{
val () =
if
(n0 > 0)
then
xemit01_txt00(out, ", ")
val () = xemit01_l1val(out, x0)
} (* list_cons *)
)
in
val () = loop(0, l1vs)
end (* end of [local] *)
//
val () = xemit01_txt00(out, ")")
//
} where
{
//
val-
L1CMDapp
( tres
, l1f0, l1vs) = lcmd.node()
//
}
//
fun
aux_blk
( out
: FILEref
, lcmd
: l1cmd): void =
(
case+ blk1 of
|
L1BLKnone() => ()
|
L1BLKsome(xs) =>
{
val () =
xemit01_txtln( out, "{" )
val () =
xemit01_l1cmdlst(out, xs)
val () =
xemit01_txtln( out, "}" )
}
) where
{
val-
L1CMDblk(blk1) = lcmd.node()
}
//
fun
aux_dcl
( out
: FILEref
, lcmd
: l1cmd): void =
(
  xemit01_l1dcl(out, ldcl)
) where
{
val-
L1CMDdcl(ldcl) = lcmd.node()
}
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
val() = xemit01_txt00(out, "(")
val() = xemit01_l1val(out, l1v1)
val() = xemit01_txtln(out, ")")
//
val() =
xemit01_txtln(out, "// then")
val() = xemit01_txtln(out, "{")
val() = xemit01_l1blk(out, blk2)
val() = xemit01_txtln(out, "} // if-then")
//
val() =
xemit01_txtln(out, "else")
val() = xemit01_txtln(out, "{")
val() = xemit01_l1blk(out, blk3)
val() = xemit01_txtln(out, "} // if-else")
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
L1CMDmov _ => aux_mov(out, lcmd)
|
L1CMDapp _ => aux_app(out, lcmd)
|
L1CMDblk _ => aux_blk(out, lcmd)
|
L1CMDdcl _ => aux_dcl(out, lcmd)
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

(* ****** ****** *)

fun
aux_ltmplst
( out
: FILEref
, tmps
: l1tmplst): void =
(
case+ tmps of
|
list_nil() => ()
|
list_cons(t1, ts) =>
let
val i0 = t1.arg()
in
if
(i0 > 0)
then
(
aux_ltmplst(out, ts)
)
else
(
aux_ltmplst(out, ts)
) where
{
//
  val () =
  xemit01_txt00
  (out, "var ")
//
  val () =
  xemit01_l1tmp(out, t1)
//
  val () =
  xemit01_txtln(out, ";")
//
} (* end of [else] *)
end // end of [let]
) (* end of [aux_ltmplst] *)

(* ****** ****** *)

fun
aux_impdecl
( out
: FILEref
, dcl0: l1dcl): void =
let
val-
L1DCLimpdecl
(limp) = dcl0.node()
val+
LIMPDECL(rcd) = limp
//
val () =
xemit01_txtln
(out, "function")
//
val () =
xemit01_hdcst(out, rcd.hdc)
val
argcnt =
xemit01_hfarglst
( out
, rcd.lvl
, rcd.hag, 0(*base*))
val () = xemit01_newln(out)
//
val () =
xemit01_txtln(out, "{")
//
val () =
aux_ltmplst(out, rcd.lts)
//
val () =
xemit01_l1blk(out, rcd.def_blk)
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () =
xemit01_txt00(out, "return ")
val () = xemit01_l1val(out, res)
val () = xemit01_txt00(out, ";\n")
//
}
) : void // end-of-val
in
xemit01_txtln(out, "} // function")
end // end of [aux_impdecl]

(* ****** ****** *)

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
let
//
val+
LFUNDECL(rcd) = lfd0
//
val () =
xemit01_txtln
(out, "function")
//
val () =
xemit01_hdcst(out, rcd.hdc)
val () =
(
case+
rcd.hag of
|
None() => ()
|
Some(rcd_hag) =>
{
val
argcnt =
xemit01_hfarglst
( out
, rcd.lvl
, rcd_hag, 0(*base*) )
val () = xemit01_newln(out)
}
)
//
val () =
xemit01_txtln(out, "{")
//
val () =
aux_ltmplst(out, rcd.lts)
val () =
xemit01_l1blk(out, rcd.def_blk)
//
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () =
xemit01_txt00(out, "return ")
val () = xemit01_l1val(out, res)
val () = xemit01_txt00(out, ";\n")
//
}
) : void // end-of-val
in
xemit01_txtln(out, "} // function")
end (* end of [auxlfd0] *)

(* ****** ****** *)

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
let
val-
L1DCLfundecl
(lfds) = dcl0.node() in auxlfds(lfds)
end
end // end of [aux_fundecl]

(* ****** ****** *)

in(*in-of-local*)
//
implement
xemit01_l1dcl
(out, dcl0) =
let
val () =
fprint!(out, "//")
val () =
fprint!(out, dcl0)
val () =
fprint_newline(out)
in(*in-of-let*)
//
case+
dcl0.node() of
//
|
L1DCLimpdecl _ =>
{
val()=aux_impdecl(out, dcl0)
}
//
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
