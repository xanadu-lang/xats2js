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

local

fun
aux_var
( t0m0: t0erm
, env0: s0env): value =
let
//
(*
val () =
println
("aux_var: t0m0 = ", t0m0)
*)
//
val-T0Mvar(x0) = t0m0
val
opt = s0env_search(env0, x0)
//
in
case- opt of myoptn_cons(v0) => v0
end // end of [aux_var]

(* ****** ****** *)

fun
aux_app
( t0m0: t0erm
, env0: s0env): value =
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
  , s0env_extend(elam, x0, varg))
end
|
VALfix(f0, vlam) =>
let
val-
VALlam(t0, elam) = vlam
val-
T0Mlam(x0, body) = t0
val efix =
s0env_extend(elam, f0, vfun)
in
  t0erm_interp1
  ( body
  , s0env_extend(efix, x0, varg))
end
  
end // end of [aux_app]

(* ****** ****** *)

fun
aux_tup
( t0m0: t0erm
, env0: s0env): value =
(
  VALtup(vs)
) where
{
//
val-
T0Mtup(ts) = t0m0
//
val vs =
mylist_map_cfr
( ts
, lam(t0) => t0erm_interp1(t0, env0)
)
} (* end of [aux_tup] *)

(* ****** ****** *)

fun
aux_prj
( t0m0: t0erm
, env0: s0env): value =
let
val
opt =
mylist_get_at_opt
  (vs, i2)
in
  case- opt of
  | myoptn_cons(v1) => v1
end where
{
val-
T0Mprj(tup1, i2) = t0m0
val-
VALtup(vs) = t0erm_interp1(tup1, env0)
} (* end of [aux_prj] *)

(* ****** ****** *)

fun
aux_cond
( t0m0: t0erm
, env0: s0env): value =
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

fun
aux_opr1
( t0m0: t0erm
, env0: s0env): value =
let
//
val-
T0Mopr1
(opr, t1) = t0m0
in
//
let
val v1 =
t0erm_interp1(t1, env0)
in
case+ opr of
| "-" =>
(
case- v1 of
| VALint(i1) => VALint(~i1)
)
| "~" =>
(
case- v1 of
| VALint(i1) => VALint(~i1)
| VALbtf(b1) => VALbtf(~b1)
)
//
(*
| _ (* else *) =>
  let
  val () = assertloc(false) in exit(1)
  end where
  {
    val () =
    println
    ("t0erm_interp1: aux_opr1: opr = ", opr)
  }
*)
//
end (*let*) end (*let*) // end of [aux_opr1]

fun
aux_opr2
( t0m0: t0erm
, env0: s0env): value =
let
//
val-
T0Mopr2
(opr, t1, t2) = t0m0
in
//
let
val v1 = t0erm_interp1(t1, env0)
val v2 = t0erm_interp1(t2, env0)
in
case+ opr of
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
(*
| _ (* else *) =>
  let
  val () = assertloc(false) in exit(1)
  end where
  {
    val () =
    println
    ("t0erm_interp1: aux_opr2: opr = ", opr)
  }
*)
//
end (*let*) end (*let*) // end of [aux_opr2]

in (* in-of-local *)

implement
t0erm_interp1
(t0m0, env0) =
(
case+ t0m0 of
//
| T0Mint(i0) =>
  VALint(i0)
| T0Mbtf(i0) =>
  VALbtf(i0)
| T0Mlam _ =>
  VALlam(t0m0, env0)
//
| T0Mvar _ =>
  aux_var(t0m0, env0)
//
| T0Mapp _ =>
  aux_app(t0m0, env0)
//
| T0Mtup _ =>
  aux_tup(t0m0, env0)
| T0Mprj _ =>
  aux_prj(t0m0, env0)
//
|
T0Mfix1(f0, t0m1) =>
(
  VALfix(f0, vlam)
) where
{
  val
  vlam = VALlam(t0m1, env0)
}
//
| T0Mcond _ =>
  aux_cond(t0m0, env0)
//
| T0Mopr1 _ =>
  aux_opr1(t0m0, env0)
| T0Mopr2 _ =>
  aux_opr2(t0m0, env0)
//
(*
| _ (* else *) =>
let
val () =
println
("t0erm_interp1: t0m0 = ", t0m0)
in
let
val () = assertloc(false) in exit(1)
end
end // end of [ rest-of-t0erm ]
*)
)

end // end of [local]

(* ****** ****** *)

(* end of [midterm_interp.dats] *)
