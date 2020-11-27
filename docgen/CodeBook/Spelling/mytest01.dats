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
val
theWords =
$SP.spelling<>()
in
val () =
( print("theWords = ")
; stream_vt_print0(theWords); println())
end // end of [local]

(* ****** ****** *)

(* end of [mytest01.dats] *)