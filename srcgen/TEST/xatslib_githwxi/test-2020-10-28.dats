(* ****** ****** *)
#staload "./../myprint.dats"
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
| T0Mcond of 
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
| T0Mcond(t1, t2, t3) =>
  print
  ("T0Mcond(", t1, "; ", t2, "; ", t3, ")")
//
) (* end of [print_t0erm] *)
(* ****** ****** *)

datatype
value =
|
VALint of (int)
|
VALbtf of (bool)
|
VALlam of (t0erm, d0env)
|
VALfix of (t0var, value(*lam*))

and
d0env =
| D0ENV of list(@(t0var, value))

where 
{
  typedef valuelst = list(value)
}

(* ****** ****** *)
//
#extern
fun
print_value(v0: value): void
//
(* ****** ****** *)
implement
g_print<value> = print_value
(* ****** ****** *)
implement
print_value(v0) =
(
case+ v0 of
|
VALint(int) =>
print("VALint(", int, ")")
|
VALbtf(btf) =>
print("VALbtf(", btf, ")")
|
VALlam(_, _) =>
print("VALlam(", "...", ")")
|
VALfix(_, _) =>
print("VALfix(", "...", ")")
)
(* ****** ****** *)

val
d0env_nil = D0ENV(list_nil())

(* ****** ****** *)

#extern
fun
t0erm_interp0
(prog: t0erm): value
#extern
fun
t0erm_interp1
( t0m0: t0erm
, denv: d0env): value

(* ****** ****** *)
implement
t0erm_interp0(prog) =
t0erm_interp1(prog, d0env_nil)
(* ****** ****** *)

#extern
fun
d0env_search
( env: d0env
, key: t0var): optn(value)
implement
d0env_search
(env, key) =
(
  auxlst(xvs)
) where
{
val+
D0ENV
(xvs) = env
fun
auxlst(xvs) =
(
case+ xvs of
| list_nil() =>
  optn_nil()
| list_cons(xv1, xvs) =>
  if key = xv1.0
  then optn_cons(xv1.1) else auxlst(xvs)
)
} (*where*) // end of [d0env_search]

(* ****** ****** *)

#extern
fun
d0env_extend
( env0: d0env
, x0: t0var, v0: value): d0env
implement
d0env_extend
(env, x0, v0) =
let
val+
D0ENV(xvs) = env
in
D0ENV(list_cons((x0, v0), xvs))
end // end of [d0env_extend]

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_var
( t0m0: t0erm
, env0: d0env): value =
let
//
(*
val () =
println!
("aux_var: t0m0 = ", t0m0)
*)
//
val-T0Mvar(x0) = t0m0
val
opt = d0env_search(env0, x0)
//
in
case- opt of optn_cons(v0) => v0
end // end of [aux_var]

(* ****** ****** *)

fun
aux_app
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mapp
(tfun, targ) = t0m0
//
val vfun =
t0erm_interp1(tfun, env0)
val varg =
t0erm_interp1(targ, env0)
//
in
case- vfun of
|
VALlam(tlam, elam) =>
let
val-
T0Mlam(x0, body) = tlam
in
  t0erm_interp1
  ( body
  , d0env_extend(elam, x0, varg))
end
|
VALfix(f0, vlam) =>
let
val-
VALlam(t0, elam) = vlam
val-
T0Mlam(x0, body) = t0
val efix =
d0env_extend(elam, f0, vfun)
in
  t0erm_interp1
  ( body
  , d0env_extend(efix, x0, varg))
end
  
end // end of [aux_app]

(* ****** ****** *)

fun
aux_opr2
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mopr2
(opr, t1, t2) = t0m0
//
in
//
let
val v1 = t0erm_interp1(t1, env0)
val v2 = t0erm_interp1(t2, env0)
in
case- opr of
| "+" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALint(i1 + i2)
  end
| "-" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALint(i1 - i2)
  end
| "*" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALint(i1 * i2)
  end
//
| ">" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 > i2)
  end
| "<" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 < i2)
  end
| "=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 = i2)
  end
| "==" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 = i2)
  end
| "<=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 <= i2)
  end
| ">=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 >= i2)
  end
| "!=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 != i2)
  end
//
end (*let*) end (*let*) // end of [aux_opr2]

(* ****** ****** *)

fun
aux_cond
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mcond
(t1, t2, t3) = t0m0
//
in
let
val v1 =
t0erm_interp1(t1, env0)
in
case- v1 of
|
VALbtf(b1) =>
(
  if b1
  then t0erm_interp1(t2, env0)
  else t0erm_interp1(t3, env0)
)
end(*let*)
end(*let*) // end of [aux_cond]

(* ****** ****** *)

in (*in-of-local*)

implement
t0erm_interp1
(t0m0, env0) =
(
case+ t0m0 of
|
T0Mint(i0) =>
VALint(i0)
|
T0Mbtf(b0) =>
VALbtf(b0)
|
T0Mvar(x0) =>
aux_var(t0m0, env0)
|
T0Mlam(x0, t0m1) =>
(
  VALlam(t0m0, env0)
)
|
T0Mfix(f0, t0m1) =>
(
  VALfix(f0, vlam)
) where
{
  val
  vlam = VALlam(t0m1, env0)
}
//
|
T0Mapp _ => aux_app(t0m0, env0)
|
T0Mopr2 _ => aux_opr2(t0m0, env0)
//
|
T0Mcond _ => aux_cond(t0m0, env0)
//
) where
{
(*
val () =
println
("t0erm_interp1: t0m0 = ", t0m0)
*)
} (* end of [t0erm_interp1] *)

end // end of [local]

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
T0Mcond(
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
val () =
println
( "fact(10) = "
, t0erm_interp0(T0Mapp(fact, T0Mint(10))))

(* ****** ****** *)

val
fibo =
let
val f = T0Mvar("f")
val x = T0Mvar("x")
in
T0Mfix
(
"f"
,
T0Mlam("x",
T0Mcond(
T0Mopr2("<", x, T0Mint(2))
,
x
,
T0Mopr2
( "+"
, T0Mapp(f, T0Mopr2("-", x, T0Mint(2)))
, T0Mapp(f, T0Mopr2("-", x, T0Mint(1)))
)
)
)
)
end // end of [let] // end of [val]
val () =
println
( "fibo(10) = "
, t0erm_interp0(T0Mapp(fibo, T0Mint(10))))

(* ****** ****** *)

(* end of [test-2020-10-28.dats] *)
