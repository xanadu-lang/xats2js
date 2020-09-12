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
static
fun
the_dvarmap_search_ref
(hdv: hdvar): P2tr0(l1val)
and
the_dvarmap_search_opt
(hdv: hdvar): Option_vt(l1val)
//
static
fun
the_dvarmap_insert_any
(hdv: hdvar, l1v1: l1val): void
and
the_dvarmap_insert_exn
(hdv: hdvar, l1v1: l1val): void
//
static
fun
the_dvarmap_remove_exn(hdvar): void
//
(* ****** ****** *)
//
datavtype
hdvarstk =
|
hdvarstk_nil of
  ((*void*))
//
|
hdvarstk_fun0 of
  (hdvarstk(*rest*))
//
|
hdvarstk_cons of
  (hdvar, hdvarstk(*rest*))
//
(* ****** ****** *)
//
fun
hdvarstk_pop_top
( xs:
& hdvarstk >> _): void =
(
  xs := auxstk(xs)
) where
{
fun
auxstk
( xs
: hdvarstk): hdvarstk =
(
case+ xs of
//
| ~
hdvarstk_cons
  (x0, xs) =>
  auxstk(xs) where
{
  val () = 
  the_dvarmap_remove_exn(x0)
}
//
| _ (* non-hdvarstk *) => (xs)
)
} (* end of [hdvarstk_pop_top] *)
//
(* ****** ****** *)
//
datavtype
l1tmpstk =
|
l1tmpstk_nil of
  ((*void*))
|
l1tmpstk_fun0 of
  (l1tmpstk(*rest*))
//
|
l1tmpstk_cons of
  (l1tmp, l1tmpstk(*rest*))
//
(* ****** ****** *)
//
fun
l1tmpstk_pop_top
( xs:
& l1tmpstk >> _): l1tmplst =
let
val
( xs1
, ts1
) = auxstk
(xs, list_nil()) in xs := xs1; ts1
end where
{
fun
auxstk
( xs
: l1tmpstk
, ts
: l1tmplst)
: (l1tmpstk, l1tmplst) =
(
case+ xs of
//
| ~
l1tmpstk_cons
  (t0, xs) =>
  auxstk(xs, ts) where
{
  val ts = list_cons(t0, ts)
}
//
| _ (*non-l1tmpstk*) => (xs, ts)
)
} (* end of [l1tmpstk_pop_top] *)
//
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
  list_cons
  ( x1, ys ) in auxlst(tl, ys)
end
)
in
let
val
( xs1
, xs2
) = auxlst
( xs
, list_nil()) in (xs := xs1; xs2)
end
end // end of [l1cmdstk_pop0_lst]
//
(* ****** ****** *)

local

datavtype
compenv =
COMPENV of @{
  flevel= int
,
  hdvarstk= hdvarstk
,
  l1tmpstk= l1tmpstk
,
  l1cmdstk= l1cmdstk
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
  flevel= 0
,
  hdvarstk = hdvarstk_nil()
,
  l1tmpstk = l1tmpstk_nil()
,
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
val () =
hdvarstk_pop_top(rcd.hdvarstk)
val ts =
l1tmpstk_pop_top(rcd.l1tmpstk)
//
val-( 0 ) = rcd.flevel
//
val-~hdvarstk_nil() = rcd.hdvarstk
val-~l1tmpstk_nil() = rcd.l1tmpstk
val-~l1cmdstk_nil() = rcd.l1cmdstk
//
} (* end of [compenv_free_nil] *)
  
(* ****** ****** *)
implement
xcomp01_dvarfind
  (env0, x0) =
