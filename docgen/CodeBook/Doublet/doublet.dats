(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
#staload
"xatslib/githwxi/DATS/gtree1.dats"
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
val i0 = N
and r0 =
list_vt_nil()
in loop(i0, r0) end where
{
//
typedef i0 = nintlte(26)
vwtpdef r0 = list_vt(string(n))
//
fun
loop
(i0: i0, r0: r0): r0 =
if
(i0 = 0)
then r0 else
let
  val i1 = pred(i0)
  val c1 =
  string_get_at(alpha, i1)
in
  if
  (c0 = c1)
  then loop(i1, r0) else let
    val cs =
    string_fset_at(cs, i0, c1)
  in
    loop(i1, list_vt_cons(cs, r0))
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
theDict =
dictionary_make()
fun
word_legalq
(wx: word): bool =
jsobjmap_mapped(theDict, wx)
//
(* ****** ****** *)

implfun
doublet_play
(w1, w2) = let
//
val
theMarks =
jsobjmap_make_nil()
//
fun
word_markedq
(wx: word): bool =
jsobjmap_mapped(theMarks, wx)
//
impltmp
gtree_node_childlst
<node>(nx) =
let
//
val-
list_cons
(w1, _nx_) = nx
//
typedef w1 = word
//
val ws = helper_1(w1)
//
val ws =
stream_vt_filter0(ws) where
{
impltmp
filter0$test<word>(w1) =
if
word_markedq(w1)
then false else word_legalq(w1)
//
}
//
impltmp
map0$fopr
<word><node>(w1) = list_cons(w1, nx)
//
in
  listize(stream_vt_map0(ws))
end // end of [gtree_node_childlst]

(* ****** ****** *)
in
(* ****** ****** *)


(* ****** ****** *)

end // end of [doublet_play]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [doublet.dats] *)