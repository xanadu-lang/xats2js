(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload SP = "./spelling.dats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)
#extern
fun
JS_spelling_arg0(): string = $exname()
#extern
fun
JS_spelling_arg1(): string = $exname()
#extern
fun
JS_spelling_dict(): string = $exname()
(* ****** ****** *)
impltmp
$SP.spelling$char<>() =
let
val cs =
JS_spelling_arg0() in string_head_raw(cs)
end
impltmp
$SP.spelling$chars<>() = JS_spelling_arg1()
(* ****** ****** *)
impltmp
$SP.spelling$words<>() =
let
val
dict =
JS_spelling_dict()
val
words =
string_split_lines(dict)
in
stream_vt_map0(words) where
{
typedef y0 = string
vwtpdef x0 = string_vt
impltmp map0$fopr<x0><y0> = string_vt2t
}
end
(* ****** ****** *)
#extern
fun
ATS_spelling_call(): void = $exname()
(* ****** ****** *)
implfun
ATS_spelling_call() =
let
//
val
theChar =
$SP.spelling$char<>()
val
theChars =
$SP.spelling$chars<>()
//
val
theWords =
stream_vt_filter0
($SP.spelling<>()) where
{
impltmp
filter0$test<string>(xs) = length(xs) >= 6
}
val
theWords =
listize(theWords)
val
theWords =
mergesort(theWords) where
{
impltmp
g_cmp<string>(x1, x2) =
let
val
sgn =
g_cmp(length(x1), length(x2))
in
if sgn != 0 then -sgn else string_cmp(x1, x2)
end (*let*) // end of [impltmp g_cmp]
}
//
val
theWords = list_vt2t(theWords)
//
in
  println("theWords = ", theWords)
end // end of [ATS_spelling_call]

(* ****** ****** *)

(* end of [JS_spelling.dats] *)