(
  the_dvarmap_search_opt(x0)
) (* end of [xcomp01_dvarfind] *)
(* ****** ****** *)
//
implement
xcomp01_dvaradd_fun0
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.hdvarstk
val xs = hdvarstk_fun0(xs)
val () = rcd.hdvarstk := xs
//
} (* end of [xcomp01_dvaradd_fun0] *)
//
implement
xcomp01_dvarpop_fun0
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val () =
hdvarstk_pop_top(rcd.hdvarstk)
//
val () =
(
  rcd.hdvarstk := xs
) where
{
val-
~hdvarstk_fun0(xs) = rcd.hdvarstk
}
} (* end of [xcomp01_dvarpop_fun0] *)
//
(* ****** ****** *)
//
implement
xcomp01_dvaradd_bind
  (env0, x0, v0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.hdvarstk
//
val () =
the_dvarmap_insert_exn(x0, v0)
//
val () =
rcd.hdvarstk := hdvarstk_cons(x0, xs)
//
} (* end of [xcomp01_dvaradd_bind] *)
//
(* ****** ****** *)
//
implement
xcomp01_ltmpnew_tmp0
( env0, loc0 ) =
let
prval () =
fold@(env0) in x0
end where {
//
val x0 =
l1tmp_new_tmp(loc0)
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1tmpstk
//
val () =
rcd.l1tmpstk := l1tmpstk_cons(x0, xs)
//
} (* end of [xcomp01_ltmpnew_tmp0] *)
//
implement
xcomp01_ltmpnew_arg1
( env0
, loc0, idx1) =
let
prval () =
fold@(env0) in x0
end where {
//
val x0 =
l1tmp_new_arg
  (loc0, idx1)
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1tmpstk
//
val () =
rcd.l1tmpstk := l1tmpstk_cons(x0, xs)
//
} (* end of [xcomp01_ltmpnew_arg1] *)
//
(* ****** ****** *)
//
implement
xcomp01_ltmpadd_fun0
  (env0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1tmpstk
val xs = l1tmpstk_fun0(xs)
val () = rcd.l1tmpstk := xs
//
} (* end of [xcomp01_ltmpadd_fun0] *)
//
implement
xcomp01_ltmppop_fun0
  (env0) =
(
  fold@(env0); ts
) where
{
//
val+
@COMPENV(rcd) = env0
//
val ts =
l1tmpstk_pop_top(rcd.l1tmpstk)
//
val () =
(
  rcd.l1tmpstk := xs
) where
{
val-
~l1tmpstk_fun0(xs) = rcd.l1tmpstk
}
} (* end of [xcomp01_ltmppop_fun0] *)
//
(* ****** ****** *)

implement
xcomp01_lcmdadd_lcmd
  (env0, x0) =
  fold@(env0) where
{
//
val+
@COMPENV(rcd) = env0
//
val xs = rcd.l1cmdstk
//
val () =
rcd.l1cmdstk := l1cmdstk_cons(x0, xs)
//
} (* end of [xcomp01_lcmdadd_lcmd] *)

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

local

(* ****** ****** *)

#staload
"libats/SATS\
/linmap_avltree.sats"
#staload _ =
"libats/DATS\
/linmap_avltree.dats"

(* ****** ****** *)

extern
prfun
lemma_p2tr_param
{a:vt0p}
{l:addr}(cp: p2tr(a, l)): [l >= null] void

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

local

typedef
key = hdvar
and
itm = l1val
vtypedef
dvarmap = map(key, itm)

var
the_dvarmap =
linmap_make_nil<>{key,itm}()
val
the_dvarmap = addr@the_dvarmap

implement
compare_key_key<key>
  (k1, k2) = let
//
val x1 =
$effmask_all(k1.stamp())
and x2 =
$effmask_all(k2.stamp())
//
in $STM.compare_stamp_stamp(x1, x2) end

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
the_dvarmap_search_ref
  (hdv0) = let
//
val
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
val ref =
linmap_search_ref<key,itm>(map,hdv0)
//
in
let
prval () = $UN.cast2void(map)
prval () = lemma_p2tr_param(ref) in ref
end
end // end of [the_dvarmap_search_ref]

implement
the_dvarmap_search_opt
  (hdv0) = let
//
val
ref = the_dvarmap_search_ref(hdv0)
//
in
//
if
iseqz(ref)
then None_vt()
else Some_vt($UN.p2tr_get<itm>(ref))
//
end // end of [the_dvarmap_search_opt]

(* ****** ****** *)

implement
the_dvarmap_insert_any
  (hdv0, l1v1) = let
//
var
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
//
in
(
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
) where
{
val () =
linmap_insert_any<key,itm>(map, hdv0, l1v1)
}
end // end of [the_dvarmap_insert_any]

implement
the_dvarmap_insert_exn
  (hdv0, l1v1) = let
//
var
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
//
in
(
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
) where
{
val-
~None_vt() =
linmap_insert_opt<key,itm>(map, hdv0, l1v1)
}
end // end of [the_dvarmap_insert_exn]

(* ****** ****** *)

implement
the_dvarmap_remove_exn
  (hdv0) = let
//
var
map =
$UN.ptr0_get<dvarmap>(the_dvarmap)
//
in
(
$UN.ptr0_set<dvarmap>(the_dvarmap, map)
) where
{
val-true = linmap_remove<key,itm>(map, hdv0)
}
end // end of [the_dvarmap_remove_exn]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_xcomp01_envmap.dats] *)
