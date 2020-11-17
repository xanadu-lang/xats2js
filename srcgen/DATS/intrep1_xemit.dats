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
#staload $S1E(* open *)
#staload $S2E(* open *)
(* ****** ****** *)
#staload $INTREP0(* open *)
(* ****** ****** *)
overload
fprint with $STM.fprint_stamp
overload
fprint with $SYM.fprint_symbol
overload
fprint with $LOC.fprint_location
(* ****** ****** *)
overload
fprint
with $FP0.fprint_filpath_full2
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)

fun
chrunq
( rep
: string): char =
xatsopt_chrunq(rep) where
{
extern
fun
xatsopt_chrunq
( rep
: string
) : char = "ext#xatsopt_chrunq"
}
fun
strunq
( rep
: string): char =
xatsopt_strunq(rep) where
{
extern
fun
xatsopt_strunq
( rep
: string
) : char = "ext#xatsopt_strunq"
}

(* ****** ****** *)
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
fprint!(out, txt, '\n')
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
xemit01_hdvar
(out, hdv) =
fprint(out, hdv.sym())
(* ****** ****** *)
implement
xemit01_hdcon
(out, hdc) =
let
val
tag = hdc.tag()
in
if
tag >= 0
then
fprint(out, tag)
else
fprint(out, hdc.sym())
end // end of [xemit01_hdcon]
(* ****** ****** *)
local

(* ****** ****** *)

fun
auxnone
( out
: FILEref
, hdc: hdcst): void =
{
//
val
sym = hdc.sym()
val
loc = hdc.loc()
//
val () =
fprint(out, sym)
//
val () =
let
val
ntot = loc.beg_ntot()
in
fprint!(out, "_", ntot, "_")
end // end of [let]
//
} (* end of [auxnone] *)

(* ****** ****** *)

fun
auxsome
( out
: FILEref
, gnm: g1nam
, hdc: hdcst): void =
(
case+ gnm of
| G1Nnil() =>
  auxsome_nil(out, hdc, gnm)
| G1Nid0(id0) =>
  auxsome_id0(out, hdc, gnm)
| G1Nnone0() =>
  auxsome_none(out, hdc, gnm)
| _(*rest-of-g1nam*) =>
  auxsome_rest(out, hdc, gnm)
)

and
auxsome_nil
( out
: FILEref
, hdc: hdcst
, gnm: g1nam): void =
let
val
sym = hdc.sym()
in
  fprint!(out, sym)
end // end of [auxsome_nil]

and
auxsome_id0
( out
: FILEref
, hdc: hdcst
, gnm: g1nam): void =
let
val-
G1Nid0(sym) = gnm
in
  fprint!(out, sym)
end // end of [auxsome_nil]

and
auxsome_none
( out
: FILEref
, hdc: hdcst
, gnm: g1nam): void =
(
  auxsome_nil(out, hdc, gnm)
)

and
auxsome_rest
( out
: FILEref
, hdc: hdcst
, gnm: g1nam): void =
let
val
sym = hdc.sym()
in
  fprint!
  (out, sym, "_**EXNAME**_")
end // end of [auxsome_rest]

(* ****** ****** *)

in(*in-of-local*)
//
implement
xemit01_hdcst
(out, hdc) =
let
val
xnm = hdc.xnam()
in
//
case+ xnm of
|
X2NAMnone() =>
(
  auxnone(out, hdc)
)
|
X2NAMsome(gnm) =>
(
  auxsome(out, gnm, hdc)
)
//
end // end of [xemit01_hdcst]
//
end // end of [local]
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
} (*where*) // [xemit01_ltcst]
(* ****** ****** *)

implement
xemit01_ldcon
(out, ldc) =
(
case+ ldc of
| LDCONcon(hdc) =>
  xemit01_hdcon(out, hdc)
| LDCONval(l1v) =>
  xemit01_l1val(out, l1v)
) (* end of [xemit01_ldcon] *)

(* ****** ****** *)

implement
xemit01_hfarg
( out
, lev
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
HFARGnone0 _ => i0 where
{
val () = xemit01_txt00(out, "(")
val () = xemit01_txt00(out, ")")
}
|
HFARGnone1 _ => i0 // skipped
(*
let
val () = fprint(out, "(*ERROR*)") in i0
end
*)
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
(out, "a", lev, "x", i1)
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
, lev
, hfgs, i0) =
(
case+ hfgs of
|
list_nil() => i0
|
list_cons(hfg1, hfgs) =>
let
val i1 =
xemit01_hfarg(out, lev, hfg1, i0)
in
xemit01_hfarglst(out, lev, hfgs, i1)
end
) (* end of [xemit01_hfarglst] *)

