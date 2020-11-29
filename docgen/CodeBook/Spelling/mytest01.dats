(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload SP = "./spelling.dats"
(* ****** ****** *)
#staload
"xatslib/libc/DATS/fpath.dats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/libc/DATS/CATS/JS/Node/basics.dats"
(* ****** ****** *)

impltmp
$SP.spelling$char<>() = 'a'
impltmp
$SP.spelling$chars<>() = "acfilnu"

(* ****** ****** *)

impltmp
$SP.spelling$words<>
((*void*)) =
fpath_streamize_line
("/usr/share/dict/words")

(* ****** ****** *)

local
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
$SP.spelling<>()
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
val () = println("theChar = ", theChar)
val () = println("theChars = ", theChars)
val () = println("theWords = ", theWords)
end // end of [local]

(* ****** ****** *)

(* end of [mytest01.dats] *)
