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
//
// HX-2020-11-13:
//
// Please note that
// no error reporting of any
// sort is taken into account.
//
(* ****** ****** *)

#symload
= with tpext_eqref of 9999

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

excptcon TunifyExn of ()

(* ****** ****** *)

local

fun
auxext1
(X1, tp2) =
(
case+ tp2 of
| T0Pext(X2) =>
  if
  (X1 = X2)
  then () else
  auxext2(X1, tp2)
| _(*non-T0Pext*) =>
  auxext2(X1, tp2)
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
  else $raise TunifyExn(*void*)
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
  then () else $raise TunifyExn()
)
|
T0Pfun(tp11, tp12) =>
( case- tp2 of
  |
  T0Pfun(tp21, tp22) =>
  let
  val () = tunify(tp11, tp21)
  val () = tunify(tp12, tp22) in () end
)
|
T0Ptup(tp11, tp12) =>
( case- tp2 of
  |
  T0Ptup(tp21, tp22) =>
  let
  val () = tunify(tp11, tp21)
  val () = tunify(tp12, tp22) in () end
)
) (* end of [auxtype] *)

in(*in-of-local*)

implfun
tunify
(tp1, tp2) =
let
(*
val () =
println("tunify: tp1 = ", tp1)
val () =
println("tunify: tp2 = ", tp2)
*)
in
//
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
//
end (* tunify *) end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxvar
(t0m0, env0) =
let
val-
T0Mvar(x0) = t0m0
val
opt =
s0env_search(env0, x0)
in
case- opt of
| myoptn_cons(t0p1) => t0p1
end // end of [auxvar]

(* ****** ****** *)

fun
auxlam
(t0m0, env0) =
(
T0Pfun
(targ, tres)
) where
{
//
val-
T0Mlam
( x0
, opt1
, t0m2) = t0m0
//
val
targ =
(
case+ opt1 of
|
myoptn_nil() =>
type0_new_ext()
|
myoptn_cons(t0p1) => t0p1)
//
val tres =
let
val env1 =
s0env_extend
(env0, x0, targ)
in
  t0erm_tpinf1(t0m2, env1)
end
//
} (* end of [auxlam] *)

(* ****** ****** *)

fun
auxfix
(t0m0, env0) =
(
  tfix) where
{
//
val-
T0Mfix
( f0
, opt1
, t0m2) = t0m0
//
val
tfix =
(
case+ opt1 of
|
myoptn_nil() =>
type0_new_ext()
|
myoptn_cons(t0p1) => t0p1)
//
val
tfun =
let
val env1 =
s0env_extend
(env0, f0, tfix)
in
  t0erm_tpinf1(t0m2, env1)
end
//
val () = tunify(tfix, tfun)
//
} (* end of [auxfix] *)

(* ****** ****** *)

fun
auxapp
(t0m0, env0) =
let
//
val-
T0Mapp
(t0m1, t0m2) = t0m0
val
t0p1 =
t0erm_tpinf1(t0m1, env0)
val
t0p2 =
t0erm_tpinf1(t0m2, env0)
//
in
let
val
tres = type0_new_ext()
val () =
tunify
( t0p1
, T0Pfun(t0p2, tres)) in tres
end
end // end of [auxapp]

(* ****** ****** *)

fun
auxlet
(t0m0, env0) =
let
//
val-
T0Mlet
( x0
, t0m1, t0m2) = t0m0
//
val t0p1 =
t0erm_tpinf1(t0m1, env0)
//
in
(
  t0erm_tpinf1(t0m2, env1)
) where
{
val
env1 =
s0env_extend(env0, x0, t0p1)
}
end // end of [auxlet]

(* ****** ****** *)

fun
auxtup
(t0m0, env0) =
(
T0Ptup(t0p1, t0p2)
) where
{
//
val-
T0Mtup
(t0m1, t0m2) = t0m0
//
val
t0p1 =
t0erm_tpinf1(t0m1, env0)
val
t0p2 =
t0erm_tpinf1(t0m2, env0)
//
} (* end of [auxtup] *)

(* ****** ****** *)