(* ****** ****** *)
//
implement
xemit01_lvnam
(out, nam) =
fprint(out, nam)
//
(* ****** ****** *)
//
implement
xemit01_lvtop
(out, tok) =
fprint(out, "XATS2JS_top")
//
(* ****** ****** *)
//
implement
xemit01_lvi00
( out
, int) = fprint(out, int)
implement
xemit01_lvb00
( out
, btf) = fprint(out, btf)
//
(* ****** ****** *)
//
implement
xemit01_lvint
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_INT1
( rep ) => fprint(out, rep)
//
end // end of [xemit01_lvint]
//
(* ****** ****** *)
//
implement
xemit01_lvbtf
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_IDENT_alp
( rep ) => fprint(out, rep)
//
end // end of [xemit01_lvbtf]
//
(* ****** ****** *)
//
implement
xemit01_lvchr
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_CHAR_char
( rep ) => // FIXME?
(
fprint!
( out
, "XATS2JS_char(", rep, ")")
)
|
T_CHAR_slash // FIXME?
( rep ) =>
(
fprint!
( out
, "XATS2JS_char(", rep, ")")
)
//
end // end of [xemit01_lvchr]
(* ****** ****** *)
//
implement
xemit01_lvflt
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_FLOAT1(rep) =>
  fprint(out, rep) // HX: FIXME!!!
//
end // end of [xemit01_lvstr]
(* ****** ****** *)
//
implement
xemit01_lvstr
(out, tok) =
let
val
tnd = tok.node()
in
//
case- tnd of 
|
T_STRING_closed
  (rep) =>
  fprint(out, rep) // HX: FIXME!!!
//
end // end of [xemit01_lvstr]
(* ****** ****** *)
//
implement
xemit01_l1exn
(out, exn0) =
let
val
stm = exn0.stamp()
in
  fprint!(out, "exn", stm)
