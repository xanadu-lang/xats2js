/* ****** ****** */
// XATS2JS_PRELUDE
/* ****** ****** */

'use strict';

/* ****** ****** */
/*
Runtime for Xats2js
*/
/* ****** ****** */
const
XATS2JS_nil = null
const
XATS2JS_top = null
const
XATS2JS_none = null
const
XATS2JS_null = null
const
XATS2JS_void = null
/* ****** ****** */
function
XATS2JS_fnull
  (    )
{
throw new Error();
}
/* ****** ****** */
var // global
XATS2JS_excbas = 0
var // global
XATS2JS_exctag = 0
function
XATS2JS_new_exctag
  (    )
{
let bas0 =
XATS2JS_excbas;
let tag1 =
XATS2JS_exctag + 1;
XATS2JS_exctag = tag1;
return ( bas0 + tag1 );
}
/* ****** ****** */
function
XATS2JS_char
  ( cs )
{
// cs: singleton
return cs.charCodeAt(0);
}
function
XATS2JS_string
  ( cs )
{
return cs;//cs:JS_string
}
/* ****** ****** */
function
XATS2JS_fcast
  ( x0 )
{
return x0; //obj: object
}  
/* ****** ****** */
//
function
XATS2JS_raise
  ( exn )
{
  throw exn;//no return!
}
function
XATS2JS_reraise
  ( exn )
{
  throw exn;//no return!
}
/* ****** ****** */
//
function
XATS2JS_assert
  ( b0 )
{
if
(!b0)
{
  // [b0] is false
  throw new Error();
} // if-then
return ; // [b0] is true
}
//
function
XATS2JS_assertloc
  ( b0, loc )
{
if
(!b0)
{
  // [b0] is false
  throw new Error(loc);
} // if-then
return ; // [b0] is true
}
function
XATS2JS_assertmsg
  ( b0, msg )
{
if
(!b0)
{
  // [b0] is false
  throw new Error(msg);
} // if-then
return ; // [b0] is true
}
//
/* ****** ****** */
function
XATS2JS_lval_err
  (loc)
{
  // non-left-val!
  throw new Error(loc);
}
/* ****** ****** */
function
XATS2JS_lval_get
  (lvl0)
{
//
let
root = lvl0.root;
let
offs = lvl0.offs;
//
if
(
lvl0.hasOwnProperty('prev')
)
root =
XATS2JS_lval_get(lvl0.prev);
//  
return root[offs]; // JS_lval_get
}
/* ****** ****** */
function
XATS2JS_lval_set
  (lvl0, obj1)
{
//
let root = null;
let offs = lvl0.offs;
//
if
(
lvl0.hasOwnProperty('prev')
)
{ // flat tuple
root =
XATS2JS_lval_get(lvl0.prev);
root =
root.slice(); root[offs] = obj1;
XATS2JS_lval_set(lvl0.prev, root);
}
else
{
  lvl0.root[offs] = obj1; // boxed
}
return; // end of [XATS2JS_lval_set]
}
/* ****** ****** */
function
XATS2JS_patckerr0()
{
  throw new Error();
}
function
XATS2JS_patckerr1(loc)
{
  throw new Error(loc);
}
/* ****** ****** */
function
XATS2JS_matcherr0()
{
  throw new Error();
}
function
XATS2JS_matcherr1(loc)
{
  throw new Error(loc);
}
/* ****** ****** */
function
XATS2JS_new_var0
  ()
{
return {root:[null], offs:0};
}
function
XATS2JS_new_var1
  (init)
{
return {root:[init], offs:0};
}
/* ****** ****** */
function
XATS2JS_new_cofs
  (lvl1, idx2)
{
return {root:lvl1, offs:idx2}; 
}
function
XATS2JS_new_tofs
  (lvl1, idx2)
{
return {root:lvl1, offs:idx2}; 
}
/* ****** ****** */
function
XATS2JS_new_cptr
  (lvl1, idx2)
{
let
con1 =
XATS2JS_lval_get(lvl1);
return {root:con1, offs:idx2}; 
}
function
XATS2JS_new_tptr
  (lvl1, idx2)
{
let
tup1 =
XATS2JS_lval_get(lvl1);
if
(tup1[0] >= 0)
return {
  root:tup1, offs:idx2
};
else
return {
  prev:lvl1,
  root:tup1, offs:idx2
}; // end of [XATS2JS_new_tptr]
}
/* ****** ****** */

function
XATS2JS_new_lazy
  (thunk)
{
return {
  lztag: 0 // unused
, lzval: null // saved
, lzfun: thunk // for eval
}
} // end of [XATS2JS_new_lazy]

function
XATS2JS_lazy_eval
  (lzobj)
{
//
let lzres;
//
if
(lzobj.lztag===0)
{
lzres =
lzobj.lzfun();
lzobj.lztag = 1;
lzobj.lzval = lzres;
} else
{
//
// HX: tracking
//
  lzobj.lztag += 1;
  lzres = lzobj.lzval;
} ;
return lzres; // lazy_eval
} // end of [XATS2JS_lazy_eval]

/* ****** ****** */

function
XATS2JS_new_llazy
  (thunk, frees)
{
return {
  lztag: false // unused
, lzfun: thunk // for eval
, lzfrs: frees // for frees
}
} // end of [XATS2JS_new_llazy]

