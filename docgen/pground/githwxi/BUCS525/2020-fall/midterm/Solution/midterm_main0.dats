(* ****** ****** *)
#staload
"./../..\
/mylib/mylib.dats"
(* ****** ****** *)
#staload "./midterm.dats"
(* ****** ****** *)
#include
"./../../../../../../..\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

val
fact =
let
val f = T0Mvar("f")
val x = T0Mvar("x")
in
T0Mfix
(
"f"
,
myoptn_nil()
,
T0Mlam
(
"x"
,
myoptn_nil()
,
T0Mcond(
  T0Mopr2
  (">", x, T0Mint(0))
  ,
  T0Mopr2
  ( "*"
  , x
  , T0Mapp
    ( f
    , T0Mopr2
      ("-", x, T0Mint(1))
    )
  )
  ,
  myoptn_cons( T0Mint(1) )(*else*)
)
)
)
end // end of [let] // end of [val]

(* ****** ****** *)
//
val
i10_tm =
T0Mint(10)
val
i10_tp =
t0erm_tpinf0(i10_tm)
//
val () =
println("i10_tm = ", i10_tm)
val () =
println("i10_tp = ", i10_tp)
//
(* ****** ****** *)

val
fact10_tm =
T0Mapp(fact, i10_tm)
val
fact10_tp =
t0erm_tpinf0(fact10_tm)
val () =
println("fact10_tp = ", fact10_tp)
(* ****** ****** *)
val () =
println("fact(10) = ", t0erm_intrp0(fact10_tm))
(* ****** ****** *)

(* end of [midterm_main0.dats] *)
