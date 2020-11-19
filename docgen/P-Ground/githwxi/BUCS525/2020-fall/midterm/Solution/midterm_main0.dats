(* ****** ****** *)
#staload
"./../..\
/mylib/mylib.dats"
(* ****** ****** *)
#staload
"./midterm_head0.dats"
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
//
val () =
println
("fact_tp = ", t0erm_tpinf0(fact))
//
(* ****** ****** *)
val () =
println
( "fact(10) = "
, t0erm_intrp0(T0Mapp(fact, i10_tm)))
(* ****** ****** *)

val
T0Mtrue = T0Mbtf(true)
val
T0Mfalse = T0Mbtf(false)

(* ****** ****** *)

val
isPrime =
T0Mlam
( "n"
, myoptn_cons(T0Pint)
, T0Mcond
  ( T0Mopr2("<=", T0Mvar("n"), T0Mint(1))
  , T0Mfalse
  , myoptn_cons
    (
    T0Mapp
    ( T0Mfix
      ( "loop"
      , myoptn_nil()
      , T0Mlam
        ( "i"
        , myoptn_cons(T0Pint)
        , T0Mcond
          ( T0Mopr2(">", T0Mopr2("*", T0Mvar("i"), T0Mvar("i")), T0Mvar("n"))
          , T0Mtrue,
            myoptn_cons
            ( T0Mcond
              ( T0Mopr2("==", T0Mopr2("%", T0Mvar("n"), T0Mvar("i")), T0Mint(0)),
                T0Mfalse,
                myoptn_cons(T0Mapp(T0Mvar("loop"), T0Mopr2("+", T0Mvar("i"), T0Mint(1))))
              )
            )
          )
        )
      )
    , T0Mint(2)
    )
    )
  )
) (* end of [val isPrime] *)

(* ****** ****** *)

val () =
println
("isPrime_tp = ", t0erm_tpinf0(isPrime))
val () =
println
( "isPrime(101) = "
, t0erm_intrp0(T0Mapp(isPrime, T0Mint(101))))
val () =
println
( "isPrime(1001) = "
, t0erm_intrp0(T0Mapp(isPrime, T0Mint(1001))))

(* ****** ****** *)

(* end of [midterm_main0.dats] *)