function
XATS2JS_llazy_eval
  (lzobj)
{
//
if
(lzobj.lztag)
{
  throw new Error();
}
//
  lzobj.lztag = true; // used
  return lzobj.lzfun(); // eval
//
} // end of [XATS2JS_llazy_eval]

function
XATS2JS_llazy_free
  (lzobj)
{
//
if
(lzobj.lztag)
{
  throw new Error();
}
//
  lzobj.lztag = true; // used
  return lzobj.lzfrs(); // free
//
} // end of [XATS2JS_llazy_free]

/* ****** ****** */

/* end of [XATS2JS_runtime.cats] */
/* ****** ****** */
/*
Basics for Xats2js
*/
/* ****** ****** */
//
// prelude/bool.sats
//
/* ****** ****** */
function
XATS2JS_bool_neg
  (b0)
{ return !b0 ; }
/* ****** ****** */
function
XATS2JS_bool_add
  (b1, b2)
{ return (b1 || b2); }
function
XATS2JS_bool_mul
  (b1, b2)
{ return (b1 && b2); }
/* ****** ****** */
//
// prelude/char.sats
//
/* ****** ****** */
function
XATS2JS_char_eqzq
  (c0)
{
return (0===c0); // eqzq
}
function
XATS2JS_char_neqzq
  (c0)
{
return (0!==c0); // neqzq
}
/* ****** ****** */
function
XATS2JS_char_cmp
  (c1, c2)
{
if
(c1 < c2)
return (-1);
else
return (c1 <= c2 ? 0 : 1);
}
/* ****** ****** */
function
XATS2JS_char_equal
  (c1, c2)
{
return (c1===c2); // equal
}
function
XATS2JS_char_noteq
  (c1, c2)
{
return (c1!==c2); // noteq
}
/* ****** ****** */
//
// prelude/gint.sats
//
/* ****** ****** */
function
XATS2JS_gint_abs_sint
  (x0)
{
if
(x0 >= 0)
{
  return x0; // abs
}
else
{
  return -x0; // abs
}
}
/* ****** ****** */
function
XATS2JS_gint_neg_sint
  (x0)
{
return (-x0); // neg
}
/* ****** ****** */
function
XATS2JS_gint_succ_sint
  (x0)
{
return (x0 + 1); // +1
}
function
XATS2JS_gint_pred_sint
  (x0)
{
return (x0 - 1); // -1
}
/* ****** ****** */
function
XATS2JS_gint_lt_sint_sint
  (x1, x2)
{
return (x1 < x2); // lt
}
function
XATS2JS_gint_gt_sint_sint
  (x1, x2)
{
return (x1 > x2); // gt
}
function
XATS2JS_gint_eq_sint_sint
  (x1, x2)
{
return (x1 === x2); // eq
}
function
XATS2JS_gint_lte_sint_sint
  (x1, x2)
{
return (x1 <= x2); // lte
}
function
XATS2JS_gint_gte_sint_sint
  (x1, x2)
{
return (x1 >= x2); // gte
}
function
XATS2JS_gint_neq_sint_sint
  (x1, x2)
{
return (x1 !== x2); // neq
}
/* ****** ****** */
function
XATS2JS_gint_cmp_sint_sint
  (x1, x2)
{
if
(x1 < x2)
return (-1);
else
return (x1 <= x2 ? 0 : 1);
}
/* ****** ****** */
function
XATS2JS_gint_add_sint_sint
  (x1, x2)
{
   return (x1 + x2); // add
}
/* ****** ****** */
function
XATS2JS_gint_sub_sint_sint
  (x1, x2)
{
  return (x1 - x2); // sub
}
/* ****** ****** */
function
XATS2JS_gint_mul_sint_sint
  (x1, x2)
{
  return (x1 * x2); // mul
}
/* ****** ****** */
function
XATS2JS_gint_mod_sint_sint
  (x1, x2)
{
  return (x1 % x2); // mod
}
/* ****** ****** */
function
XATS2JS_gint_div_sint_sint
  (x1, x2)
{ 
//
  let q0 = x1 / x2;
//
  if
  (q0 >= 0)
  {
    return Math.floor(q0);
  }
  else
  {
    return Math.ceil( q0 );
  }
}
/* ****** ****** */
//
// prelude/gflt.sats
//
/* ****** ****** */
function
XATS2JS_gflt_i_dflt
  (x0)
{
  return x0; // int
}
/* ****** ****** */
function
XATS2JS_gflt_abs_dflt
  (x0)
{
if
(x0 >= 0.0)
{
  return x0; // abs
}
else
{
  return -x0; // abs
}
}
/* ****** ****** */
function
XATS2JS_gflt_neg_dflt
  (x0)
{
return (-x0); // neg
}
/* ****** ****** */
function
XATS2JS_gflt_succ_dflt
  (x0)
{
return (x0 + 1); // +1
}
function
XATS2JS_gflt_pred_dflt
  (x0)
{
return (x0 - 1); // -1
}
/* ****** ****** */
function
XATS2JS_gflt_lt_dflt_dflt
  (x1, x2)
{
return (x1 < x2); // lt
}
function
XATS2JS_gflt_gt_dflt_dflt
  (x1, x2)
{
return (x1 > x2); // gt
}
function
XATS2JS_gflt_eq_dflt_dflt
  (x1, x2)
{
return (x1 === x2); // eq
}
function
XATS2JS_gflt_lte_dflt_dflt
  (x1, x2)
{
return (x1 <= x2); // lte
}
function
XATS2JS_gflt_gte_dflt_dflt
  (x1, x2)
{
return (x1 >= x2); // gte
}
function
XATS2JS_gflt_neq_dflt_dflt
  (x1, x2)
{
return (x1 !== x2); // neq
}
/* ****** ****** */
function
XATS2JS_gflt_cmp_dflt_dflt
  (x1, x2)
{
if
(x1 < x2)
return (-1);
else
return (x1 <= x2 ? 0 : 1);
}
/* ****** ****** */
function
XATS2JS_gflt_add_dflt_dflt
  (x1, x2)
{
   return (x1 + x2); // add
}
/* ****** ****** */
function
XATS2JS_gflt_sub_dflt_dflt
  (x1, x2)
{
   return (x1 - x2); // sub
}
/* ****** ****** */
function
XATS2JS_gflt_mul_dflt_dflt
  (x1, x2)
{
   return (x1 * x2); // mul
}
/* ****** ****** */
function
XATS2JS_gflt_div_dflt_dflt
  (x1, x2)
{
   return (x1 / x2); // div
}
/* ****** ****** */
//
// prelude/string.sats
//
/* ****** ****** */
//
// HX-2020-09-28:
// Please note that:
// A string is a JS_string
// A string_vt is a JS_array
//
/* ****** ****** */
function
XATS2JS_string_vt2t
  (cs)
{
cs.pop(); // remove the last '0'
let res = // from array to string
String.fromCharCode.apply(null, cs);
return res; // XATS2JS_string_vt2t
}
/* ****** ****** */
//
function
XATS2JS_string_nilq
  (opt)
{
return(opt==="");
}
function
XATS2JS_string_cons
  (opt)
{
return(opt!=="");
}
/* ****** ****** */
//
function
XATS2JS_stropt_nilq
  (opt)
{
return(opt===null);
}
function
XATS2JS_stropt_consq
  (opt)
{
return(opt!==null);
}
//
/* ****** ****** */
function
XATS2JS_string_lt
  (x1, x2)
{
  return (x1 < x2);
}
function
XATS2JS_string_gt
  (x1, x2)
{
  return (x1 > x2);
}
function
XATS2JS_string_eq
  (x1, x2)
{
  return (x1===x2);
}
function
XATS2JS_string_lte
  (x1, x2)
{
  return (x1 <= x2);
}
function
XATS2JS_string_gte
  (x1, x2)
{
  return (x1 >= x2);
}
function
XATS2JS_string_neq
  (x1, x2)
{
  return (x1 !== x2);
}
/* ****** ****** */
function
XATS2JS_string_cmp
  (x1, x2)
{
if(x1 < x2)
{
  return -1;
} else
{
  return (x1===x2 ? 0 : 1);
} // end of [if]
}
/* ****** ****** */
function
XATS2JS_string_head_opt
  (cs)
{
if
(cs.length <= 0)
{
  return 0; // none
}
return cs.charCodeAt(0);
}
/* ****** ****** */
function
XATS2JS_string_head_raw
  (cs)
{
return cs.charCodeAt(0);
}
/* ****** ****** */
function
XATS2JS_string_tail_raw
  (cs)
{
return cs.slice(1);//tail
}
/* ****** ****** */
function
XATS2JS_string_get_at
  (cs, i0)
{
return cs.charCodeAt(i0);
}
/* ****** ****** */
function
XATS2JS_strtmp_vt_alloc
  (bsz)
{
  let
  cs =
  new Array(bsz+1);
  cs[bsz] = 0; return cs;
}
function
XATS2JS_string_vt_get_at
  (cs, i0)
{
  return cs[i0];
  //cs:JS_array(char)
}
function
XATS2JS_strtmp_vt_set_at
  (cs, i0, c0)
{
  return (cs[i0] = c0);
}
/* ****** ****** */
function
XATS2JS_string_forall_cfr
  (cs, f0)
{
let i0;
let
res = true;
let
len = cs.length
for
( i0 = 0
; i0 < len; i0 += 1)
{
let c0 = cs.charCodeAt(i0);
if
(!f0(c0)){res = false; break;}
}
return res; // string_forall_cfr
}
/* ****** ****** */
function
XATS2JS_string_rforall_cfr
  (cs, f0)
{
let i0;
let
res = true;
let
len = cs.length
for
( i0 = len
; i0 >= 1 ; i0 -= 1)
{
let c0 = cs.charCodeAt(i0-1);
if
(!f0(c0)){res = false; break;}
}
return res; // string_rforall_cfr
}
/* ****** ****** */
function
XATS2JS_string_vt_forall_cfr
  (cs, f0)
{
let i0;
let
res = true;
let
len = cs.length
for
( i0 = 0
; i0 < len; i0 += 1)
{
if
(!f0(cs[i0])){res = false; break;}
}
return res; // string_vt_forall_cfr
}
/* ****** ****** */
function
XATS2JS_string_vt_rforall_cfr
  (cs, f0)
{
let i0;
let
res = true;
let
len = cs.length;
for
( i0 = len
; i0 >= 1 ; i0 -= 1)
{
if
(!f0(cs[i0-1])){res = false; break;}
}
return res; // string_vt_rforall_cfr
}
/* ****** ****** */
//
// prelude/array.sats
// (arrays of
//  various dimensionality)
//
/* ****** ****** */
//
// HX: 1-dimensional
//
/* ****** ****** */

