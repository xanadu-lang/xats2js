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

implfun
d0env_nil() =
D0ENV(mylist_nil())

(* ****** ****** *)

implfun
d0env_extend
(env, x0, v0) =
let
val+D0ENV(xvs) = env
in
D0ENV(mylist_cons((x0, v0), xvs))
end // end of [d0env_extend]

(* ****** ****** *)

implfun
d0env_search
  (env, x0) =
let
val+D0ENV(xvs) = env
in
(
  search(xvs)
) where
{
  fun search(xvs) =
  (
  case+ xvs of
  | mylist_nil() =>
    myoptn_nil()
  | mylist_cons(xv1, xvs) =>
    (
    if
    (x0 = xv1.0)
    then myoptn_cons(xv1.1) else search(xvs)
    )
  )
} (* end of [where] *)
end // end of [d0env_extend]

(* ****** ****** *)

(* end of [midterm_d0env.dats] *)