fun
auxfst
(t0m0, env0) =
let
//
val-
T0Mfst
(t0m1) = t0m0
val
t0p1 =
t0erm_tpinf1(t0m1, env0)
//
in
let
val
t0pa =
type0_new_ext((*void*))
val
t0pb =
type0_new_ext((*void*))
val () =
tunify
( t0p1
, T0Ptup(t0pa, t0pb)) in t0pa
end
end // end of [auxfst]

(* ****** ****** *)

fun
auxsnd
(t0m0, env0) =
let
//
val-
T0Msnd
(t0m1) = t0m0
val
t0p1 =
t0erm_tpinf1(t0m1, env0)
//
in
let
val
t0pa =
type0_new_ext((*void*))
val
t0pb =
type0_new_ext((*void*))
val () =
tunify
( t0p1
, T0Ptup(t0pa, t0pb)) in t0pb
end
end // end of [auxsnd]

(* ****** ****** *)

fun
auxopr1
(t0m0, env0) =
let
//
val-
T0Mopr1
( topr
, t0m1) = t0m0
//
val
t0p1 =
t0erm_tpinf1(t0m1, env0)
//
in
//
case topr of
| "-" =>
  let
  val () =
  tunify(t0p1, T0Pint) in T0Pint
  end
| "~" =>
  let
  val () =
  tunify(t0p1, T0Pbtf) in T0Pbtf
  end
//
end // end of [auxopr1]

(* ****** ****** *)

fun
auxopr2
(t0m0, env0) =
let
//
val-
T0Mopr2
( topr
, t0m1
, t0m2) = t0m0
//
val
t0p1 =
t0erm_tpinf1(t0m1, env0)
val
t0p2 =
t0erm_tpinf1(t0m2, env0)
//
in
//
case topr of
| "+" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pint
  end
| "-" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pint
  end
| "*" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pint
  end
| "/" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pint
  end
| "%" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pint
  end
//
| "<" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pbtf
  end
| ">" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pbtf
  end
| "=" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pbtf
  end
| "<=" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pbtf
  end
| ">=" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pbtf
  end
| "==" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pbtf
  end
| "!=" =>
  let
  val () =
  tunify(t0p1, T0Pint)
  val () =
  tunify(t0p2, T0Pint) in T0Pbtf
  end
//
end // end of [auxopr2]

(* ****** ****** *)

fun
auxcond
(t0m0, env0) =
let
//
val-
T0Mcond
( t0m1
, t0m2
, opt3) = t0m0
//
val
t0p1 =
t0erm_tpinf1
(t0m1, env0)
val () =
tunify(t0p1, T0Pbtf)
//
val
t0p2 =
t0erm_tpinf1(t0m2, env0)
val
t0p3 =
(
case+ opt3 of
|
myoptn_nil
() => T0Pnil(*void*)
|
myoptn_cons
(t0m3) => t0erm_tpinf1(t0m3, env0)
) : type0 // end of [val]
//
in
let val () = tunify(t0p2, t0p3) in t0p3 end
end // end of [auxcond]

(* ****** ****** *)

in(*in-of-local*)

implfun
t0erm_tpinf1
(t0m0, env0) =
(
case+
t0m0 of
//
| T0Mnil _ => T0Pnil
//
| T0Mint _ => T0Pint
| T0Mbtf _ => T0Pbtf
| T0Mstr _ => T0Pstr
//
| T0Mvar _ => auxvar(t0m0, env0)
//
| T0Mlam _ => auxlam(t0m0, env0)
//
| T0Mapp _ => auxapp(t0m0, env0)
//
| T0Mlet _ => auxlet(t0m0, env0)
//
| T0Mfix _ => auxfix(t0m0, env0)
//
| T0Mtup _ => auxtup(t0m0, env0)
| T0Mfst _ => auxfst(t0m0, env0)
| T0Msnd _ => auxsnd(t0m0, env0)
//
| T0Mopr1 _ => auxopr1(t0m0, env0)
| T0Mopr2 _ => auxopr2(t0m0, env0)
//
| T0Mcond _ => auxcond(t0m0, env0)
//
) where
{
(*
val () =
println
("t0erm_tpinf1: t0m0 = ", t0m0)
*)
} (* end of [t0erm_tpinf] *)

end // end of [local]

(* ****** ****** *)

implfun
t0erm_tpinf0(t0m0) =
t0erm_tpinf1(t0m0, s0env_nil())

(* ****** ****** *)

(* end of [midterm_tpinf.dats] *)
