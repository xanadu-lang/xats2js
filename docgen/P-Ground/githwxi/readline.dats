(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
//
#extern
fun
myline_process
(line: string): void = $exname()
//
implement
myline_process(line) =
println("reverse(line) = ", reverse(line))
//
(* ****** ****** *)

(* end of [readline.dats] *)
