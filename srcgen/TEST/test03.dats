(* ****** ****** *)
//
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gseq.dats"
#staload
"prelude/DATS/unsafe.dats"
//
(* ****** ****** *)
//
#staload _ =
"prelude/DATS/char.dats"
#staload _ =
"prelude/DATS/gint.dats"
#staload _ =
"prelude/DATS/string.dats"
#staload _ =
"prelude/DATS/list.dats"
//
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/JS/basics.dats"
#staload
"prelude\
/DATS/CATS/JS/unsafe.dats"
(* ****** ****** *)

#extern
fun
<a:type>
<r:type>
foldl$fopr(r0: r, x0: a): r

(* ****** ****** *)

fun
<a:type>
<r:type>
foldl(xs: list(a), r0: r): r =
(
case+ xs of
| list_nil() => r0
| list_cons(x0, xs) =>
  foldl(xs, foldl$fopr<a><r>(r0, x0))
)

(* ****** ****** *)

fun
<a:type>
length
( xs
: list(a)): int =
(
  foldl<a><int>(xs, 0)
) where
{
  implement
  foldl$fopr<a><int>(r0, x0) = r0 + 1
} endwhr

(* ****** ****** *)
//
val xs =
list_cons
( 1
, list_cons
  ( 2
  , list_cons
    ( 3
    , list_nil()
    )
  )
)
//
(* ****** ****** *)
//
val () = g_print( "xs = "  )
val () = g_print(    xs    )
val () = g_print(   '\n'   )
val () = g_print("|xs| = " )
val () = g_print(length(xs))
val () = g_print(   '\n'   )
//
(* ****** ****** *)
//
val xs2 = append(xs, xs)
//
val () = g_print( "xs2 = "  )
val () = g_print(    xs2    )
val () = g_print(    '\n'   )
val () = g_print("|xs2| = " )
val () = g_print(length(xs2))
val () = g_print(    '\n'   )
//
(* ****** ****** *)
//
val xs3 = reverse(xs2)
//
val () = g_print( "xs3 = "  )
val () = g_print(    xs3    )
val () = g_print(    '\n'   )
val () = g_print("|xs3| = " )
val () = g_print(length(xs3))
val () = g_print(    '\n'   )
//
(* ****** ****** *)

(* end of [test03.dats] *)
