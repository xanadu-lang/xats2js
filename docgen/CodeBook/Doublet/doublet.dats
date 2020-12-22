(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/gtree1.dats"
(* ****** ****** *)
#staload
"prelude/DATS/CATS/JS/jsbasics.dats"
(* ****** ****** *)
//
typedef word = string
//
#extern
fun
doublet_play
( w1: word
, w2: word): optn(list(word))
(* ****** ****** *)
#extern
fun
theDict_make():
jsobjmap(string, int) = $exname()
(* ****** ****** *)
//
#extern
fun
string_fset_at
{n:nat}
( cs
: string(n)
, i0
: nintlt(n)
, c0: cgtz): string(n)
implfun
string_fset_at
  (cs, i0, c0) =
(
string_tabulate(length(cs))
) where
{
impltmp
tabulate$fopr<cgtz>(i1) =
if
(i0 = i1)
then c0 else string_get_at(cs, i1)
} (* end of [string_fset_at] *)
//
(* ****** ****** *)

local

(* ****** ****** *)
#extern
fun
helper_1
{n:nat}
( cs
: string(n)
)
: stream_vt(string(n))
(* ****** ****** *)
fun
helper_2
{n:nat}
( cs
: string(n)
, i0
: nintlt(n)
)
: list_vt(string(n)) =
let
val N = 26
val c0 =
string_get_at(cs, i0)
val alpha =
"abcdefghijklmnopqrstuvwxyz"
in
let
val j0 = N
and r0 =
list_vt_nil()
in loop(j0, r0) end where
{
//
typedef
  j0 = nintlte( 26 )
vwtpdef
  r0 = list_vt( string(n) )
//
fnx
loop
(j0: j0, r0: r0): r0 =
if
(j0 = 0)
then r0 else
let
  val j1 = pred(j0)
  val c1 =
  string_get_at(alpha, j1)
in
  if
  (c0 = c1)
  then loop(j1, r0) else let
    val cs =
    string_fset_at(cs, i0, c1)
  in
    loop(j1, list_vt_cons(cs, r0))
  end
end (*end-of-else*)
//
}
end // end of [helper_2]
(* ****** ****** *)
implfun
helper_1
{n}(cs) =
stream_vt_maplist0
(
gint_streamize_nint(length(cs))
) where
{
typedef
x0 = nintlt(n)
typedef
y0 = string(n)
impltmp
maplist0$fopr<x0><y0>(i0) = helper_2(cs, i0)
} (* end of [helper_1] *)
(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)
typedef
node = list(word)
(* ****** ****** *)
//
val
theDict = theDict_make()
//
(* ****** ****** *)
//
fun
word_legalq
(wx: word): bool =
let
(*
val () =
println
("word_legalq: wx = ", wx)
*)
in
XATS2JS_jsobjmap_keyq(theDict, wx)
end
//
(* ****** ****** *)

implfun
doublet_play
(w1, w2) = let
//
val
theMarks =
XATS2JS_jsobjmap_make_nil()
//
fun
word_markedq
(wx: word): bool =
let
(*
val () =
println
("word_markedq: wx = ", wx)
*)
in
XATS2JS_jsobjmap_keyq(theMarks, wx)
end
//
impltmp
gtree_node_childlst
<node>(nx) =
let
//
val-
list_cons
(wx, _nx_) = nx
//
in
//
if
word_markedq(wx)
then
(
list_vt_nil((*void*))
) (* end of [then] *)
else let
//
val ws = helper_1(wx)
//
val ws =
stream_vt_filter0(ws) where
{
impltmp
filter0$test<word> = word_legalq
}
//
impltmp
map0$fopr
<word><node>(wy) = list_cons(wy, nx)
//
in
  listize(stream_vt_map0(ws))
end // end of [else]
//
end // end of [gtree_node_childlst]

(* ****** ****** *)

in(* in-of-let *)

(* ****** ****** *)

let
fnx
auxsrch
(nxs: stream_vt(node)) =
(
case+ !nxs of
| ~
strmcon_vt_nil
( (*void*) ) =>
optn_nil(*void*)
| ~
strmcon_vt_cons
( nx1, nxs ) =>
let
val-
list_cons(wx, _) = nx1
val () =
XATS2JS_jsobjmap_insert_any
  (theMarks, wx, 0)
in
if
(wx = w2)
then optn_cons(nx1) else auxsrch(nxs)
end // end of [strmcon_vt_cons]
)
in
auxsrch
(gtree_bfs_streamize<node>(list_sing(w1)))
end // end of [let]

(* ****** ****** *)

end // end of [doublet_play]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [doublet.dats] *)
