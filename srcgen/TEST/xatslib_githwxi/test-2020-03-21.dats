(* ****** ****** *)
#include
"./../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)
val bs =
digitize(16)
where
impltmp digitize$base<>() = 2
endwhr // end of [val]
(* ****** ****** *)
//
val
ds1 = digitize(31415926)
val
ds2 =
stream_vt_listize(rdigitize(31415926))
//
(* ****** ****** *)
//
val ds1 = list_vt2t(ds1)
val ds2 = list_vt2t(ds2)
//
val ( ) =
( g_print("ds1 = ")
; g_print( ds1 ); g_print("\n"))
val ( ) =
( g_print("ds2 = ")
; g_print( ds2 ); g_print("\n"))
//
(* ****** ****** *)

fun
digitrev
(
n0: sint
) : list_vt(int) =
let
//
fun
auxloop
( ds
: stream_vt(int)
) : list_vt(int) =
(
case+ !ds of
|
~ strmcon_vt_nil() => list_vt_nil()
|
~ strmcon_vt_cons(d0, ds) =>
  if
  (d0 > 0)
  then list_vt_cons(d0, auxloop(ds)) else auxloop(ds)
)
//
in
  auxloop(rdigitize(n0))
end

(* ****** ****** *)
//
val
ans = digitrev(54321000)
//
val ans = list_vt2t(ans)
val ( ) =
( g_print("ans = ")
; g_print( ans ); g_print("\n"))
//
(* ****** ****** *)

(* end of [test-2020-03-21.dats] *)
