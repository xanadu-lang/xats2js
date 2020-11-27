(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#extern
fun<>
spelling
((*void*)): stream_vt(string)
(* ****** ****** *)
//
#extern
fun<>
spelling$char
((*void*)): char
#extern
fun<>
spelling$chars
((*void*)): string
#extern
fun<>
spelling$words
((*void*)): stream_vt(string)
//
(* ****** ****** *)

fun
wtest1
( xs
: string
, c0: char): bool =
gseq_exists(xs) where
{
impltmp
exists$test<char>(x0) = (c0 = x0)
}

(* ****** ****** *)

fun
wtest2
( xs: string
, cs: string): bool =
gseq_forall(xs) where
{
impltmp
forall$test<char>(x0) = wtest1(cs, x0)
}

(* ****** ****** *)

impltmp
spelling<>() =
(
stream_vt_filter0(spelling$words<>())
) where
{
val c0 = spelling$char<>()
val cs = spelling$chars<>()
impltmp
filter0$test<string>(w0) =
if wtest1(w0, c0) then wtest2(w0, cs) else false
}

(* ****** ****** *)

(* end of [spelling.dats] *)
