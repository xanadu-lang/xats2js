(* ****** ****** *)
//
// Declarations
//
(* ****** ****** *)
(*
#extern
fun<>
print0
((*void*)) : void
*)
#extern
fun
<a1:vt>
print1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
print2
( x1: !a1
, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
print3
( x1: !a1
, x2: !a2
, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print4
( x1: !a1
, x2: !a2
, x3: !a3
, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print5
( x1: !a1
, x2: !a2
, x3: !a3
, x4: !a4
, x5: !a5 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
print6
( x1: !a1
, x2: !a2
, x3: !a3
, x4: !a4
, x5: !a5
, x6: !a6 ) : void
(* ****** ****** *)
//
#symload print with print1
#symload print with print2
#symload print with print3
#symload print with print4
#symload print with print5
#symload print with print6
//
(* ****** ****** *)
#extern
fun<>
println0
((*void*)) : void
#extern
fun
<a1:vt>
println1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
println2
( x1: !a1
, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
println3
( x1: !a1
, x2: !a2
, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println4
( x1: !a1
, x2: !a2
, x3: !a3
, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println5
( x1: !a1
, x2: !a2
, x3: !a3
, x4: !a4
, x5: !a5 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
println6
( x1: !a1
, x2: !a2
, x3: !a3
, x4: !a4
, x5: !a5
, x6: !a6 ) : void
(* ****** ****** *)
//
#symload println with println0
#symload println with println1
#symload println with println2
#symload println with println3
#symload println with println4
#symload println with println5
#symload println with println6
//
(* ****** ****** *)
//
// Implementations
//
(* ****** ****** *)
//
impltmp
<a1>
print1(x1) = () where
{
  val () = g_print<a1>(x1)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
print2
( x1
, x2 ) = () where
{
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
print3
( x1
, x2
, x3 ) = () where
{
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
print4
( x1
, x2
, x3
, x4 ) = () where
{
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
print5
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
  val () = g_print<a5>(x5)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
print6
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
  val () = g_print<a5>(x5)
  val () = g_print<a6>(x6)
}
//
(* ****** ****** *)
impltmp
println0<>
((*_*)) = g_print("\n")
(* ****** ****** *)
//
impltmp
<a1>
println1
( x1 ) =
let
val () =
print1
( x1 ) in println0<>()
end // end of [println1]
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
println2
( x1
, x2 ) =
let
val () =
print2
( x1, x2 ) in println0<>()
end // end of [println2]
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
println3
( x1
, x2
, x3 ) =
let
val () =
print3
( x1
, x2, x3 ) in println0<>()
end // end of [println3]
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
println4
( x1
, x2
, x3
, x4 ) =
let
val () =
print4
( x1, x2
, x3, x4 ) in println0<>()
end // end of [println4]
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
println5
( x1
, x2
, x3
, x4
, x5 ) =
let
val () =
print5
( x1
, x2, x3
, x4, x5 ) in println0<>()
end // end of [println5]
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
println6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
let
val () =
print6
( x1, x2
, x3, x4
, x5, x6 ) in println0<>()
end // end of [println6]
//
(* ****** ****** *)

(* end of [print.dats] *)
