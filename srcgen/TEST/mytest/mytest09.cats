
function
JS_fromto(n0)
{
  return XATS2JS_llazy_cfr
  (
    () => XATS2JS_strmcon_vt_cons(n0, JS_fromto(n0+1))
  ) ;
}

function
JS_sieve_helper(xs)
{
  return XATS2JS_stream_vt_uncons_cfr
  ( xs
  , XATS2JS_fnull
  , (x0, xs) =>
    XATS2JS_llazy_cfr
    ( () =>
      XATS2JS_strmcon_vt_cons
      ( x0
      , JS_sieve_helper
        (XATS2JS_stream_vt_filter0_cfr(xs, (x1) => (x1 % x0 > 0)))
      )
    )
  )
}