function
XATS2JS_a0ptr_make
  (x0)
{
let A0 =
XATS2JS_a0ptr_alloc();
A0[0] = x0; return A0;
}
function
XATS2JS_a0ptr_alloc
  (  )
{
  return new Array(1);
}

/* ****** ****** */

function
XATS2JS_a0ref_get
  (A0)
{
  return A0[0];
}

/* ****** ****** */

function
XATS2JS_a0ref_set
  (A0, x0)
{
  return (A0[0] = x0);
}

/* ****** ****** */
//
// HX: 1-dimensional
//
/* ****** ****** */

function
XATS2JS_a1ptr_alloc
  (asz)
{
  return new Array(asz);
}

/* ****** ****** */

function
XATS2JS_a1ref_get_at
  (A0, i0)
{
  return A0[i0];
}
function
XATS2JS_a1ptr_get_at
  (A0, i0)
{
  return A0[i0];
}

/* ****** ****** */

function
XATS2JS_a1ref_set_at
  (A0, i0, x0)
{
  return (A0[i0] = x0);
}
function
XATS2JS_a1ptr_set_at
  (A0, i0, x0)
{
  return (A0[i0] = x0);
}
function
XATS2JS_a1ptr_set_at_raw
  (A0, i0, x0)
{
  return (A0[i0] = x0);
}