end // end of [let]
//
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
val lev = tmp0.lev()
in
fprint!
(out, "a", lev, "x", arg)
end // end of [then]
else
let
val lev = tmp0.lev()
val stm = tmp0.stamp()
in
//
if
(lev > 0)
then
fprint!(out, "xtmp", stm)
else
fprint!(out, "xtop", stm)
//
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
L1VALi00(int) =>
xemit01_lvi00(out, int)
|
L1VALb00(btf) =>
xemit01_lvb00(out, btf)
(*
|
L1VALs00(str) =>
xemit01_lvs00(out, str)
*)
//
|
L1VALint(tok) =>
xemit01_lvint(out, tok)
|
L1VALbtf(tok) =>
xemit01_lvbtf(out, tok)
|
L1VALchr(tok) =>
xemit01_lvchr(out, tok)
|
L1VALstr(tok) =>
xemit01_lvstr(out, tok)
|
L1VALflt(tok) =>
xemit01_lvflt(out, tok)
//
|
L1VALtop(tok) =>
xemit01_lvtop(out, tok)
//
|
L1VALnam(nam) =>
xemit01_lvnam(out, nam)
//
|
L1VALexn(exn1) =>
xemit01_l1exn(out, exn1)
|
L1VALtmp(tmp1) =>
xemit01_l1tmp(out, tmp1)
//
|
L1VALcon(ldc1) =>
xemit01_ldcon(out, ldc1)
//
|
L1VALfcst(hdc1) =>
xemit01_hdcst(out, hdc1)
|
L1VALtcst(ltc1) =>
xemit01_ltcst(out, ltc1)
//
|
L1VALvfix(hdv1) =>
xemit01_hdvar(out, hdv1)
//
|
L1VALflat(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_lval_get(")
  val () =
  xemit01_l1val(out, l1v1)
  val () = fprint(out, ")")
}
//
|
L1VALctag(l1v1) =>
{
  val () =
  xemit01_l1val(out, l1v1)
  val () =
  xemit01_txt00(out, "[0]")
}
|
L1VALcarg(l1v1, argi) =>
{
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, "[", argi+1, "]")
}
|
L1VALcofs(l1v1, idx2) =>
{
val () =
fprint
( out
, "XATS2JS_new_cofs(")
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, ",", idx2+1, ")")
}
//
|
L1VALtarg(l1v1, argi) =>
{
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, "[", argi+1, "]")
}
|
L1VALtptr(l1v1, argi) =>
{
val () =
fprint!
( out
, "XATS2JS_new_tptr(")
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, ",", argi+1, ")")
}
//
|
L1VALeval1(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_lval_get(")
  val () =
  xemit01_l1val(out, l1v1)
  val () =
  xemit01_txt00( out, ")" )
}
//
|
L1VALeval2(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_lazy_eval(")
  val () =
  xemit01_l1val(out, l1v1)
  val () =
  xemit01_txt00( out, ")" )
}
//
|
L1VALeval3(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_llazy_eval(")
  val () =
  xemit01_l1val(out, l1v1)
  val () =
  xemit01_txt00( out, ")" )
}
//
|
L1VALfree3(l1v1) =>
{
  val () =
  fprint
  ( out
  , "XATS2JS_llazy_free(")
  val () =
  xemit01_l1val(out, l1v1)
  val () =
  xemit01_txt00( out, ")" )
}
//
| L1VALnone0() =>
{
  val () = fprint( out, "null" )
}
//
| _ (* else *) => fprint(out, l1v0)
//
) (* end of [xemit01_l1val] *)

(* ****** ****** *)
//
implement
xemit01_l1pck
( out, pck1 ) =
{
  val () = fprintln!(out, pck1)
}
//
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
aux_con
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
xemit01_txt00(out, "[")
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
//
val () =
let
val-
L1VALcon
( ldc0 ) = l1f0.node()
in
xemit01_ldcon(out, ldc0)
end
val () = loop( 1, l1vs )
val () = xemit01_txt00(out, "]")
//
end (* end of [local] *)
//
} where
{
//
val-
L1CMDapp
( tres
, l1f0, l1vs) = lcmd.node()
//
} (* where *) // end of [aux_con]
//
fun
aux_tup
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
val () =
xemit01_l1val( out, x0 )
} (* list_cons *)
)
in
//
val () =
if
knd0 <= 0
then // flat
fprint!(out, "[", ~1)
else // boxed
fprint!(out, "[",  0)
//
val () = loop( 1, l1vs )
val () = xemit01_txt00(out, "];")
//
end (* end of [local] *)
//
} where
{
//
val-
L1CMDtup
( tres
, knd0, l1vs) = lcmd.node()
//
} (* where *) // end of [aux_tup]
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
xemit01_l1val( out, l1f0 )
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
//
val () =
if
(n0 > 0)
then
xemit01_txt00(out, ", ")
//
val () =
xemit01_l1val( out, x0 )
//
} (* list_cons *)
)
in
val () =
xemit01_txt00(out, "(")
val () = loop( 0, l1vs )
val () = xemit01_txt00(out, ")")
//
end (* end of [local] *)
//
} where
{
//
val-
L1CMDapp
( tres
, l1f0, l1vs) = lcmd.node()
//
} (* where *) // end of [aux_app]
//
fun
aux_lam
( out
: FILEref
, lcmd
: l1cmd): void =
{
//
val+
L1LAMEXP(rcd) = l1am
//
val () =
xemit01_l1tmp
( out, tres )
val () =
xemit01_txt00
(out, " =\nfunction")
//
val
argcnt =
xemit01_hfarglst
( out
, rcd.lev
, rcd.hag, 0(*base*))
val () = xemit01_newln(out)
//
val () =
xemit01_txtln(out, "{")
//
val () =
xemit01_txtln
( out
, "// XEMIT01_FTMPDECS: BEG" )
val () =
xemit01_ftmpdecs(out, rcd.lts)
val () =
xemit01_txtln
( out
, "// XEMIT01_FTMPDECS: END" )
//
val () =
xemit01_l1blk(out, rcd.hag_blk)
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
//
val () =
fprintln!(out, "} // lam-function")
//
} where
{
//
val-
L1CMDlam
(tres, l1am) = lcmd.node()
//
} (* where *) // end of [aux_lam]
//
fun
aux_fix
( out
: FILEref
, lcmd
: l1cmd): void =
{
//
val+
L1FIXEXP(rcd) = lfix
//
val () =
xemit01_l1tmp
( out, tres )
val () =
xemit01_txt00
( out, " =\nfunction\n" )
//
val () =
xemit01_hdvar(out, rcd.nam)
//
val
argcnt =
xemit01_hfarglst
( out
, rcd.lev
, rcd.hag, 0(*base*))
val () = xemit01_newln(out)
//
val () =
xemit01_txtln(out, "{")
//
val () =
xemit01_ftmpdecs(out, rcd.lts)
//
val () =
xemit01_l1blk(out, rcd.hag_blk)
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
//
val () =
fprintln!(out, "} // fix-function")
//
} where
{
//
val-
L1CMDfix
(tres, lfix) = lcmd.node()
//
} (* where *) // end of [aux_fix]
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

