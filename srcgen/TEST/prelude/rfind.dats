(* ****** ****** *)
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
_(*UN*) =
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
#staload
"prelude\
/DATS/CATS/JS/g_print.dats"
(* ****** ****** *)
excptcon TRUEexn of ()
(* ****** ****** *)

fun
rfind
( xs
: list(int), x0: int
) : bool =
try
let
val () =
auxlst(xs) in false
end
with
| ~TRUEexn() => true end
where {
//
fun
auxlst
(xs: list(int)): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x1, xs) =>
  let
  val () = auxlst(xs)
  in
  if x0 = x1 then $raise TRUEexn()
  end
)
//
} (* where *) // end of [rfind]

(* ****** ****** *)
//
val xs =
list_cons
( 0
, list_cons
  ( 1
  , list_cons
    ( 2
    , list_cons
      (3, list_nil())
    )
  )
)
//
val ans2 = rfind(xs, 2(*x0*))
//
val ans5 = rfind(xs, 5(*x0*))
//
(* ****** ****** *)

(* end of [rfind.dats] *)