/* ****** ****** */
//
// prelude/unsafe.sats
//
/* ****** ****** */
//
function
XATS2JS_UN_p2tr_get
  (ptr)
{
  return XATS2JS_lval_get(ptr);
}
function
XATS2JS_UN_p2tr_set
  (ptr, obj)
{
  XATS2JS_lval_set(ptr, obj); return;
}
//
/* ****** ****** */
// HX-2020-11-09:
// Native arrays for Xats2js
/* ****** ****** */

function
XATS2JS_jsarray_length
  (xs)
{
  return (xs.length);
}

/* ****** ****** */

function
XATS2JS_jsarray_get_at
  (xs, i0)
{
  return xs[i0];
}
function
XATS2JS_jsarray_set_at
  (xs, i0, x0)
{
  return (xs[i0] = x0);
}

/* ****** ****** */

/* end of [XATS2JS_prelude.cats] */
/* ****** ****** */
/*
G_eqref for Xats2js
*/
/* ****** ****** */

function
XATS2JS_g_eqref
  (x1, x2)
{
  return (x1 === x2); 
}
function
XATS2JS_g_neqrf
  (x1, x2)
{
  return (x1 !== x2); 
}

/* ****** ****** */

/* end of [XATS2JS_g_eqref.cats] */
/* ****** ****** */
/*
G_print for Xats2js
*/
/* ****** ****** */
//
var
XATS2JS_the_print_store = [];
//
/* ****** ****** */

function
XATS2JS_g_print(obj)
{
var
rep = obj.toString();
XATS2JS_the_print_store.push(rep);
return; // XATS2JS_g_print
}

/* ****** ****** */
function
XATS2JS_bool_print
  (b0)
{
if(b0)
{
XATS2JS_g_print("true");
}
else
{
XATS2JS_g_print("false");
}
return; // XATS2JS_bool_print
}
/* ****** ****** */
function
XATS2JS_char_print
  (c0)
{
// c0: number
XATS2JS_g_print
(String.fromCharCode(c0));
return; // XATS2JS_char_print
}
/* ****** ****** */
function
XATS2JS_gint_print_sint
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_sint
}
function
XATS2JS_gint_print_uint
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_uint
}
/* ****** ****** */
function
XATS2JS_string_print
  (cs)
{
  return XATS2JS_g_print(cs);
}
/* ****** ****** */

function
XATS2JS_the_print_store_join()
{
var
rep =
XATS2JS_the_print_store.join("");
return rep;
} // XATS2JS_the_print_store_join0
function
XATS2JS_the_print_store_join(sep)
{
var
rep =
XATS2JS_the_print_store.join(sep);
return rep;
} // XATS2JS_the_print_store_join1

/* ****** ****** */

function
XATS2JS_the_print_store_clear()
{
XATS2JS_the_print_store = []; return;
} // XATS2JS_the_print_store_clear

/* ****** ****** */