(* ****** ****** *)

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

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxpcklst
( out
: FILEref
, icas: int
, tcas: l1tmp
, pcks: l1pcklst): void =
let
//
fun
auxpck0
(pck0: l1pck) : void =
(
case+ pck0 of
|
L1PCKany() =>
fprintln!
(out, "//", pck0, ";")
//
|
L1PCKint(int, l1v) =>
{
val () =
xemit01_txt00(out, "if(")
val () =
xemit01_lvint( out, int )
val () =
xemit01_txt00(out, "!==")
val () =
xemit01_l1val( out, l1v )
val () =
xemit01_txtln(out, ") break;")
}
//
|
L1PCKbtf(btf, l1v) =>
{
val () =
xemit01_txt00(out, "if(")
val () =
xemit01_lvbtf( out, btf )
val () =
xemit01_txt00(out, "!==")
val () =
xemit01_l1val( out, l1v )
val () =
xemit01_txtln(out, ") break;")
}
//
|
L1PCKchr(chr, l1v) =>
{
val () =
xemit01_txt00(out, "if(")
val () =
xemit01_lvchr( out, chr )
val () =
xemit01_txt00(out, "!==")
val () =
xemit01_l1val( out, l1v )
val () =
xemit01_txtln(out, ") break;")
}
//
|
L1PCKstr(str, l1v) =>
{
val () =
xemit01_txt00(out, "if(")
val () =
xemit01_lvstr( out, str )
val () =
xemit01_txt00(out, "!==")
val () =
xemit01_l1val( out, l1v )
val () =
xemit01_txtln(out, ") break;")
}
//
|
L1PCKcon(ldc, l1v) =>
{
val () =
xemit01_txt00(out, "if(")
val () =
xemit01_ldcon( out, ldc )
val () =
xemit01_txt00(out, "!==")
val () =
xemit01_l1val( out, l1v )
val () =
xemit01_txtln(out, ") break;")
}
//
|
L1PCKapp(pck1, pcks) =>
{
  val () = auxpck0(pck1)
  val () = auxpcks(pcks)
}
//
|
L1PCKtup(knd0, pcks) =>
{
  val () = auxpcks(pcks)
}
//
|
L1PCKgexp(l1v1, blk1) =>
{
val () =
xemit01_l1blk(out, blk1)
val () =
xemit01_txt00(out, "if(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00(out, "!==")
val () =
xemit01_txt00(out, "true")
val () =
xemit01_txtln(out, ") break;")
}
//
|
L1PCKgpat(pck1, pcks) =>
{
  val () = auxpck0(pck1)
  val () = auxpcks(pcks)
}
//
| _ (* else *) =>
{
val () =
fprintln!(out, "//", pck0, ";")
}
)
//
and
auxpcks
(pcks: l1pcklst): void =
(
case+ pcks of
|
list_nil() => ()
|
list_cons(pck1, pcks) =>
{
  val () = auxpck0( pck1 )
  val () = auxpcks( pcks )
}
)
in
//
case+ pcks of
|
list_nil() => ()
|
list_cons
(pck1, pcks) =>
let
val () =
xemit01_txtln
( out, "do {" )
//
val () = auxpck0(pck1)
//
val () =
xemit01_l1tmp(out, tcas)
val () =
fprint!
(out, " = ", icas, ";\n")
val () =
xemit01_txtln
( out, "} while(false);" )
val () =
xemit01_txt00( out, "if(" )
val () =
xemit01_l1tmp( out, tcas )
val () =
xemit01_txt00( out, " > 0) break;\n" )
//
in
  auxpcklst(out, icas+1, tcas, pcks)
end (* end-of-let *)
end (* end-of-let *) // end of [auxpcklst]

(* ****** ****** *)

fun
auxblklst
( out
: FILEref
, icas: int
, tcas: l1tmp
, blks: l1blklst): void =
let
//
fun
auxblk0
( out
: FILEref
, blk1
: l1blk ) : void =
xemit01_l1blk(out, blk1)
//
in
case+ blks of
|
list_nil() => ()
|
list_cons(blk1, blks) =>
let
val () =
fprint!
(out, "case ", icas, ":\n")
val () = auxblk0(out, blk1)
val () =
xemit01_txt00(out, "break;\n")
in
auxblklst(out, icas+1, tcas, blks)
end (* end-of-let *)
end (* end-of-let *) // end of [auxblklst]

(* ****** ****** *)

in(* in-of-local*)

fun
aux_case
( out
: FILEref
, lcmd
: l1cmd): void =
{
//
val () =
xemit01_txt00(out, "{\n")
//
val () =
xemit01_l1tmp(out, tcas)
val () =
xemit01_txtln(out, " = 0;")
val () =
xemit01_txt00(out, "do {\n")
val () =
auxpcklst(out, 1(*i*), tcas, pcks)
val () =
fprint!( out, "} while(false);\n" )
//
val () =
fprintln!( out, "} // case-patck0" )
//
val () =
xemit01_txt00
(out, "switch\n(")
val () =
xemit01_l1tmp(out, tcas)
val () =
xemit01_txt00(out, ") {\n")
//
val () =
auxblklst(out, 1(*i*), tcas, blks)
//
val () =
fprint!
( out
, "default: XATS2JS_matcherr0();\n")
val () =
xemit01_txtln(out, "} // case-switch")
//
} where
{
//
val-
L1CMDcase
( knd0
, l1v1, tcas, pcks, blks) = lcmd.node()
//
} (* where *) // end of [aux_case]

(* ****** ****** *)

fun
aux_try0
( out
: FILEref
, lcmd
: l1cmd): void =
{
//
val () =
fprint!(out, "try\n{\n")
val () =
xemit01_l1blk(out, blk1)
val () =
fprint!(out, "}//try\n")
val () =
fprint!(out, "catch\n(")
val () =
xemit01_l1exn(out, texn)
val () =
xemit01_txt00(out, ") {\n")
//
val () =
xemit01_l1tmp(out, tcas)
val () =
xemit01_txtln(out, " = 0;")
val () =
xemit01_txt00(out, "do {\n")
val () =
auxpcklst(out, 1(*i*), tcas, pcks)
val () =
fprint!( out, "} while(false);\n" )
//
val () =
xemit01_txt00
(out, "switch\n(")
val () =
xemit01_l1tmp(out, tcas)
val () =
xemit01_txt00(out, ") {\n")
//
val () =
auxblklst(out, 1(*i*), tcas, blks)
//
val () =
fprint!
(out, "default: ")
val () =
fprint!
(out, "XATS2JS_reraise(")
val () =
xemit01_l1exn( out, texn )
val () = fprint!(out, ");\n")
//
val () =
xemit01_txtln(out, "} // with-switch")
val () =
xemit01_txtln(out, "} // try0-with-catch")
//
} where
{
//
val-
L1CMDtry0
( blk1
, texn, tcas, pcks, blks) = lcmd.node()
//
} (* where *) // end of [aux_try0]

(* ****** ****** *)

end (* end-of-local *) 

(* ****** ****** *)

fun
aux_patck
( out
: FILEref
, lcmd
: l1cmd): void =
(
  auxpck0(pck0)
) where
{
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDpatck
  (pck0) = lcmd.node()
} where
{
fun
auxpck0
(pck0: l1pck): void =
(
case+ pck0 of
|
L1PCKany() => ()
|
L1PCKcon(ldc, l1v) =>
{
val () =
xemit01_txt00(out, "if(")
val () =
xemit01_ldcon( out, ldc )
val () =
xemit01_txt00(out, "!==")
val () =
xemit01_l1val( out, l1v )
val () =
xemit01_txtln
(out, ") XATS2JS_patckerr0();")
}
|
L1PCKapp(pck1, pcks) =>
{
  val () = auxpck0(pck1)
  val () = auxpcks(pcks)
}
| _ (* else *) =>
{
  val () =
  fprint!(out, "//", pck0)
}
)
and
auxpcks
(pcks: l1pcklst): void =
(
case+ pcks of
|
list_nil() => ()
|
list_cons(pck1, pcks) =>
{
  val () = auxpck0( pck1 )
  val () = auxpcks( pcks )
}
) (* end of [auxpcks] *)
} (* where *) // end of [aux_patck]

(* ****** ****** *)

fun
aux_flat
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDflat
( tres
, l1v1) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_lval_get(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00( out, ")" )
//
}
end // end of [aux_flat]

(* ****** ****** *)

fun
aux_carg
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDcarg
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, "[", idx2+1, "]")
//
}
end // end of [aux_carg]

