(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"xatslib/libc/DATS/fpath.dats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/libc/DATS/CATS/JS/Node/basics.dats"
(* ****** ****** *)

val () =
let
val cs =
fpath_streamize_char
("./readfile.dats")
in
stream_vt_foreach0(cs)
where
{
impltmp
foreach0$work<char>(c0) = print(c0)
}
end (* let *) // end-of-val

(* ****** ****** *)

val () =
let
val
lines =
fpath_streamize_line("./readfile.dats")
in
(
iforeach0(lines)
) where
{
  impltmp
  iforeach0$work
  <string>
  (i0, line) = println("(line#", i0, ")\t", line)
}
end (* let *) // end-of-val

(* ****** ****** *)

(* end of [readfile.dats] *)
