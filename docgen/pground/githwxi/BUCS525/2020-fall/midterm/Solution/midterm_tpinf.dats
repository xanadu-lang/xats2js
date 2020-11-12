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

implfun
t0erm_tpinf0
(t0m0) =
t0erm_tpinf1
(t0m0, s0env_nil())

(* ****** ****** *)

#symload
= with tpext_eqref of 1000

(* ****** ****** *)

#extern
fun
occurs
(X0: tpext, tp0: type0): bool
#extern
fun
tunify
(tp1: type0, tp2: type0): void

(* ****** ****** *)

implfun
occurs
(X0, tp0) =
(
case+ tp0 of
| T0Pbas _ => false
| T0Pfun
  (tp1, tp2) =>
  if
  occurs(X0, tp1)
  then true else occurs(X0, tp2)
| T0Ptup
  (tp1, tp2) =>
  if
  occurs(X0, tp1)
  then true else occurs(X0, tp2)
| T0Pext(X1) =>
  if
  (X0 = X1)
  then true else
  (
  case+
  X1.get() of
  | myoptn_nil() => false
  | myoptn_cons(tp1) => occurs(X0, tp1)
  )
) (* end of [occurs] *)

(* ****** ****** *)

excptcon TUNIFY_EXN of ()

(* ****** ****** *)

local

fun
auxext1
(X1, tp2) =
(
case+ tp2 of
| T2Pext(X2) =>
  if
  (X1 = X2)
  then () else auxext2(X1, tp2)
)
and
auxext2
(X1, tp2) =
(
  if
  not
  (
  occurs(X1, tp2)
  )
  then X1.set(tp2)
  else $raise TUNIFY_EXN(*void*)
)

fun
auxtype
( tp1: type0
, tp2: type0): void =
(
case- tp1 of
|
T0Pbas(nm1) =>
( case- tp2 of
  |
  T0Pbas(nm2) =>
  if
  (nm1 = nm2)
  then () else $raise TUNIFY_EXN()
)
|
T0Pfun(tp11, tp12) =>
( case- tp2 of
  |
  T0Pfun(tp21, tp22) =>
  let
  val () = tunify(tp11, tp12)
  val () = tunify(tp12, tp22) in () end
)
|
T0Ptup(tp11, tp12) =>
( case- tp2 of
  |
  T0Ptup(tp21, tp22) =>
  let
  val () = tunify(tp11, tp12)
  val () = tunify(tp12, tp22) in () end
)
) (* end of [auxtype] *)

in(*in-of-local*)

implfun
tunify
(tp1, tp2) =
(
case tp1 of
| T0Pext(X1) =>
  (
  case+ X1.get() of
  | myoptn_nil() => auxext1(X1, tp2)
  | myoptn_cons(tp1) => tunify(tp1, tp2)
  )
| _ (*non-T0Pext*) =>
  (
  case+ tp2 of
  | T0Pext(X2) =>
    (
    case+ X2.get() of
    | myoptn_nil() => auxext2(X2, tp1)
    | myoptn_cons(tp2) => tunify(tp1, tp2)
    )
  | _ (* non-T0Pext *) => auxtype(tp1, tp2)
  )
) (* end of [tunify] *)

end // end of [local]

(* ****** ****** *)

implfun
t0erm_tpinf1
(t0m0, env0) =
(
case+
t0m0 of
| T0Mint _ => T0Pint
) where
{
(*
  val () =
  println
  ("t0erm_tpinf1: t0m0 = ", t0m0)
*)
} (* end of [t0erm_tpinf] *)

(* ****** ****** *)

(* end of [midterm_tpinf.dats] *)