(* ****** ****** *)

fun
aux_cofs
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDcofs
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_new_cofs(")
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, ",", idx2+1, ")")
//
}
end // end of [aux_cofs]

(* ****** ****** *)

fun
aux_targ
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDtarg
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, "[", idx2+1, "]")
//
}
end // end of [aux_targ]

(* ****** ****** *)

fun
aux_tofs
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDtofs
( tres
, l1v1
, idx2) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_new_tofs(")
val () =
xemit01_l1val(out, l1v1)
val () =
fprint!(out, ",", idx2+1, ")")
//
}
end // end of [aux_tofs]

(* ****** ****** *)

fun
aux_lazy
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDlazy
( tres
, l1v1) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_new_lazy(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00( out, ")" )
//
}
end // end of [aux_lazy]

(* ****** ****** *)

fun
aux_llazy
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDllazy
( tres
, l1v1
, l1v2) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_new_llazy(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00( out, "," )
val () =
xemit01_l1val(out, l1v2)
val () =
xemit01_txt00( out, ")" )
//
}
end // end of [aux_llazy]

(* ****** ****** *)

fun
aux_excon
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDexcon
( tmp1 ) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tmp1)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_new_exctag()")
}
end // end of [aux_excon]

(* ****** ****** *)

fun
aux_raise
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDraise
( l1v1 ) = lcmd.node()
//
in
{
val () =
fprint
( out
, "XATS2JS_raise(")
val () =
xemit01_l1val(out, l1v1)
val () = fprint(out, ")")
}
end // end of [aux_raise]

(* ****** ****** *)

