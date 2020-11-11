(* ****** ****** *)
typedef
tpnam = string
(* ****** ****** *)
typedef
t0opr = string
typedef
t0var = string
(* ****** ****** *)
abstype tpext_type
typedef
tpext = tpext_type
(* ****** ****** *)
#staload
"./../mylib/mylib.dats"
(* ****** ****** *)
//
datatype type0 =
|
T0Pbas of tpnam
|
T0Pfun of
(type0(*arg*), type0(*res*))
|
T0Ptup of
(type0(*fst*), type0(*snd*))
//
| T0Pext of tpext(*abstract*)
//
where
{
typedef type0lst = mylist(type0)
typedef type0opt = myoptn(type0)
}
//
(* ****** ****** *)
//
val
T0Pnil: type0 // nil
//
val
T0Pint: type0 // int
//
val
T0Pbool: type0 // bool
//
val
T0Pstring: type0 // string
//
(* ****** ****** *)
//
fun
print_type0
(x0: type0): void
//
(* ****** ****** *)
//
// abstract syntax
//
datatype
t0dcl =
| T0DCL of
  (t0var, t0erm)
//
and t0erm =
//
| T0Mnil of ()
//
| T0Mint of (int)
| T0Mstr of string
//
| T0Mvar of (t0var)
//
| T0Mlam of
  ( t0var
  , type0opt, t0erm)
| T0Mfix of
  ( t0var
  , type0opt, t0erm)
//
| T0Mapp of (t0erm, t0erm)
//
| T0Mlet of
  (t0var, t0erm, t0erm)
//
| T0Mopr1 of
  (t0opr, t0erm)
| T0Mopr2 of
  (t0opr, t0erm, t0erm)
//
| T0Mfst of (t0erm)
| T0Msnd of (t0erm)
| T0Mtup of (t0erm, t0erm)
//
| T0Manno of (t0erm, type0)
//
| T0Mcond of
  ( t0erm(*test*)
  , t0erm(*then*), t0ermopt(*else*))
//
where
{
typedef t0dclist = mylist(t0dcl)
typedef t0ermlst = mylist(t0erm)
typedef t0ermopt = myoptn(t0erm)
}
//
(* ****** ****** *)
fun
print_t0erm
(x0: t0erm): void
(* ****** ****** *)

datatype
s0env =
S0ENV of
mylist(@(t0var, type0))

(* ****** ****** *)

fun
s0env_extend
(s0env, t0var, type0): s0env
fun
s0env_search
(s0env, t0var): myoptn(type0)

(* ****** ****** *)
//
// If [prog] is ill-typed,
// then TypeErrExn is raised
//
fun
t0erm_tcheck0
(prog: t0erm): type0
fun
t0erm_tcheck1
(t0m0: t0erm, senv: s0env): type0
//
(* ****** ****** *)

datatype
value =
//
| VALnil of ()
//
| VALint of (int)
| VALbtf of (bool)
| VALstr of string
//
| VALtup of (value, value)
| VALlam of (t0erm, d0env)
| VALfix of (t0var, value(*lam*))
//
and
d0env =
| D0ENV of
  mylist(@(t0var, value))

where
{
typedef valuelst = mylist(value)
}

(* ****** ****** *)
//
fun
print_value
(x0: value): void
//
(* ****** ****** *)

fun
t0erm_interp0
(prog: t0erm): value
fun
t0erm_interp1
(t0m: t0erm, env: d0env): value

(* ****** ****** *)

(* end of [midterm.sats] *)
