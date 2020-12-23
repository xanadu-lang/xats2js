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
JS_spelling_arg0() in
char_lower(string_head_raw(cs))
end
impltmp
$SP.spelling$chars<>() =
string_lower(JS_spelling_arg1())
(* ****** ****** *)
impltmp
$SP.spelling$words<>() =
string_split_lines(JS_spelling_dict())
(* ****** ****** *)
val
theWords_r =
a0ref_make
<list(string)>(list_nil())
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
in
  theWords_r[] := list_vt2t(reverse(theWords))
end // end of [ATS_spelling_call]

(* ****** ****** *)
#extern
fun
ATS_theWords_print1(): void = $exname()
#extern
fun
ATS_theWords_print2(): void = $exname()
(* ****** ****** *)

implfun
ATS_theWords_print1() =
let
val () = println("theWords = ", theWords_r[])
end // end of [ATS_theWords_print1]
implfun
ATS_theWords_print2() =
let
//
val ln =
length(theWords_r[])
//
val () =
if
(ln=1)
then
println
("Found 1 word:")
else
println
("Found ", ln, " words:")
//
val () =
iforeach(theWords_r[]) where
{
  impltmp
  iforeach$work<string>(i, word) = println(i+1, ":", word)
}
end // end of [ATS_theWords_print2]

(* ****** ****** *)

(* end of [JS_spelling.dats] *)