fun
aux_assgn
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDassgn
( l1v1
, l1v2 ) = lcmd.node()
//
in
{
val () =
fprint
( out
, "XATS2JS_lval_set(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00(out, ", ")  
val () =
xemit01_l1val(out, l1v2)
val () = fprint(out, ")")
}
end // end of [aux_assgn]

(* ****** ****** *)

fun
aux_eval1
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDeval1
( tres
, l1v1 ) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_lval_get(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00( out, ")" )
}
end // end of [aux_eval1]

(* ****** ****** *)

fun
aux_eval2
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDeval2
( tres
, l1v1 ) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_lazy_eval(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00( out, ")" )
}
end // end of [aux_eval2]

(* ****** ****** *)

fun
aux_eval3
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDeval3
( tres
, l1v1 ) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_llazy_eval(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00( out, ")" )
}
end // end of [aux_eval3]

(* ****** ****** *)

fun
aux_free3
( out
: FILEref
, lcmd
: l1cmd): void =
let
(*
val
loc0 = lcmd.loc()
*)
val-
L1CMDfree3
( tres
, l1v1 ) = lcmd.node()
//
val () =
xemit01_l1tmp(out, tres)
//
in
{
//
val () =
fprint( out, " = " )
//
val () =
fprint
( out
, "XATS2JS_llazy_free(")
val () =
xemit01_l1val(out, l1v1)
val () =
xemit01_txt00( out, ")" )
}
end // end of [aux_free3]

(* ****** ****** *)

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
L1CMDapp
(_, l1f0, _) =>
(
case+
l1f0.node() of
|
L1VALcon _ => aux_con(out, lcmd)
|
_ (*else*) => aux_app(out, lcmd)
)
//
|
L1CMDtup _ => aux_tup(out, lcmd)
//
|
L1CMDlam _ => aux_lam(out, lcmd)
|
L1CMDfix _ => aux_fix(out, lcmd)
//
|
L1CMDblk _ => aux_blk(out, lcmd)
|
L1CMDdcl _ => aux_dcl(out, lcmd)
|
L1CMDif0 _ => aux_if0(out, lcmd)
//
|
L1CMDcase _ => aux_case(out, lcmd)
|
L1CMDtry0 _ => aux_try0(out, lcmd)
//
|
L1CMDpatck _ => aux_patck(out, lcmd)
//
|
L1CMDflat _ => aux_flat(out, lcmd)
//
|
L1CMDcarg _ => aux_carg(out, lcmd)
|
L1CMDcofs _ => aux_cofs(out, lcmd)
//
|
L1CMDtarg _ => aux_targ(out, lcmd)
|
L1CMDtofs _ => aux_tofs(out, lcmd)
//
(*
|
L1CMDpofs _ => aux_pofs(out, lcmd)
*)
//
|
L1CMDlazy _ => aux_lazy(out, lcmd)
|
L1CMDllazy _ => aux_llazy(out, lcmd)
//
|
L1CMDexcon _ => aux_excon(out, lcmd)
|
L1CMDraise _ => aux_raise(out, lcmd)
//
|
L1CMDassgn _ => aux_assgn(out, lcmd)
//
|
L1CMDeval1 _ => aux_eval1(out, lcmd)
|
L1CMDeval2 _ => aux_eval2(out, lcmd)
|
L1CMDeval3 _ => aux_eval3(out, lcmd)
//
|
L1CMDfree3 _ => aux_free3(out, lcmd)
//
|
_ (* else *) => fprint!(out, "//", lcmd)
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

implement
xemit01_ftmpdecs
( out, tmps ) =
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
xemit01_ftmpdecs(out, ts)
)
else
(
xemit01_ftmpdecs(out, ts)
) where
{
//
val () =
xemit01_txt00(out, "let ")
//
val () = xemit01_l1tmp(out, t1)
val () = xemit01_txtln(out, ";")
//
} (* end of [else] *)
end // end of [let]
) (* end of [xemit01_ftmpdecs] *)

(* ****** ****** *)

local

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
in
//
case+
rcd.hag of
|
list_nil _ =>
aux_impdecl0(out, dcl0)
|
list_cons _ =>
aux_impdecl1(out, dcl0)
//
end // end of [aux_impdecl]
//
and
aux_impdecl0
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
( out
, "// { // val-binding" )
//
val () =
let
val
lts = rcd.lts
in
xemit01_ftmpdecs(out, lts)
end // end of [val]
//
val () =
let
val
blk =
rcd.def_blk
in
case+ blk of
|
L1BLKnone() => ()
|
L1BLKsome(cmds) =>
(
case+ cmds of
|
list_nil _ => ((*void*))
|
list_cons _ =>
{
//
val () =
xemit01_l1cmdlst(out, cmds)
//
} (* [list_cons] *)
) (* [L1BLKsome] *)
end // end of [val]
//
val () =
xemit01_txtln
( out
, "// } // val-binding" )
//
val () =
xemit01_txtln
(out, "const // implval/fun")
val () =
xemit01_hdcst(out, rcd.hdc)
//
in
//
case+
rcd.def of
|
None() => ()
|
Some(res) =>
{
//
val () =
xemit01_txt00(out, " = ")
val () =
xemit01_l1val( out, res )
val () =
xemit01_txt00( out, "\n" )
//
} (* end of [Some] *)
end // end of [aux_impdecl0]
//
and
aux_impdecl1
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
, rcd.lev
, rcd.hag, 0(*base*))
val () = xemit01_newln(out)
//
val () =
xemit01_txtln(out, "{")
//
val () =
xemit01_ftmpdecs(out, rcd.lts)
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
fprintln!
(out, "} // function // ", rcd.hdc)
end // end of [aux_impdecl1]

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
in
case+
rcd.def_blk of
|
L1BLKnone _ => ()
|
L1BLKsome _ => auxlfd0_some(lfd0)
end // end of [auxlfd0]

