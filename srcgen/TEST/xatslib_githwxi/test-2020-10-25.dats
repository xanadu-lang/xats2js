(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gfor.dats"
#staload
"prelude/DATS/gfun.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gios.dats"
(* ****** ****** *)
#staload
"prelude/DATS/rand.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/gflt.dats"
#staload
"prelude/DATS/string.dats"
#staload
"prelude/DATS/string_vt.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/stream.dats"
#staload
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)
#staload
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)

#staload "./../print.dats"

(* ****** ****** *)
//
// creating an alias
//
typedef t0opr = string
typedef t0var = string
//
(* ****** ****** *)
//
// abstract syntax
//
datatype t0erm = // level-0
//
| T0Mint of (int)
| T0Mbtf of (bool)
//
| T0Mvar of t0var
| T0Mlam of (t0var, t0erm)
| T0Mfix of (t0var, t0erm)
| T0Mapp of (t0erm, t0erm)
//
| T0Mopr1 of
  (t0opr, t0erm(*arg1*))
| T0Mopr2 of
  ( t0opr
  , t0erm(*arg1*), t0erm(*arg2*))
//
| T0Mif0 of 
  ( t0erm(*cond*)
  , t0erm(*then*), t0erm(*else*))
//
where
{
typedef
t0ermlst = list(t0erm)
}
//
(* ****** ****** *)
#extern
fun
print_t0erm(t0: t0erm): void
(* ****** ****** *)
implement
g_print<t0erm> = print_t0erm
(* ****** ****** *)
implement
print_t0erm(t0) =
(
case+ t0 of
| T0Mint(i0) =>
  print("T0Mint(", i0, ")")
| T0Mbtf(b0) =>
  print("T0Mbtf(", b0, ")")
//
| T0Mvar(x0) =>
  print("T0Mvar(", x0, ")")
//
| T0Mlam(x0, t0) =>
  print
  ("T0Mlam(", x0, "; ", t0, ")")
| T0Mfix(x1, t1) =>
  print
  ("T0Mfix(", x1, "; ", t1, ")")
//
| T0Mapp(t1, t2) =>
  print
  ("T0Mapp(", t1, "; ", t2, ")")
//
| T0Mopr1(x0, t1) =>
  print
  ("T0Mopr1(", x0, "; ", t1, ")")
| T0Mopr2(x0, t1, t2) =>
  print
  ("T0Mopr2(", x0, "; ", t1, "; ", t2, ")")
//
| T0Mif0(t1, t2, t3) =>
  print
  ("T0Mif0(", t1, "; ", t2, "; ", t3, ")")
//
) (* end of [print_t0erm] *)
(* ****** ****** *)

#extern
fun
t0erm_subst
( t0: t0erm
, x0: t0var
, sub: t0erm): t0erm
(* ****** ****** *)

implement
t0erm_subst
(t0, x0, sub) =
(
case+ t0 of
//
| T0Mint _ => t0
| T0Mbtf _ => t0
//
| T0Mvar(x1) =>
  if
  (x0 = x1)
  then sub else t0
//
|
T0Mlam(x1, t1) =>
if (x0 = x1)
then t0 else
T0Mlam
( x1
, t0erm_subst(t1, x0, sub))
//
|
T0Mfix(f1, t1) =>
if (x0 = f1)
then t0 else
T0Mfix
( f1
, t0erm_subst(t1, x0, sub))
//
|
T0Mapp(t1, t2) =>
T0Mapp
( t0erm_subst(t1, x0, sub)
, t0erm_subst(t2, x0, sub))
//
|
T0Mopr1(opr, t1) =>
T0Mopr1
( opr
, t0erm_subst(t1, x0, sub))
|
T0Mopr2(opr, t1, t2) =>
T0Mopr2
( opr
, t0erm_subst(t1, x0, sub)
, t0erm_subst(t2, x0, sub))
//
|
T0Mif0(t1, t2, t3) =>
T0Mif0
( t0erm_subst(t1, x0, sub)
, t0erm_subst(t2, x0, sub)
, t0erm_subst(t3, x0, sub))
//
) (* end of [t0erm_subst] *)

(* ****** ****** *)

#extern
fun
t0erm_interp
(t0: t0erm): t0erm

implement
t0erm_interp
  (t0) =
(
case+ t0 of
//
| T0Mint _ => t0
| T0Mbtf _ => t0
//
| T0Mlam(_, _) => t0
| T0Mfix(f1, t2) =>
  t0erm_interp
  (t0erm_subst(t2, f1, t0))
//
| T0Mapp(t1, t2) =>
  let
    val t1 = t0erm_interp(t1)
    val t2 = t0erm_interp(t2)
  in
    case+ t1 of
    | T0Mlam(x0, t1) =>
      t0erm_interp
      (t0erm_subst(t1, x0, t2))
    | _ (* non-T0Mlam *) => T0Mapp(t1, t2)
  end
//
|
T0Mopr2(opr, t1, t2) =>
let
  val t1 = t0erm_interp(t1)
  val t2 = t0erm_interp(t2)
in
//
  case+ opr of
//
  | "<" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mbtf(i1 < i2)
    end
  | ">" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mbtf(i1 > i2)
    end
  | "=" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mbtf(i1 = i2)
    end
//
  | "+" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mint(i1 + i2)
    end
  | "-" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mint(i1 - i2)
    end
  | "*" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mint(i1 * i2)
    end
//
end
//
|
T0Mif0(t1, t2, t3) =>
let
val
t1 = t0erm_interp(t1)
in
case+ t1 of
| T0Mbtf(btf) =>
  if btf
  then t0erm_interp(t2) else t0erm_interp(t3)
| _(*non-T0Mbtf*) =>
  T0Mif0(t1, t0erm_interp(t2), t0erm_interp(t3))
end
//
| _ (* rest-of-t0erm *) => t0 // HX: error-handling is needed
//
) (* end of [t0erm_interp] *)

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
T0Mlam("x",
T0Mif0(
T0Mopr2(">", x, T0Mint(0))
,
T0Mopr2
( "*", x
, T0Mapp(f, T0Mopr2("-", x, T0Mint(1))))
,
T0Mint(1)
)
)
)
end // end of [let] // end of [val]

(* ****** ****** *)

val () =
println
( "fact(10) = "
, t0erm_interp(T0Mapp(fact, T0Mint(10))))

(* ****** ****** *)

(* end of [test-2020-10-25.dats] *)