/* end of [XATS2JS_g_print.cats] */
// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 66(line=6, offs=1) -- 121(line=8, offs=27)
// L1DCLnone1(H0Cnone1(...))

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 200(line=16, offs=1) -- 272(line=22, offs=24)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 276(line=24, offs=1) -- 313(line=24, offs=38)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 348(line=29, offs=1) -- 441(line=37, offs=26)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 450(line=39, offs=1) -- 543(line=47, offs=26)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 547(line=49, offs=1) -- 584(line=50, offs=30)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 585(line=51, offs=1) -- 622(line=52, offs=30)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 729(line=62, offs=1) -- 777(line=64, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 781(line=66, offs=1) -- 829(line=68, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 861(line=72, offs=1) -- 911(line=74, offs=29)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 912(line=75, offs=1) -- 951(line=76, offs=32)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 960(line=78, offs=1) -- 1011(line=80, offs=29)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1012(line=81, offs=1) -- 1053(line=82, offs=34)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1082(line=85, offs=1) -- 1143(line=88, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1144(line=89, offs=1) -- 1181(line=90, offs=30)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1210(line=93, offs=1) -- 1273(line=96, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1274(line=97, offs=1) -- 1315(line=98, offs=34)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1324(line=100, offs=1) -- 1387(line=103, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1388(line=104, offs=1) -- 1429(line=105, offs=34)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1508(line=113, offs=1) -- 1579(line=117, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1580(line=118, offs=1) -- 1627(line=119, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1662(line=124, offs=1) -- 1737(line=128, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1738(line=129, offs=1) -- 1785(line=130, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1820(line=135, offs=1) -- 1893(line=139, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1902(line=141, offs=1) -- 1975(line=145, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1976(line=146, offs=1) -- 2025(line=147, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2026(line=148, offs=1) -- 2075(line=149, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2110(line=154, offs=1) -- 2201(line=160, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2202(line=161, offs=1) -- 2257(line=162, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2269(line=165, offs=1) -- 2360(line=171, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2361(line=172, offs=1) -- 2416(line=173, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2428(line=176, offs=1) -- 2519(line=182, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2520(line=183, offs=1) -- 2575(line=184, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2587(line=187, offs=1) -- 2680(line=193, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2681(line=194, offs=1) -- 2738(line=195, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2750(line=198, offs=1) -- 2843(line=204, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2844(line=205, offs=1) -- 2901(line=206, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2913(line=209, offs=1) -- 3006(line=215, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3007(line=216, offs=1) -- 3064(line=217, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3097(line=222, offs=1) -- 3203(line=229, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3204(line=230, offs=1) -- 3261(line=231, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3294(line=236, offs=1) -- 3388(line=242, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3389(line=243, offs=1) -- 3446(line=244, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3455(line=246, offs=1) -- 3549(line=252, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3550(line=253, offs=1) -- 3607(line=254, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3619(line=257, offs=1) -- 3713(line=263, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3714(line=264, offs=1) -- 3771(line=265, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3780(line=267, offs=1) -- 3874(line=273, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3875(line=274, offs=1) -- 3932(line=275, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3941(line=277, offs=1) -- 4038(line=283, offs=39)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4039(line=284, offs=1) -- 4096(line=285, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4178(line=294, offs=1) -- 4232(line=296, offs=31)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4233(line=297, offs=1) -- 4276(line=298, offs=36)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4311(line=303, offs=1) -- 4369(line=305, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4370(line=306, offs=1) -- 4417(line=307, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4429(line=310, offs=1) -- 4487(line=312, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4488(line=313, offs=1) -- 4535(line=314, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4570(line=319, offs=1) -- 4629(line=321, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4630(line=322, offs=1) -- 4679(line=323, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4688(line=325, offs=1) -- 4747(line=327, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4748(line=328, offs=1) -- 4797(line=329, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4832(line=334, offs=1) -- 4902(line=336, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4911(line=338, offs=1) -- 4981(line=340, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4990(line=342, offs=1) -- 5060(line=344, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5069(line=346, offs=1) -- 5140(line=348, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5149(line=350, offs=1) -- 5220(line=352, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5229(line=354, offs=1) -- 5300(line=356, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5304(line=358, offs=1) -- 5359(line=359, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5360(line=360, offs=1) -- 5415(line=361, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5416(line=362, offs=1) -- 5471(line=363, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5472(line=364, offs=1) -- 5529(line=365, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5530(line=366, offs=1) -- 5587(line=367, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5588(line=368, offs=1) -- 5645(line=369, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5680(line=374, offs=1) -- 5751(line=376, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5752(line=377, offs=1) -- 5809(line=378, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5844(line=383, offs=1) -- 5915(line=385, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5924(line=387, offs=1) -- 5995(line=389, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6004(line=391, offs=1) -- 6075(line=393, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6084(line=395, offs=1) -- 6155(line=397, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6159(line=399, offs=1) -- 6216(line=400, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6217(line=401, offs=1) -- 6274(line=402, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6275(line=403, offs=1) -- 6332(line=404, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6333(line=405, offs=1) -- 6390(line=406, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6472(line=415, offs=1) -- 6522(line=417, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6531(line=419, offs=1) -- 6587(line=421, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6591(line=423, offs=1) -- 6630(line=424, offs=32)
function
XATS2JS_optn_nil()
{
let xtmp0;
{
xtmp0 = [0];
}
;
return xtmp0;
} // function // XATS2JS_optn_nil(83)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6631(line=425, offs=1) -- 6676(line=426, offs=38)
function
XATS2JS_optn_cons(a1x1)
{
let xtmp2;
;
{
xtmp2 = [1, a1x1];
}
;
return xtmp2;
} // function // XATS2JS_optn_cons(84)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6758(line=435, offs=1) -- 6819(line=438, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6828(line=440, offs=1) -- 6900(line=444, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6901(line=445, offs=1) -- 6948(line=446, offs=40)
function
XATS2JS_list_nil()
{
let xtmp3;
{
xtmp3 = [0];
}
;
return xtmp3;
} // function // XATS2JS_list_nil(85)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6949(line=447, offs=1) -- 7002(line=448, offs=46)
function
XATS2JS_list_cons(a1x1, a1x2)
{
let xtmp6;
;
;
{
xtmp6 = [1, a1x1, a1x2];
}
;
return xtmp6;
} // function // XATS2JS_list_cons(86)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7075(line=455, offs=1) -- 7195(line=465, offs=20)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7217(line=468, offs=1) -- 7334(line=477, offs=20)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7335(line=478, offs=1) -- 7455(line=487, offs=21)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7477(line=490, offs=1) -- 7599(line=500, offs=18)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7600(line=501, offs=1) -- 7722(line=511, offs=18)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7723(line=512, offs=1) -- 7845(line=522, offs=18)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7866(line=524, offs=1) -- 7991(line=534, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7992(line=535, offs=1) -- 8117(line=545, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8118(line=546, offs=1) -- 8243(line=556, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8264(line=558, offs=1) -- 8389(line=568, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8410(line=570, offs=1) -- 8538(line=579, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8559(line=581, offs=1) -- 8687(line=590, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8708(line=592, offs=1) -- 8838(line=601, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8859(line=603, offs=1) -- 9001(line=614, offs=22)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 9022(line=616, offs=1) -- 9238(line=631, offs=8)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 9285(line=633, offs=1) -- 9419(line=642, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 9440(line=644, offs=1) -- 9594(line=654, offs=25)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 9615(line=656, offs=1) -- 9826(line=670, offs=8)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 9877(line=672, offs=1) -- 10088(line=686, offs=8)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10378(line=705, offs=1) -- 10440(line=710, offs=25)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10441(line=711, offs=1) -- 10492(line=713, offs=35)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10521(line=716, offs=1) -- 10590(line=721, offs=26)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10591(line=722, offs=1) -- 10644(line=724, offs=37)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10673(line=727, offs=1) -- 10736(line=731, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10737(line=732, offs=1) -- 10786(line=734, offs=33)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10815(line=737, offs=1) -- 10890(line=742, offs=31)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 10891(line=743, offs=1) -- 10940(line=745, offs=33)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11016(line=752, offs=1) -- 11105(line=758, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11106(line=759, offs=1) -- 11159(line=761, offs=37)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11191(line=765, offs=1) -- 11282(line=771, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11283(line=772, offs=1) -- 11338(line=774, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11350(line=777, offs=1) -- 11441(line=783, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11442(line=784, offs=1) -- 11497(line=786, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11532(line=791, offs=1) -- 11640(line=798, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11641(line=799, offs=1) -- 11696(line=801, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11708(line=804, offs=1) -- 11816(line=811, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11817(line=812, offs=1) -- 11872(line=814, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 11907(line=819, offs=1) -- 12020(line=826, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 12021(line=827, offs=1) -- 12084(line=829, offs=47)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 67(line=6, offs=1) -- 122(line=8, offs=27)
// L1DCLnone1(H0Cnone1(...))

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 143(line=10, offs=1) -- 183(line=11, offs=27)
// L1DCLnone1(H0Cnone1(...))

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 184(line=12, offs=1) -- 227(line=13, offs=30)
// L1DCLnone1(H0Cnone1(...))

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 385(line=25, offs=1) -- 453(line=30, offs=24)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 462(line=32, offs=1) -- 534(line=37, offs=27)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 543(line=39, offs=1) -- 617(line=44, offs=27)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 621(line=46, offs=1) -- 666(line=47, offs=38)
function
XATS2JS_lazy_cfr(a1x1)
{
let xtmp1;
let xtmp3;
;
xtmp3 =
function()
{
let xtmp2;
{
xtmp2 = a1x1();
}
;
return xtmp2;
} // lam-function
;
xtmp1 = XATS2JS_new_lazy(xtmp3);
return xtmp1;
} // function // XATS2JS_lazy_cfr(0)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 667(line=48, offs=1) -- 714(line=49, offs=40)
function
XATS2JS_llazy_cfr(a1x1)
{
let xtmp5;
let xtmp7;
let xtmp8;
;
xtmp7 =
function()
{
let xtmp6;
{
xtmp6 = a1x1();
}
;
return xtmp6;
} // lam-function
;
xtmp8 =
function()
{
let xtmp6;
} // lam-function
;
xtmp5 = XATS2JS_new_llazy(xtmp7,xtmp8);
return xtmp5;
} // function // XATS2JS_llazy_cfr(1)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 715(line=50, offs=1) -- 764(line=51, offs=42)
function
XATS2JS_lazy_vt_cfr(a1x1)
{
let xtmp10;
let xtmp12;
let xtmp13;
;
xtmp12 =
function()
{
let xtmp11;
{
xtmp11 = a1x1();
}
;
return xtmp11;
} // lam-function
;
xtmp13 =
function()
{
let xtmp11;
} // lam-function
;
xtmp10 = XATS2JS_new_llazy(xtmp12,xtmp13);
return xtmp10;
} // function // XATS2JS_lazy_vt_cfr(2)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 846(line=60, offs=1) -- 896(line=62, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 905(line=64, offs=1) -- 961(line=66, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 965(line=68, offs=1) -- 1004(line=69, offs=32)
function
XATS2JS_optn_nil()
{
let xtmp14;
{
xtmp14 = [0];
}
;
return xtmp14;
} // function // XATS2JS_optn_nil(3)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1005(line=70, offs=1) -- 1050(line=71, offs=38)
function
XATS2JS_optn_cons(a1x1)
{
let xtmp16;
;
{
xtmp16 = [1, a1x1];
}
;
return xtmp16;
} // function // XATS2JS_optn_cons(4)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1132(line=80, offs=1) -- 1193(line=83, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1202(line=85, offs=1) -- 1274(line=89, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1278(line=91, offs=1) -- 1325(line=92, offs=40)
function
XATS2JS_list_nil()
{
let xtmp17;
{
xtmp17 = [0];
}
;
return xtmp17;
} // function // XATS2JS_list_nil(5)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1326(line=93, offs=1) -- 1379(line=94, offs=46)
function
XATS2JS_list_cons(a1x1, a1x2)
{
let xtmp20;
;
;
{
xtmp20 = [1, a1x1, a1x2];
}
;
return xtmp20;
} // function // XATS2JS_list_cons(6)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1463(line=103, offs=1) -- 1530(line=106, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1539(line=108, offs=1) -- 1619(line=112, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1623(line=114, offs=1) -- 1676(line=115, offs=46)
function
XATS2JS_strmcon_nil()
{
let xtmp21;
{
xtmp21 = [0];
}
;
return xtmp21;
} // function // XATS2JS_strmcon_nil(7)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1677(line=116, offs=1) -- 1736(line=117, offs=52)
function
XATS2JS_strmcon_cons(a1x1, a1x2)
{
let xtmp24;
;
;
{
xtmp24 = [1, a1x1, a1x2];
}
;
return xtmp24;
} // function // XATS2JS_strmcon_cons(8)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2127(line=147, offs=1) -- 2183(line=149, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2192(line=151, offs=1) -- 2254(line=153, offs=38)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2258(line=155, offs=1) -- 2303(line=156, offs=38)
function
XATS2JS_optn_vt_nil()
{
let xtmp25;
{
xtmp25 = [0];
}
;
return xtmp25;
} // function // XATS2JS_optn_vt_nil(9)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2304(line=157, offs=1) -- 2355(line=158, offs=44)
function
XATS2JS_optn_vt_cons(a1x1)
{
let xtmp27;
;
{
xtmp27 = [1, a1x1];
}
;
return xtmp27;
} // function // XATS2JS_optn_vt_cons(10)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2437(line=167, offs=1) -- 2504(line=170, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2513(line=172, offs=1) -- 2594(line=176, offs=42)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2598(line=178, offs=1) -- 2651(line=179, offs=46)
function
XATS2JS_list_vt_nil()
{
let xtmp28;
{
xtmp28 = [0];
}
;
return xtmp28;
} // function // XATS2JS_list_vt_nil(11)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2652(line=180, offs=1) -- 2711(line=181, offs=52)
function
XATS2JS_list_vt_cons(a1x1, a1x2)
{
let xtmp31;
;
;
{
xtmp31 = [1, a1x1, a1x2];
}
;
return xtmp31;
} // function // XATS2JS_list_vt_cons(12)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3131(line=211, offs=1) -- 3204(line=214, offs=40)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3213(line=216, offs=1) -- 3302(line=220, offs=47)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3306(line=222, offs=1) -- 3365(line=223, offs=52)
function
XATS2JS_strmcon_vt_nil()
{
let xtmp32;
{
xtmp32 = [0];
}
;
return xtmp32;
} // function // XATS2JS_strmcon_vt_nil(13)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3366(line=224, offs=1) -- 3431(line=225, offs=58)
function
XATS2JS_strmcon_vt_cons(a1x1, a1x2)
{
let xtmp35;
;
;
{
xtmp35 = [1, a1x1, a1x2];
}
;
return xtmp35;
} // function // XATS2JS_strmcon_vt_cons(14)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3464(line=230, offs=1) -- 3612(line=238, offs=47)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3613(line=239, offs=1) -- 3764(line=245, offs=8)
function
XATS2JS_stream_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp39;
let xtmp40;
let xtmp41;
let xtmp42;
let xtmp43;
;
;
;
xtmp40 = XATS2JS_llazy_eval(a1x1);
{
xtmp41 = 0;
do {
do {
if(0!==xtmp40[0]) break;
xtmp41 = 1;
} while(false);
if(xtmp41 > 0 ) break;
do {
if(1!==xtmp40[0]) break;
//L1PCKany();
//L1PCKany();
xtmp41 = 2;
} while(false);
if(xtmp41 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp41) {
case 1:
{
xtmp39 = a1x2();
}
;
break;
case 2:
xtmp42 = xtmp40[1];
xtmp43 = xtmp40[2];
{
xtmp39 = a1x3(xtmp42, xtmp43);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp39;
} // function // XATS2JS_stream_vt_uncons_cfr(15)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3839(line=250, offs=1) -- 3954(line=255, offs=49)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3955(line=256, offs=1) -- 4089(line=266, offs=8)
function
XATS2JS_stream_vt_map0_cfr(a1x1, a1x2)
{
let xtmp46;
;
;
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4049(line=264, offs=1) -- 4087(line=265, offs=31)
// L1DCLnone0();
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 8330(line=676, offs=1) -- 8654(line=708, offs=8)
function
stream_vt_map0_3664_(a2x1)
{
let xtmp64;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 8397(line=684, offs=1) -- 8652(line=707, offs=12)
function
auxmain_8400_(a3x1)
{
let xtmp49;
let xtmp62;
let xtmp63;
;
xtmp62 =
function()
{
let xtmp50;
let xtmp51;
let xtmp52;
let xtmp53;
let xtmp54;
let xtmp55;
let xtmp58;
let xtmp59;
let xtmp60;
xtmp51 = XATS2JS_llazy_eval(a3x1);
{
xtmp52 = 0;
do {
do {
if(0!==xtmp51[0]) break;
xtmp52 = 1;
} while(false);
if(xtmp52 > 0 ) break;
do {
if(1!==xtmp51[0]) break;
//L1PCKany();
//L1PCKany();
xtmp52 = 2;
} while(false);
if(xtmp52 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp52) {
case 1:
{
xtmp50 = [0];
}
;
break;
case 2:
xtmp53 = xtmp51[1];
xtmp54 = xtmp51[2];
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 8576(line=702, offs=3) -- 8608(line=703, offs=24)
{
{
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4049(line=264, offs=1) -- 4087(line=265, offs=31)
function
map0$fopr_2343_(a5x1)
{
let xtmp57;
;
{
xtmp57 = a1x2(a5x1);
}
;
return xtmp57;
} // function // map0$fopr(17)
;
xtmp55 = map0$fopr_2343_(xtmp53);
}
;
;
} // val(H0Pvar(y0(55)))
;
{
{
xtmp59 = auxmain_8400_(xtmp54);
}
;
xtmp58 = [1, xtmp55, xtmp59];
}
;
xtmp50 = xtmp58;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp50;
} // lam-function
;
xtmp63 =
function()
{
let xtmp50;
let xtmp51;
let xtmp52;
let xtmp53;
let xtmp54;
let xtmp55;
let xtmp58;
let xtmp59;
let xtmp60;
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1554(line=120, offs=1) -- 1609(line=122, offs=41)
// { // val-binding
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1501(line=116, offs=1) -- 1550(line=118, offs=31)
function
stream_vt_free_1971_(a6x1)
{
;
return XATS2JS_llazy_free(a6x1);
} // function // stream_vt_free(21)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_1971_
;
xtmp60 = g_free_1550_(a3x1);
}
;
} // lam-function
;
xtmp49 = XATS2JS_new_llazy(xtmp62,xtmp63);
return xtmp49;
} // function // auxmain(19)
;
{
xtmp64 = auxmain_8400_(a2x1);
}
;
return xtmp64;
} // function // stream_vt_map0(18)
;
xtmp46 = stream_vt_map0_3664_(a1x1);
}
;
return xtmp46;
} // function // XATS2JS_stream_vt_map0_cfr(16)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4120(line=271, offs=1) -- 4232(line=275, offs=51)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4233(line=276, offs=1) -- 4367(line=285, offs=8)
function
XATS2JS_stream_vt_filter0_cfr(a1x1, a1x2)
{
let xtmp67;
;
;
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4326(line=283, offs=3) -- 4365(line=284, offs=32)
// L1DCLnone0();
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 8707(line=712, offs=1) -- 9148(line=752, offs=8)
function
stream_vt_filter0_3794_(a2x1)
{
let xtmp85;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 8780(line=720, offs=1) -- 9146(line=751, offs=8)
function
auxmain_8783_(a3x1)
{
let a3y1;
let xtmp70;
let xtmp74;
let xtmp75;
do {
;
xtmp74 =
function()
{
let xtmp71;
let xtmp72;
{
xtmp71 = auxloop_8877_(XATS2JS_llazy_eval(a3x1));
}
;
return xtmp71;
} // lam-function
;
xtmp75 =
function()
{
let xtmp71;
let xtmp72;
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1554(line=120, offs=1) -- 1609(line=122, offs=41)
// { // val-binding
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1501(line=116, offs=1) -- 1550(line=118, offs=31)
function
stream_vt_free_1971_(a6x1)
{
;
return XATS2JS_llazy_free(a6x1);
} // function // stream_vt_free(21)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_1971_
;
xtmp72 = g_free_1550_(a3x1);
}
;
} // lam-function
;
xtmp70 = XATS2JS_new_llazy(xtmp74,xtmp75);
break;//return
} while( true );
return xtmp70;
} // function // auxmain(25)
function
auxloop_8877_(a3x1)
{
let a3y1;
let xtmp77;
let xtmp78;
let xtmp79;
let xtmp80;
let xtmp81;
let xtmp84;
do {
;
{
xtmp78 = 0;
do {
do {
if(0!==a3x1[0]) break;
xtmp78 = 1;
} while(false);
if(xtmp78 > 0 ) break;
do {
if(1!==a3x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp78 = 2;
} while(false);
if(xtmp78 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp78) {
case 1:
{
xtmp77 = [0];
}
;
break;
case 2:
xtmp79 = a3x1[1];
xtmp80 = a3x1[2];
{
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4326(line=283, offs=3) -- 4365(line=284, offs=32)
function
filter0$test_2547_(a4x1)
{
let xtmp83;
;
{
xtmp83 = a1x2(a4x1);
}
;
return xtmp83;
} // function // filter0$test(23)
;
xtmp81 = filter0$test_2547_(xtmp79);
}
;
if
(xtmp81)
// then
{
{
{
xtmp84 = auxmain_8783_(xtmp80);
}
;
xtmp77 = [1, xtmp79, xtmp84];
}
;
} // if-then
else
{
{
// tail-recursion:
// L1CMDapp(tmp(77); L1VALfcst(auxloop(26)); L1VALeval3(L1VALtmp(tmp(80))))
a3y1 = XATS2JS_llazy_eval(xtmp80); a3x1 = a3y1; continue;
}
;
} // if-else
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp77;
} // function // auxloop(26)
;
{
xtmp85 = auxmain_8783_(a2x1);
}
;
return xtmp85;
} // function // stream_vt_filter0(24)
;
xtmp67 = stream_vt_filter0_3794_(a1x1);
}
;
return xtmp67;
} // function // XATS2JS_stream_vt_filter0_cfr(22)