and
auxlfd0_some
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
, rcd.lev
, rcd_hag, 0(*base*) )
val () = xemit01_newln(out)
}
)
//
val () =
xemit01_txtln(out, "{")
//
val () =
xemit01_ftmpdecs(out, rcd.lts)
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
  fprintln!
  (out, "} // function // ", rcd.hdc)
end (* end of [auxlfd0_some] *)
//
(* ****** ****** *)
//
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
//
  let
  val-
  L1DCLfundecl
  (lfds) = dcl0.node() in auxlfds(lfds)
  end
//
end // end of [aux_fundecl]

(* ****** ****** *)

fun
aux_valdecl
( out
: FILEref
, dcl0: l1dcl): void =
let
//
fun
auxlvd0
( lvd0
: lvaldecl): void =
{
//
val+
LVALDECL(rcd) = lvd0
//
val () =
xemit01_txtln(out, "{")
val () =
xemit01_l1blk(out, rcd.def_blk)
val () =
fprintln!
( out, "} // val(", rcd.pat, ")" )
//
} (* end of [auxlvd0] *)

(* ****** ****** *)
//
and
auxlvds
( lvds
: lvaldeclist): void =
(
case lvds of
|
list_nil() => ()
|
list_cons
(lvd0, lvds) =>
{
  val () = auxlvd0(lvd0)
  val () = auxlvds(lvds)
}
) (* end of [auxlvds] *)
//
in
let
val-
L1DCLvaldecl
(lvds) = dcl0.node() in auxlvds(lvds)
end
end // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( out
: FILEref
, dcl0: l1dcl): void =
let
//
fun
auxlvd0
( lvd0
: lvardecl): void =
{
//
val+
LVARDECL(rcd) = lvd0
//
val () =
xemit01_txtln(out, "{")
//
val () =
xemit01_l1blk(out, rcd.ini_blk)
//
val () =
let
val () =
xemit01_l1tmp(out, rcd.hdv_tmp)
in(*in-of-let*)
//
case+
rcd.ini of
|
None() =>
{
  val () =
  fprint!
  ( out
  , " = XATS2JS_new_var0(")
  val () = fprint!(out, ");\n")
}
|
Some(ini) =>
{
  val () =
  fprint!
  ( out
  , " = XATS2JS_new_var1(")
  val () =
  xemit01_l1val( out, ini )
  val () = fprint!(out, ");\n")
}
//
end // end of [val]
//
val () =
fprintln!
( out, "} // val(", rcd.hdv, ")" )
//
} (* end of [auxlvd0] *)

(* ****** ****** *)
//
and
auxlvds
( lvds
: lvardeclist): void =
(
case lvds of
|
list_nil() => ()
|
list_cons
(lvd0, lvds) =>
{
  val () = auxlvd0(lvd0)
  val () = auxlvds(lvds)
}
) (* end of [auxlvds] *)
//
in
let
val-
L1DCLvardecl
(lvds) = dcl0.node() in auxlvds(lvds)
end
end // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_excptcon
( out
: FILEref
, dcl0: l1dcl): void =
let
//
val-
L1DCLexcptcon
(hdcs, blk0) = dcl0.node()
//
in
  xemit01_l1blk(out, blk0(*init*))
end // end of [aux_excptcon]

(* ****** ****** *)

in(*in-of-local*)
//
implement
xemit01_l1dcl
(out, dcl0) =
let
//
val
loc0 = dcl0.loc()
//
val () =
fprint!(out, "// ")
val () =
fprintln!(out, loc0)
//
(*
val () = fprint!(out, "// ")
val () = fprintln!(out, dcl0)
*)
in(*in-of-let*)
//
case+
dcl0.node() of
//
|
L1DCLlocal
(head, body) =>
{
val () =
fprint
(out, "// { // local\n")
val () =
xemit01_l1dclist(out, head)
val () =
fprint
(out, "// in-of-local\n")
val () =
xemit01_l1dclist(out, body)
val () =
fprint
(out, "// } // end-of-local\n")
}
//
|
L1DCLinclude
( tok0
, src1, knd2
, opt1, opt2) =>
{
val () =
fprint
(out, "// { // include\n")
val () =
(
case+ opt1 of
|
None() => ((*void*))
|
Some(path) =>
fprint!(out, "// ", path, "\n")
)
val () =
(
case+ opt2 of
|
None() => ((*void*))
|
Some(body) =>
xemit01_l1dclist(out, body)
)
val () =
fprint!
(out, "// } // end-of-include\n")
}
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
|
L1DCLvaldecl _ =>
{
val()=aux_valdecl(out, dcl0)
}
//
|
L1DCLvardecl _ =>
{
val()=aux_vardecl(out, dcl0)
}
//
|
L1DCLexcptcon _ =>
{
val()=aux_excptcon(out, dcl0)
}
//
| _ (* else *) =>
{
val () = fprint!(out, "// ", dcl0)
}
//
end // end of [xemit01_l1dcl]
//
end // end of [local]

