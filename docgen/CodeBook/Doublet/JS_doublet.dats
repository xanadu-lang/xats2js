(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload DB = "./doublet.dats"
(* ****** ****** *)
#staload MY =
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)
#staload
"prelude/DATS/CATS/JS/jsbasics.dats"
(* ****** ****** *)
#extern
fun
JS_doublet_dict
((*void*))
: string = $exname()
(* ****** ****** *)
implfun
$DB.theDict_make
((*void*)) =
(
  theDict) where {
//
(*
val () =
println
("theDict_make: called")
*)
//
val ws =
$MY.string_split_lines
(  JS_doublet_dict()  )
//
val
theDict =
XATS2JS_jsobjmap_make_nil()
val
((*void*)) =
stream_vt_foreach0(ws) where
{
typedef wx = string
impltmp
foreach0$work<wx>(wx) =
XATS2JS_jsobjmap_insert_any(theDict, wx, 0)
}
} (* end of [theDict_make] *)
(* ****** ****** *)

(*
val
water_blood =
$DB.doublet_play("water", "blood")
val ((*void*)) =
println("water_blood = ", water_blood)
val
wheat_bread =
$DB.doublet_play("wheat", "bread")
val ((*void*)) =
println("wheat_bread = ", wheat_bread)
*)

(* ****** ****** *)
//
#extern
fun
ATS_doublet_call
((*void*)): void = $exname()
//
implfun
ATS_doublet_call() =
let
val w1 =
JS_doublet_word1() where
{
#extern
fun
JS_doublet_word1
((*void*)): string = $exname()
}
val w2 =
JS_doublet_word2() where
{
#extern
fun
JS_doublet_word2
((*void*)): string = $exname()
}
val opt = $DB.doublet_play(w1, w2)
in
case+ opt of
|
optn_nil() =>
println("[", w1, "] and [", w2, "] are not a doublet!")
|
optn_cons(ws) =>
let
val ws = reverse(ws)
in
println("[", w1, "] and [", w2, "] are a doublet:", ws)
end
end // end of [ATS_doublet_call)
//
(* ****** ****** *)

(* end of [JS_doublet.dats] *)