(* ****** ****** *)

implement
xemit01_l1dclist
  (out, dcls) =
(
  auxlst(dcls)
) where
{
fun
auxlst
( dcls
: l1dclist): void =
(
case+ dcls of
|
list_nil
((*void*)) => ()
|
list_cons
(dcl1, dcls) =>
let
val () =
xemit01_l1dcl
( out, dcl1 )
val () =
xemit01_newln(out) in auxlst(dcls)
end // list_cons]
) (* end of [auxlst] *)
} (*where*) // end of [xemit01_l1dclist]

(* ****** ****** *)

implement
xemit01_package
  (out, lpkg) =
{
val () = auxtmps(tmps)
val () = auxdcls(dcls) 
} where
{
//
val+
L1PKG
(tmps, dcls) = lpkg
//
fun
auxtmps
( xs
: l1tmplst): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  auxtmps(xs)) where
{
  val () =
  xemit01_txt00(out, "var ")
  val () = xemit01_l1tmp(out, x0)
  val () = xemit01_txtln(out, ";")
} (* list_cons *)
) (* end of [auxtmps] *)
//
fun
auxdcls
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
val () = xemit01_newln(out) in auxdcls(xs)
end // list_cons
) (* end of [auxdcls] *)
} (* end of [xemit01_program] *)

(* ****** ****** *)
//
// HX-2020-11-16:
// For handling tail-recursion
//
(* ****** ****** *)
//
extern
fun
funbody_get_tmprets
( tres: l1tmp
, body: l1blk): l1tmplst
extern
fun
fundecl_get_tmprets
( lfd0: lfundecl): l1tmplst
//
(* ****** ****** *)

implement
funbody_get_tmprets
(tres, body) = let
//
vtypedef
l1cmdlst_vt = List0_vt(l1cmd)
//
val () =
println!
("funbody_get_tmprets: tres = ", tres)
val () =
println!
("funbody_get_tmprets: body = ", body)
//
fun
ismem
( xs
: l1tmplst
, x0: l1tmp): bool =
(
case+ xs of
|
list_nil() => false
|
list_cons(x1, xs) =>
if (x0 = x1)
then true else ismem(xs, x0)
)
//
fun
auxlval
( l1v0: l1val
, tmps: l1tmplst): l1tmplst =
(
case+
l1v0.node() of
|
L1VALtmp(tmp1) =>
list_cons(tmp1, tmps)
|
_(*non-of-L1VALtmp*) => tmps
) (* end of [auxlval] *)
//
and
auxlblk
( blk0: l1blk
, tmps: l1tmplst): l1tmplst =
(
case+ blk0 of
|
L1BLKnone() => tmps
|
L1BLKsome(cmds) =>
(
  auxcmds
  (list_reverse(cmds), tmps)
)
) (* end of [auxlblk] *)
//
and
auxcmd0
( cmd0: l1cmd
, tmps: l1tmplst): l1tmplst =
(
case+
cmd0.node() of
|
L1CMDmov
(tmp1, l1v2) =>
(
if
ismem
(tmps, tmp1)
then
auxlval(l1v2, tmps) else tmps
)  
|
L1CMDif0
(l1v1, blk1, blk2) =>
let
  val
  tmps =
  auxlblk(blk1, tmps)
  val
  tmps =
  auxlblk(blk2, tmps) in tmps
end
|
_ (* rest-of-l1cmd *) => tmps
)
//
and
auxcmds
( cmds
: l1cmdlst_vt
, tmps: l1tmplst): l1tmplst =
(
case+ cmds of
| ~
list_vt_nil
((*void*)) => tmps
| ~
list_vt_cons
(cmd0, cmds) =>
let
val
tmps =
auxcmd0(cmd0, tmps) in auxcmds(cmds, tmps)
end // end of [list_cons]
)
//
in
auxcmds
( cmds
, list_sing(tres)) where
{
  val cmds =
  (
    case+ body of
    | L1BLKnone() => list_vt_nil()
    | L1BLKsome(cmds) => list_reverse(cmds)
  ) : l1cmdlst_vt // end-of-val
}
end // end of [funbody_get_tmprets]

(* ****** ****** *)

implement
fundecl_get_tmprets
  (lfd0) =
let
val+
LFUNDECL(rcd) = lfd0
in
//
case+ rcd.def of
|
None() => list_nil()
|
Some(l1v1) =>
(
case+ l1v1.node() of
| L1VALtmp(tmp1) =>
  funbody_get_tmprets
  (tmp1, rcd.def_blk)
| _(* non-L1VALtmp *) => list_nil()
)
//
end // end of [fundecl_get_tmprets]


(* ****** ****** *)

(* end of [xats_intrep1_xemit.dats] *)
