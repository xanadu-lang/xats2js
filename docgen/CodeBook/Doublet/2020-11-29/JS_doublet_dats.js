function
JS_doublet_word1()
{
    return document.getElementById("JS_doublet_word1").value;
}
function
JS_doublet_word2()
{
    return document.getElementById("JS_doublet_word2").value;
}
function
JS_doublet_dict()
{
    return document.getElementById("JS_doublet_dict").innerText;
}

function
JS_doublet_call()
{
//
ATS_doublet_call();
//
let output =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
alert(output);
JS_doublet_output.innerHTML = output;
}
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
XATS2JS_gflt_print_sflt
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_sflt
}
function
XATS2JS_gflt_print_dflt
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_dflt
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
} // XATS2JS_the_print_store_join

/* ****** ****** */

function
XATS2JS_the_print_store_clear()
{
XATS2JS_the_print_store = []; return;
} // XATS2JS_the_print_store_clear

/* ****** ****** */

/* end of [XATS2JS_g_print.cats] */
/* ****** ****** */
/*
JSBasics for Xats2js
*/
/* ****** ****** */
// HX-2020-11-09:
// Native arrays for Xats2js
/* ****** ****** */

function
XATS2JS_jsarray_size
  (xs)
{
  return ( xs.length );
}
function
XATS2JS_jsarray_length
  (xs)
{
  return ( xs.length );
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
  return ( xs[i0] = x0 );
}

/* ****** ****** */
//
// HX-2020-11-28:
// Native objmaps for Xats2js
//
/* ****** ****** */

function
XATS2JS_jsobjmap_keys
   (obj)
{
return Object.keys(obj);
} // XATS2JS_jsobjmap_keys

/* ****** ****** */

function
XATS2JS_jsobjmap_keyq
   (obj, key)
{
return obj.hasOwnProperty(key);
} // XATS2JS_jsobjmap_keyq

/* ****** ****** */

function
XATS2JS_jsobjmap_make_nil
  ()
{
  return {} ;
} // XATS2JS_jsobjmap_make_nil

/* ****** ****** */

function
XATS2JS_jsobjmap_search_opt
   (obj, key)
{
//
let itm0 = obj[key];
//
if(itm0===undefined)
{
  return XATS2JS_optn_vt_nil();
} else {
  return XATS2JS_optn_vt_cons(itm0);
} // end of [if]
//
} // [ XATS2JS_jsobjmap_search_opt ]

/* ****** ****** */

function
XATS2JS_jsobjmap_insert_any
   (obj, key, itm1)
{
  obj[key] = itm1; return;
} // [XATS2JS_jsobjmap_insert_any]

function
XATS2JS_jsobjmap_remove_any
   (obj, key)
{
  delete object[key]; return ;
} // [XATS2JS_jsobjmap_remove_any]

/* ****** ****** */

function
XATS2JS_jsobjmap_insert_opt
   (obj, key, itm1)
{
//
let itm0 = obj[key];
//
if(itm0===undefined)
{
  obj[key] = itm1;
  return XATS2JS_optn_vt_nil();
} else {
  obj[key] = itm1;
  return XATS2JS_optn_vt_cons(itm0);
} // end of [if]
//
} // [ XATS2JS_jsobjmap_insert_opt ]

function
XATS2JS_jsobjmap_remove_opt
   (obj, key)
{
//
let itm0 = obj[key];
//
if(itm0===undefined)
{
  return XATS2JS_optn_vt_nil();
} else {
  delete object[key];
  return XATS2JS_optn_vt_cons(itm0);
} // end of [if]
//
} // [ XATS2JS_jsobjmap_remove_opt ]

/* ****** ****** */

/* end of [XATS2JS_jsbasics.cats] */
// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 105(line=8, offs=1) -- 160(line=10, offs=27)
// L1DCLnone1(H0Cnone1(...))

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 239(line=18, offs=1) -- 311(line=24, offs=24)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 315(line=26, offs=1) -- 352(line=26, offs=38)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 387(line=31, offs=1) -- 480(line=39, offs=26)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 489(line=41, offs=1) -- 582(line=49, offs=26)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 586(line=51, offs=1) -- 623(line=52, offs=30)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 624(line=53, offs=1) -- 661(line=54, offs=30)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 768(line=64, offs=1) -- 816(line=66, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 820(line=68, offs=1) -- 868(line=70, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 900(line=74, offs=1) -- 950(line=76, offs=29)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 951(line=77, offs=1) -- 990(line=78, offs=32)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 999(line=80, offs=1) -- 1050(line=82, offs=29)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1051(line=83, offs=1) -- 1092(line=84, offs=34)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1121(line=87, offs=1) -- 1182(line=90, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1183(line=91, offs=1) -- 1220(line=92, offs=30)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1249(line=95, offs=1) -- 1312(line=98, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1313(line=99, offs=1) -- 1354(line=100, offs=34)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1363(line=102, offs=1) -- 1426(line=105, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1427(line=106, offs=1) -- 1468(line=107, offs=34)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1547(line=115, offs=1) -- 1618(line=119, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1619(line=120, offs=1) -- 1666(line=121, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1701(line=126, offs=1) -- 1776(line=130, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1777(line=131, offs=1) -- 1824(line=132, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1859(line=137, offs=1) -- 1932(line=141, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1941(line=143, offs=1) -- 2014(line=147, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2065(line=150, offs=1) -- 2114(line=151, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2149(line=156, offs=1) -- 2240(line=162, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2241(line=163, offs=1) -- 2296(line=164, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2308(line=167, offs=1) -- 2399(line=173, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2400(line=174, offs=1) -- 2455(line=175, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2467(line=178, offs=1) -- 2558(line=184, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2559(line=185, offs=1) -- 2614(line=186, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2626(line=189, offs=1) -- 2719(line=195, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2720(line=196, offs=1) -- 2777(line=197, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2789(line=200, offs=1) -- 2882(line=206, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2883(line=207, offs=1) -- 2940(line=208, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2952(line=211, offs=1) -- 3045(line=217, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3046(line=218, offs=1) -- 3103(line=219, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3136(line=224, offs=1) -- 3242(line=231, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3243(line=232, offs=1) -- 3300(line=233, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3333(line=238, offs=1) -- 3427(line=244, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3428(line=245, offs=1) -- 3485(line=246, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3494(line=248, offs=1) -- 3588(line=254, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3589(line=255, offs=1) -- 3646(line=256, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3658(line=259, offs=1) -- 3752(line=265, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3753(line=266, offs=1) -- 3810(line=267, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3819(line=269, offs=1) -- 3913(line=275, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3914(line=276, offs=1) -- 3971(line=277, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3980(line=279, offs=1) -- 4077(line=285, offs=39)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4078(line=286, offs=1) -- 4135(line=287, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4217(line=296, offs=1) -- 4271(line=298, offs=31)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4272(line=299, offs=1) -- 4315(line=300, offs=36)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4350(line=305, offs=1) -- 4408(line=307, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4409(line=308, offs=1) -- 4456(line=309, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4468(line=312, offs=1) -- 4526(line=314, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4527(line=315, offs=1) -- 4574(line=316, offs=40)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4609(line=321, offs=1) -- 4668(line=323, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4669(line=324, offs=1) -- 4718(line=325, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4727(line=327, offs=1) -- 4786(line=329, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4787(line=330, offs=1) -- 4836(line=331, offs=42)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4871(line=336, offs=1) -- 4941(line=338, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 4950(line=340, offs=1) -- 5020(line=342, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5029(line=344, offs=1) -- 5099(line=346, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5108(line=348, offs=1) -- 5179(line=350, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5188(line=352, offs=1) -- 5259(line=354, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5268(line=356, offs=1) -- 5339(line=358, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5343(line=360, offs=1) -- 5398(line=361, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5399(line=362, offs=1) -- 5454(line=363, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5455(line=364, offs=1) -- 5510(line=365, offs=48)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5511(line=366, offs=1) -- 5568(line=367, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5569(line=368, offs=1) -- 5626(line=369, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5627(line=370, offs=1) -- 5684(line=371, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5719(line=376, offs=1) -- 5790(line=378, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5791(line=379, offs=1) -- 5848(line=380, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5883(line=385, offs=1) -- 5954(line=387, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 5963(line=389, offs=1) -- 6034(line=391, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6043(line=393, offs=1) -- 6114(line=395, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6123(line=397, offs=1) -- 6194(line=399, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6198(line=401, offs=1) -- 6255(line=402, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6256(line=403, offs=1) -- 6313(line=404, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6314(line=405, offs=1) -- 6371(line=406, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6372(line=407, offs=1) -- 6429(line=408, offs=50)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6502(line=415, offs=1) -- 6622(line=425, offs=20)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6644(line=428, offs=1) -- 6761(line=437, offs=20)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6762(line=438, offs=1) -- 6882(line=447, offs=21)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6904(line=450, offs=1) -- 7026(line=460, offs=18)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7027(line=461, offs=1) -- 7149(line=471, offs=18)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7150(line=472, offs=1) -- 7272(line=482, offs=18)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7293(line=484, offs=1) -- 7418(line=494, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7419(line=495, offs=1) -- 7544(line=505, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7545(line=506, offs=1) -- 7670(line=516, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7691(line=518, offs=1) -- 7816(line=528, offs=19)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7837(line=530, offs=1) -- 7965(line=539, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7986(line=541, offs=1) -- 8114(line=550, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8135(line=552, offs=1) -- 8265(line=561, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8286(line=563, offs=1) -- 8428(line=574, offs=22)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8449(line=576, offs=1) -- 8665(line=591, offs=8)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8712(line=593, offs=1) -- 8846(line=602, offs=24)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8867(line=604, offs=1) -- 9021(line=614, offs=25)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 9042(line=616, offs=1) -- 9253(line=630, offs=8)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/basics.dats: 9304(line=632, offs=1) -- 9515(line=646, offs=8)
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


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1082(line=75, offs=1) -- 1193(line=81, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1194(line=82, offs=1) -- 1310(line=88, offs=8)
function
XATS2JS_optn_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp20;
let xtmp21;
let xtmp22;
;
;
;
{
xtmp21 = 0;
do {
do {
if(0!==L1VALeval0(L1VALtmp(arg[1](17)))[0]) break;
xtmp21 = 1;
} while(false);
if(xtmp21 > 0 ) break;
do {
if(1!==L1VALeval0(L1VALtmp(arg[1](17)))[0]) break;
//L1PCKany();
xtmp21 = 2;
} while(false);
if(xtmp21 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp21) {
case 1:
{
xtmp20 = a1x2();
}
;
break;
case 2:
xtmp22 = L1VALeval0(L1VALtmp(arg[1](17)))[1];
{
xtmp20 = a1x3(xtmp22);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp20;
} // function // XATS2JS_optn_uncons_cfr(5)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1428(line=96, offs=1) -- 1489(line=99, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1498(line=101, offs=1) -- 1570(line=105, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1574(line=107, offs=1) -- 1621(line=108, offs=40)
function
XATS2JS_list_nil()
{
let xtmp23;
{
xtmp23 = [0];
}
;
return xtmp23;
} // function // XATS2JS_list_nil(6)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1622(line=109, offs=1) -- 1675(line=110, offs=46)
function
XATS2JS_list_cons(a1x1, a1x2)
{
let xtmp26;
;
;
{
xtmp26 = [1, a1x1, a1x2];
}
;
return xtmp26;
} // function // XATS2JS_list_cons(7)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1707(line=114, offs=1) -- 1838(line=122, offs=42)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 1839(line=123, offs=1) -- 1963(line=129, offs=8)
function
XATS2JS_list_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp30;
let xtmp31;
let xtmp32;
let xtmp33;
;
;
;
{
xtmp31 = 0;
do {
do {
if(0!==L1VALeval0(L1VALtmp(arg[1](27)))[0]) break;
xtmp31 = 1;
} while(false);
if(xtmp31 > 0 ) break;
do {
if(1!==L1VALeval0(L1VALtmp(arg[1](27)))[0]) break;
//L1PCKany();
//L1PCKany();
xtmp31 = 2;
} while(false);
if(xtmp31 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp31) {
case 1:
{
xtmp30 = a1x2();
}
;
break;
case 2:
xtmp32 = L1VALeval0(L1VALtmp(arg[1](27)))[1];
xtmp33 = L1VALeval0(L1VALtmp(arg[1](27)))[2];
{
xtmp30 = a1x3(xtmp32, xtmp33);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp30;
} // function // XATS2JS_list_uncons_cfr(8)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2083(line=137, offs=1) -- 2150(line=140, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2159(line=142, offs=1) -- 2239(line=146, offs=41)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2243(line=148, offs=1) -- 2296(line=149, offs=46)
function
XATS2JS_strmcon_nil()
{
let xtmp34;
{
xtmp34 = [0];
}
;
return xtmp34;
} // function // XATS2JS_strmcon_nil(9)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2297(line=150, offs=1) -- 2356(line=151, offs=52)
function
XATS2JS_strmcon_cons(a1x1, a1x2)
{
let xtmp37;
;
;
{
xtmp37 = [1, a1x1, a1x2];
}
;
return xtmp37;
} // function // XATS2JS_strmcon_cons(10)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2694(line=176, offs=1) -- 2831(line=184, offs=44)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 2832(line=185, offs=1) -- 2972(line=191, offs=8)
function
XATS2JS_stream_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp41;
let xtmp42;
let xtmp43;
let xtmp44;
let xtmp45;
;
;
;
xtmp42 = XATS2JS_lazy_eval(a1x1);
{
xtmp43 = 0;
do {
do {
if(0!==xtmp42[0]) break;
xtmp43 = 1;
} while(false);
if(xtmp43 > 0 ) break;
do {
if(1!==xtmp42[0]) break;
//L1PCKany();
//L1PCKany();
xtmp43 = 2;
} while(false);
if(xtmp43 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp43) {
case 1:
{
xtmp41 = a1x2();
}
;
break;
case 2:
xtmp44 = xtmp42[1];
xtmp45 = xtmp42[2];
{
xtmp41 = a1x3(xtmp44, xtmp45);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp41;
} // function // XATS2JS_stream_uncons_cfr(11)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3042(line=194, offs=1) -- 3153(line=200, offs=44)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3154(line=201, offs=1) -- 3256(line=206, offs=8)
function
XATS2JS_streax_uncons_cfr(a1x1, a1x2)
{
let xtmp48;
let xtmp49;
let xtmp50;
let xtmp51;
let xtmp52;
;
;
xtmp49 = XATS2JS_lazy_eval(a1x1);
{
xtmp50 = 0;
do {
do {
if(0!==xtmp49[0]) break;
//L1PCKany();
//L1PCKany();
xtmp50 = 1;
} while(false);
if(xtmp50 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp50) {
case 1:
xtmp51 = xtmp49[1];
xtmp52 = xtmp49[2];
{
xtmp48 = a1x2(xtmp51, xtmp52);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp48;
} // function // XATS2JS_streax_uncons_cfr(12)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3379(line=214, offs=1) -- 3435(line=216, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3444(line=218, offs=1) -- 3506(line=220, offs=38)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3510(line=222, offs=1) -- 3555(line=223, offs=38)
function
XATS2JS_optn_vt_nil()
{
let xtmp53;
{
xtmp53 = [0];
}
;
return xtmp53;
} // function // XATS2JS_optn_vt_nil(13)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3556(line=224, offs=1) -- 3607(line=225, offs=44)
function
XATS2JS_optn_vt_cons(a1x1)
{
let xtmp55;
;
{
xtmp55 = [1, a1x1];
}
;
return xtmp55;
} // function // XATS2JS_optn_vt_cons(14)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3639(line=229, offs=1) -- 3756(line=235, offs=36)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 3757(line=236, offs=1) -- 3884(line=242, offs=8)
function
XATS2JS_optn_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp59;
let xtmp60;
let xtmp61;
;
;
;
{
xtmp60 = 0;
do {
do {
if(0!==L1VALeval0(L1VALtmp(arg[1](56)))[0]) break;
xtmp60 = 1;
} while(false);
if(xtmp60 > 0 ) break;
do {
if(1!==L1VALeval0(L1VALtmp(arg[1](56)))[0]) break;
//L1PCKany();
xtmp60 = 2;
} while(false);
if(xtmp60 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp60) {
case 1:
{
xtmp59 = a1x2();
}
;
break;
case 2:
xtmp61 = L1VALeval0(L1VALtmp(arg[1](56)))[1];
{
xtmp59 = a1x3(xtmp61);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp59;
} // function // XATS2JS_optn_vt_uncons_cfr(15)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4008(line=250, offs=1) -- 4075(line=253, offs=37)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4084(line=255, offs=1) -- 4165(line=259, offs=42)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4169(line=261, offs=1) -- 4222(line=262, offs=46)
function
XATS2JS_list_vt_nil()
{
let xtmp62;
{
xtmp62 = [0];
}
;
return xtmp62;
} // function // XATS2JS_list_vt_nil(16)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4223(line=263, offs=1) -- 4282(line=264, offs=52)
function
XATS2JS_list_vt_cons(a1x1, a1x2)
{
let xtmp65;
;
;
{
xtmp65 = [1, a1x1, a1x2];
}
;
return xtmp65;
} // function // XATS2JS_list_vt_cons(17)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4314(line=268, offs=1) -- 4454(line=276, offs=45)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 4455(line=277, offs=1) -- 4590(line=283, offs=8)
function
XATS2JS_list_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp69;
let xtmp70;
let xtmp71;
let xtmp72;
;
;
;
{
xtmp70 = 0;
do {
do {
if(0!==L1VALeval0(L1VALtmp(arg[1](66)))[0]) break;
xtmp70 = 1;
} while(false);
if(xtmp70 > 0 ) break;
do {
if(1!==L1VALeval0(L1VALtmp(arg[1](66)))[0]) break;
//L1PCKany();
//L1PCKany();
xtmp70 = 2;
} while(false);
if(xtmp70 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp70) {
case 1:
{
xtmp69 = a1x2();
}
;
break;
case 2:
xtmp71 = L1VALeval0(L1VALtmp(arg[1](66)))[1];
xtmp72 = L1VALeval0(L1VALtmp(arg[1](66)))[2];
{
xtmp69 = a1x3(xtmp71, xtmp72);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp69;
} // function // XATS2JS_list_vt_uncons_cfr(18)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5049(line=312, offs=1) -- 5122(line=315, offs=40)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5131(line=317, offs=1) -- 5220(line=321, offs=47)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5224(line=323, offs=1) -- 5283(line=324, offs=52)
function
XATS2JS_strmcon_vt_nil()
{
let xtmp73;
{
xtmp73 = [0];
}
;
return xtmp73;
} // function // XATS2JS_strmcon_vt_nil(19)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5284(line=325, offs=1) -- 5349(line=326, offs=58)
function
XATS2JS_strmcon_vt_cons(a1x1, a1x2)
{
let xtmp76;
;
;
{
xtmp76 = [1, a1x1, a1x2];
}
;
return xtmp76;
} // function // XATS2JS_strmcon_vt_cons(20)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5381(line=330, offs=1) -- 5527(line=338, offs=47)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5528(line=339, offs=1) -- 5679(line=345, offs=8)
function
XATS2JS_stream_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp80;
let xtmp81;
let xtmp82;
let xtmp83;
let xtmp84;
;
;
;
xtmp81 = XATS2JS_llazy_eval(a1x1);
{
xtmp82 = 0;
do {
do {
if(0!==xtmp81[0]) break;
xtmp82 = 1;
} while(false);
if(xtmp82 > 0 ) break;
do {
if(1!==xtmp81[0]) break;
//L1PCKany();
//L1PCKany();
xtmp82 = 2;
} while(false);
if(xtmp82 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp82) {
case 1:
{
xtmp80 = a1x2();
}
;
break;
case 2:
xtmp83 = xtmp81[1];
xtmp84 = xtmp81[2];
{
xtmp80 = a1x3(xtmp83, xtmp84);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp80;
} // function // XATS2JS_stream_vt_uncons_cfr(21)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5752(line=348, offs=1) -- 5872(line=354, offs=47)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 5873(line=355, offs=1) -- 5982(line=360, offs=8)
function
XATS2JS_streax_vt_uncons_cfr(a1x1, a1x2)
{
let xtmp87;
let xtmp88;
let xtmp89;
let xtmp90;
let xtmp91;
;
;
xtmp88 = XATS2JS_llazy_eval(a1x1);
{
xtmp89 = 0;
do {
do {
if(0!==xtmp88[0]) break;
//L1PCKany();
//L1PCKany();
xtmp89 = 1;
} while(false);
if(xtmp89 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp89) {
case 1:
xtmp90 = xtmp88[1];
xtmp91 = xtmp88[2];
{
xtmp87 = a1x2(xtmp90, xtmp91);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp87;
} // function // XATS2JS_streax_vt_uncons_cfr(22)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6056(line=364, offs=1) -- 6171(line=369, offs=49)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6172(line=370, offs=1) -- 6306(line=379, offs=8)
function
XATS2JS_stream_vt_map0_cfr(a1x1, a1x2)
{
let xtmp94;
;
;
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6266(line=378, offs=1) -- 6304(line=378, offs=39)
// L1DCLnone0();
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 9181(line=740, offs=1) -- 9505(line=772, offs=8)
function
stream_vt_map0_4084_(a2x1)
{
let xtmp112;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 9248(line=748, offs=1) -- 9503(line=771, offs=12)
function
auxmain_9251_(a3x1)
{
let xtmp97;
let xtmp110;
let xtmp111;
;
xtmp110 =
function()
{
let xtmp98;
let xtmp99;
let xtmp100;
let xtmp101;
let xtmp102;
let xtmp103;
let xtmp106;
let xtmp107;
let xtmp108;
xtmp99 = XATS2JS_llazy_eval(a3x1);
{
xtmp100 = 0;
do {
do {
if(0!==xtmp99[0]) break;
xtmp100 = 1;
} while(false);
if(xtmp100 > 0 ) break;
do {
if(1!==xtmp99[0]) break;
//L1PCKany();
//L1PCKany();
xtmp100 = 2;
} while(false);
if(xtmp100 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp100) {
case 1:
{
xtmp98 = [0];
}
;
break;
case 2:
xtmp101 = xtmp99[1];
xtmp102 = xtmp99[2];
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 9427(line=766, offs=3) -- 9459(line=767, offs=24)
{
{
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6266(line=378, offs=1) -- 6304(line=378, offs=39)
function
map0$fopr_2343_(a5x1)
{
let xtmp105;
;
{
xtmp105 = a1x2(a5x1);
}
;
return xtmp105;
} // function // map0$fopr(24)
;
xtmp103 = map0$fopr_2343_(xtmp101);
}
;
;
} // val(H0Pvar(y0(95)))
;
{
{
xtmp107 = auxmain_9251_(xtmp102);
}
;
xtmp106 = [1, xtmp103, xtmp107];
}
;
xtmp98 = xtmp106;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp98;
} // lam-function
;
xtmp111 =
function()
{
let xtmp98;
let xtmp99;
let xtmp100;
let xtmp101;
let xtmp102;
let xtmp103;
let xtmp106;
let xtmp107;
let xtmp108;
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a6x1)
{
;
return XATS2JS_llazy_free(a6x1);
} // function // stream_vt_free(28)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp108 = g_free_1550_(a3x1);
}
;
} // lam-function
;
xtmp97 = XATS2JS_new_llazy(xtmp110,xtmp111);
return xtmp97;
} // function // auxmain(26)
;
{
xtmp112 = auxmain_9251_(a2x1);
}
;
return xtmp112;
} // function // stream_vt_map0(25)
;
xtmp94 = stream_vt_map0_4084_(a1x1);
}
;
return xtmp94;
} // function // XATS2JS_stream_vt_map0_cfr(23)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6379(line=384, offs=1) -- 6491(line=388, offs=51)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6492(line=389, offs=1) -- 6624(line=397, offs=8)
function
XATS2JS_stream_vt_filter0_cfr(a1x1, a1x2)
{
let xtmp115;
;
;
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6585(line=396, offs=3) -- 6622(line=396, offs=40)
// L1DCLnone0();
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 9886(line=809, offs=1) -- 10327(line=849, offs=8)
function
stream_vt_filter0_4286_(a2x1)
{
let xtmp133;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 9959(line=817, offs=1) -- 10325(line=848, offs=8)
function
auxmain_9962_(a3x1)
{
let a3y1;
let xtmp118;
let xtmp122;
let xtmp123;
do {
;
xtmp122 =
function()
{
let xtmp119;
let xtmp120;
{
xtmp119 = auxloop_10056_(XATS2JS_llazy_eval(a3x1));
}
;
return xtmp119;
} // lam-function
;
xtmp123 =
function()
{
let xtmp119;
let xtmp120;
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a6x1)
{
;
return XATS2JS_llazy_free(a6x1);
} // function // stream_vt_free(28)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp120 = g_free_1550_(a3x1);
}
;
} // lam-function
;
xtmp118 = XATS2JS_new_llazy(xtmp122,xtmp123);
break;//return
} while( true );
return xtmp118;
} // function // auxmain(32)
function
auxloop_10056_(a3x1)
{
let a3y1;
let xtmp125;
let xtmp126;
let xtmp127;
let xtmp128;
let xtmp129;
let xtmp132;
do {
;
{
xtmp126 = 0;
do {
do {
if(0!==a3x1[0]) break;
xtmp126 = 1;
} while(false);
if(xtmp126 > 0 ) break;
do {
if(1!==a3x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp126 = 2;
} while(false);
if(xtmp126 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp126) {
case 1:
{
xtmp125 = [0];
}
;
break;
case 2:
xtmp127 = a3x1[1];
xtmp128 = a3x1[2];
{
// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6585(line=396, offs=3) -- 6622(line=396, offs=40)
function
filter0$test_2547_(a4x1)
{
let xtmp131;
;
{
xtmp131 = a1x2(a4x1);
}
;
return xtmp131;
} // function // filter0$test(30)
;
xtmp129 = filter0$test_2547_(xtmp127);
}
;
if
(xtmp129)
// then
{
{
{
xtmp132 = auxmain_9962_(xtmp128);
}
;
xtmp125 = [1, xtmp127, xtmp132];
}
;
} // if-then
else
{
{
// tail-recursion:
// L1CMDapp(tmp(125); L1VALfcst(auxloop(33)); L1VALeval3(L1VALtmp(tmp(128))))
a3y1 = XATS2JS_llazy_eval(xtmp128); a3x1 = a3y1; continue;
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
return xtmp125;
} // function // auxloop(33)
;
{
xtmp133 = auxmain_9962_(a2x1);
}
;
return xtmp133;
} // function // stream_vt_filter0(31)
;
xtmp115 = stream_vt_filter0_4286_(a1x1);
}
;
return xtmp115;
} // function // XATS2JS_stream_vt_filter0_cfr(29)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6930(line=417, offs=1) -- 6992(line=422, offs=25)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 6993(line=423, offs=1) -- 7044(line=425, offs=35)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7073(line=428, offs=1) -- 7142(line=433, offs=26)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7143(line=434, offs=1) -- 7196(line=436, offs=37)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7225(line=439, offs=1) -- 7288(line=443, offs=30)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7289(line=444, offs=1) -- 7338(line=446, offs=33)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7367(line=449, offs=1) -- 7442(line=454, offs=31)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7443(line=455, offs=1) -- 7492(line=457, offs=33)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7568(line=464, offs=1) -- 7657(line=470, offs=35)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7658(line=471, offs=1) -- 7711(line=473, offs=37)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7743(line=477, offs=1) -- 7834(line=483, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7835(line=484, offs=1) -- 7890(line=486, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7902(line=489, offs=1) -- 7993(line=495, offs=33)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 7994(line=496, offs=1) -- 8049(line=498, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 8084(line=503, offs=1) -- 8192(line=510, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 8193(line=511, offs=1) -- 8248(line=513, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 8260(line=516, offs=1) -- 8368(line=523, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 8369(line=524, offs=1) -- 8424(line=526, offs=39)
// L1DCLnone0()

// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 8459(line=531, offs=1) -- 8572(line=538, offs=34)


// ./../../xanadu/prelude/DATS/CATS/JS/prelude.dats: 8573(line=539, offs=1) -- 8636(line=541, offs=47)
// L1DCLnone0()

var xtop130;
// ./doublet.dats: 21(line=2, offs=1) -- 73(line=4, offs=29)
// { // include
// ./../../../../share/xats2js_prelude.hats
// ././../../../../share/xats2js_prelude.hats: 114(line=8, offs=1) -- 151(line=8, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 172(line=10, offs=1) -- 209(line=10, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 210(line=11, offs=1) -- 247(line=11, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 268(line=13, offs=1) -- 305(line=13, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 306(line=14, offs=1) -- 343(line=14, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 344(line=15, offs=1) -- 381(line=15, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 402(line=17, offs=1) -- 439(line=17, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 440(line=18, offs=1) -- 477(line=18, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 478(line=19, offs=1) -- 515(line=19, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 516(line=20, offs=1) -- 553(line=20, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 574(line=22, offs=1) -- 612(line=22, offs=39)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 613(line=23, offs=1) -- 652(line=23, offs=40)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 673(line=25, offs=1) -- 710(line=25, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 711(line=26, offs=1) -- 748(line=26, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 749(line=27, offs=1) -- 788(line=27, offs=40)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 809(line=29, offs=1) -- 847(line=29, offs=39)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 868(line=31, offs=1) -- 908(line=31, offs=41)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 929(line=33, offs=1) -- 969(line=33, offs=41)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 970(line=34, offs=1) -- 1010(line=34, offs=41)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1011(line=35, offs=1) -- 1053(line=35, offs=43)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1074(line=37, offs=1) -- 1113(line=37, offs=40)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1134(line=39, offs=1) -- 1175(line=39, offs=42)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1199(line=42, offs=1) -- 1246(line=42, offs=48)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1250(line=44, offs=1) -- 1297(line=44, offs=48)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1301(line=46, offs=1) -- 1349(line=46, offs=49)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1353(line=48, offs=1) -- 1401(line=48, offs=49)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1405(line=50, offs=1) -- 1453(line=50, offs=49)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1457(line=52, offs=1) -- 1506(line=52, offs=50)
// L1DCLnone1(H0Cnone1(...))
// } // end-of-include


// ./doublet.dats: 94(line=6, offs=1) -- 137(line=7, offs=35)
// L1DCLnone1(H0Cnone1(...))

// ./doublet.dats: 158(line=9, offs=1) -- 203(line=10, offs=37)
// L1DCLnone1(H0Cnone1(...))

// ./doublet.dats: 227(line=13, offs=1) -- 248(line=13, offs=22)
// L1DCLnone1(H0Cnone1(...))

// ./doublet.dats: 260(line=16, offs=1) -- 317(line=19, offs=30)


// ./doublet.dats: 346(line=22, offs=1) -- 399(line=24, offs=34)


// ./doublet.dats: 431(line=28, offs=1) -- 514(line=35, offs=23)


// ./doublet.dats: 515(line=36, offs=1) -- 678(line=48, offs=8)
function
string_fset_at_434_(a1x1, a1x2, a1x3)
{
let xtmp3;
let xtmp22;
;
;
;
// ./doublet.dats: 595(line=43, offs=1) -- 676(line=47, offs=35)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/string.dats: 6929(line=495, offs=1) -- 7016(line=502, offs=8)
function
string_tabulate_7836_(a2x1)
{
let xtmp5;
let xtmp6;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6502(line=415, offs=1) -- 6622(line=425, offs=20)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6562(line=421, offs=1) -- 6620(line=424, offs=31)
;
// } // val-binding
const // implval/fun
string_vt2t_2060_ = XATS2JS_string_vt2t
;
{
// ./../../../../xanadu/prelude/DATS/string.dats: 7020(line=504, offs=1) -- 7418(line=546, offs=8)
function
string_vt_tabulate_7890_(a3x1)
{
let xtmp19;
let xtmp20;
let xtmp21;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 7187(line=522, offs=1) -- 7210(line=523, offs=16)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/string.dats: 7214(line=525, offs=1) -- 7413(line=544, offs=5)
function
loop_7217_(a4x1, a4x2)
{
let a4y1;
let a4y2;
let xtmp10;
let xtmp11;
let xtmp12;
let xtmp16;
let xtmp17;
let xtmp18;
do {
;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2241(line=163, offs=1) -- 2296(line=164, offs=48)
// { // val-binding
// } // val-binding
const // implval/fun
gint_lt_sint_sint_2125_ = XATS2JS_gint_lt_sint_sint
;
xtmp11 = gint_lt_sint_sint_2125_(a4x2, a3x1);
}
;
if
(xtmp11)
// then
{
// ./../../../../xanadu/prelude/DATS/string.dats: 7334(line=539, offs=1) -- 7369(line=540, offs=27)
{
{
// ./doublet.dats: 595(line=43, offs=1) -- 676(line=47, offs=35)
function
tabulate$fopr_4232_(a5x1)
{
let xtmp14;
let xtmp15;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2559(line=185, offs=1) -- 2614(line=186, offs=48)
// { // val-binding
// } // val-binding
const // implval/fun
gint_eq_sint_sint_2293_ = XATS2JS_gint_eq_sint_sint
;
xtmp15 = gint_eq_sint_sint_2293_(a1x2, a5x1);
}
;
if
(xtmp15)
// then
{
xtmp14 = a1x3;
} // if-then
else
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8286(line=563, offs=1) -- 8428(line=574, offs=22)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8350(line=569, offs=1) -- 8426(line=573, offs=22)
;
// } // val-binding
const // implval/fun
string_get_at_5545_ = XATS2JS_string_get_at
;
xtmp14 = string_get_at_5545_(a1x1, a5x1);
}
;
} // if-else
;
return xtmp14;
} // function // tabulate$fopr(3)
;
xtmp12 = tabulate$fopr_4232_(a4x2);
}
;
;
} // val(H0Pvar(c0(13)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 7370(line=541, offs=1) -- 7409(line=542, offs=31)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8867(line=604, offs=1) -- 9021(line=614, offs=25)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8937(line=610, offs=1) -- 9019(line=613, offs=38)
;
// } // val-binding
const // implval/fun
strtmp_vt_set_at_5715_ = XATS2JS_strtmp_vt_set_at
;
xtmp16 = strtmp_vt_set_at_5715_(a4x1, a4x2, xtmp12);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(16)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(16)));
} // val(H0Pnil())
;
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp18 = gint_succ_sint_1861_(a4x2);
}
;
// tail-recursion:
// L1CMDapp(tmp(17); L1VALfcst(loop(10)); L1VALtmp(arg[1](8)), L1VALtmp(tmp(18)))
a4y1 = a4x1; a4y2 = xtmp18; a4x1 = a4y1; a4x2 = a4y2; continue;
}
;
xtmp10 = xtmp17;
} // if-then
else
{
} // if-else
;
break;//return
} while( true );
return xtmp10;
} // function // loop(10)
;
// ./../../../../xanadu/prelude/DATS/string.dats: 7104(line=513, offs=1) -- 7134(line=514, offs=22)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8712(line=593, offs=1) -- 8846(line=602, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8780(line=599, offs=1) -- 8844(line=601, offs=37)
;
// } // val-binding
const // implval/fun
strtmp_vt_alloc_6891_ = XATS2JS_strtmp_vt_alloc
;
xtmp19 = strtmp_vt_alloc_6891_(a3x1);
}
;
;
} // val(H0Pvar(p0(16)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 7138(line=516, offs=1) -- 7148(line=516, offs=11)
{
;
} // val(H0Pvar(i0(18)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 7149(line=517, offs=1) -- 7170(line=517, offs=22)
{
{
xtmp20 = loop_7217_(xtmp19, 0);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(20)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(20)));
} // val(H0Pnil())
;
{
xtmp21 = XATS2JS_fcast(xtmp19);
}
;
return xtmp21;
} // function // string_vt_tabulate(9)
;
xtmp6 = string_vt_tabulate_7890_(a2x1);
}
;
xtmp5 = string_vt2t_2060_(xtmp6);
}
;
return xtmp5;
} // function // string_tabulate(6)
;
{
// ./../../../../xanadu/prelude/DATS/string.dats: 3130(line=162, offs=1) -- 3368(line=186, offs=8)
function
string_length_5305_(a2x1)
{
let xtmp35;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 3192(line=170, offs=1) -- 3351(line=184, offs=5)
function
loop_3195_(a3x1, a3x2)
{
let a3y1;
let a3y2;
let xtmp26;
let xtmp30;
let xtmp31;
let xtmp34;
do {
;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 3265(line=177, offs=1) -- 3291(line=178, offs=23)
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 1685(line=63, offs=1) -- 1744(line=66, offs=22)
function
string_nilq_3395_(a4x1)
{
let xtmp28;
let xtmp29;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 951(line=77, offs=1) -- 990(line=78, offs=32)
// { // val-binding
// } // val-binding
const // implval/fun
char_eqzq_1683_ = XATS2JS_char_eqzq
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7837(line=530, offs=1) -- 7965(line=539, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7905(line=536, offs=1) -- 7963(line=538, offs=31)
;
// } // val-binding
const // implval/fun
string_head_opt_3911_ = XATS2JS_string_head_opt
;
xtmp29 = string_head_opt_3911_(a4x1);
}
;
xtmp28 = char_eqzq_1683_(xtmp29);
}
;
return xtmp28;
} // function // string_nilq(24)
;
xtmp26 = string_nilq_3395_(a3x1);
}
;
;
} // val(H0Pvar(test(23)))
;
if
(xtmp26)
// then
{
xtmp30 = a3x2;
} // if-then
else
{
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 1879(line=77, offs=1) -- 1928(line=79, offs=22)
function
string_tail_4009_(a4x1)
{
let xtmp33;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8135(line=552, offs=1) -- 8265(line=561, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8203(line=558, offs=1) -- 8263(line=560, offs=33)
;
// } // val-binding
const // implval/fun
string_tail_raw_4165_ = XATS2JS_string_tail_raw
;
xtmp33 = string_tail_raw_4165_(a4x1);
}
;
return xtmp33;
} // function // string_tail(29)
;
xtmp31 = string_tail_4009_(a3x1);
}
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp34 = gint_succ_sint_1861_(a3x2);
}
;
// tail-recursion:
// L1CMDapp(tmp(30); L1VALfcst(loop(23)); L1VALtmp(tmp(31)), L1VALtmp(tmp(34)))
a3y1 = xtmp31; a3y2 = xtmp34; a3x1 = a3y1; a3x2 = a3y2; continue;
}
;
} // if-else
;
break;//return
} while( true );
return xtmp30;
} // function // loop(23)
;
{
xtmp35 = loop_3195_(a2x1, 0);
}
;
return xtmp35;
} // function // string_length(22)
;
xtmp22 = string_length_5305_(a1x1);
}
;
xtmp3 = string_tabulate_7836_(xtmp22);
}
;
return xtmp3;
} // function // string_fset_at(2)


// ./doublet.dats: 733(line=52, offs=1) -- 3209(line=262, offs=6)
// { // local
// ./doublet.dats: 768(line=56, offs=1) -- 830(line=62, offs=23)

// ./doublet.dats: 851(line=64, offs=1) -- 1444(line=114, offs=9)
function
helper_2_854_(a1x1, a1x2)
{
let xtmp38;
let xtmp54;
let xtmp55;
;
;
// ./doublet.dats: 935(line=74, offs=1) -- 945(line=74, offs=11)
{
;
} // val(H0Pvar(N(32)))
;
// ./doublet.dats: 946(line=75, offs=1) -- 976(line=76, offs=22)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8286(line=563, offs=1) -- 8428(line=574, offs=22)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8350(line=569, offs=1) -- 8426(line=573, offs=22)
;
// } // val-binding
const // implval/fun
string_get_at_5545_ = XATS2JS_string_get_at
;
xtmp38 = string_get_at_5545_(a1x1, a1x2);
}
;
;
} // val(H0Pvar(c0(33)))
;
// ./doublet.dats: 977(line=77, offs=1) -- 1017(line=78, offs=29)
{
;
} // val(H0Pvar(alpha(34)))
;
// ./doublet.dats: 1090(line=87, offs=1) -- 1118(line=88, offs=21)
// L1DCLnone1(H0Cnone1(...));
// ./doublet.dats: 1119(line=89, offs=1) -- 1154(line=90, offs=28)
// L1DCLnone1(H0Cnone1(...));
// ./doublet.dats: 1158(line=92, offs=1) -- 1419(line=111, offs=5)
function
loop_1161_(a2x1, a2x2)
{
let a2y1;
let a2y2;
let xtmp41;
let xtmp42;
let xtmp43;
let xtmp44;
let xtmp45;
let xtmp46;
let xtmp51;
let xtmp52;
let xtmp53;
do {
;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2559(line=185, offs=1) -- 2614(line=186, offs=48)
// { // val-binding
// } // val-binding
const // implval/fun
gint_eq_sint_sint_2293_ = XATS2JS_gint_eq_sint_sint
;
xtmp42 = gint_eq_sint_sint_2293_(a2x1, 0);
}
;
if
(xtmp42)
// then
{
xtmp41 = a2x2;
} // if-then
else
{
// ./doublet.dats: 1221(line=99, offs=3) -- 1238(line=99, offs=20)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2065(line=150, offs=1) -- 2114(line=151, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_pred_sint_1913_ = XATS2JS_gint_pred_sint
;
xtmp43 = gint_pred_sint_1913_(a2x1);
}
;
;
} // val(H0Pvar(j1(38)))
;
// ./doublet.dats: 1241(line=100, offs=3) -- 1276(line=101, offs=27)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8286(line=563, offs=1) -- 8428(line=574, offs=22)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8350(line=569, offs=1) -- 8426(line=573, offs=22)
;
// } // val-binding
const // implval/fun
string_get_at_5545_ = XATS2JS_string_get_at
;
xtmp44 = string_get_at_5545_("abcdefghijklmnopqrstuvwxyz", xtmp43);
}
;
;
} // val(H0Pvar(c1(39)))
;
{
// ./../../../../xanadu/prelude/DATS/gord.dats: 121(line=12, offs=1) -- 172(line=15, offs=21)
function
g_eq_1500_(a3x1, a3x2)
{
let xtmp49;
let xtmp50;
;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2559(line=185, offs=1) -- 2614(line=186, offs=48)
// { // val-binding
// } // val-binding
const // implval/fun
gint_eq_sint_sint_2293_ = XATS2JS_gint_eq_sint_sint
;
{
// ./../../../../xanadu/prelude/DATS/char.dats: 2035(line=94, offs=1) -- 2067(line=95, offs=25)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1183(line=91, offs=1) -- 1220(line=92, offs=30)
// { // val-binding
// } // val-binding
const // implval/fun
char_cmp_2060_ = XATS2JS_char_cmp
;
// } // val-binding
const // implval/fun
g_cmp_1644_ = char_cmp_2060_
;
xtmp50 = g_cmp_1644_(a3x1, a3x2);
}
;
xtmp49 = gint_eq_sint_sint_2293_(xtmp50, 0);
}
;
return xtmp49;
} // function // g_eq(37)
;
xtmp46 = g_eq_1500_(xtmp38, xtmp44);
}
;
if
(xtmp46)
// then
{
{
// tail-recursion:
// L1CMDapp(tmp(45); L1VALfcst(loop(34)); L1VALtmp(tmp(43)), L1VALtmp(arg[2](40)))
a2y1 = xtmp43; a2y2 = a2x2; a2x1 = a2y1; a2x2 = a2y2; continue;
}
;
} // if-then
else
{
// ./doublet.dats: 1330(line=106, offs=5) -- 1369(line=107, offs=31)
{
{
xtmp51 = string_fset_at_434_(a1x1, a1x2, xtmp44);
}
;
;
} // val(H0Pvar(cs(42)))
;
{
{
xtmp53 = [1, xtmp51, a2x2];
}
;
// tail-recursion:
// L1CMDapp(tmp(52); L1VALfcst(loop(34)); L1VALtmp(tmp(43)), L1VALtmp(tmp(53)))
a2y1 = xtmp43; a2y2 = xtmp53; a2x1 = a2y1; a2x2 = a2y2; continue;
}
;
xtmp45 = xtmp52;
} // if-else
;
xtmp41 = xtmp45;
} // if-else
;
break;//return
} while( true );
return xtmp41;
} // function // loop(34)
;
// ./doublet.dats: 1025(line=81, offs=1) -- 1058(line=83, offs=14)
{
;
} // val(H0Pvar(j0(44)))
{
{
xtmp54 = [0];
}
;
;
} // val(H0Pvar(r0(45)))
;
{
xtmp55 = loop_1161_(26, xtmp54);
}
;
return xtmp55;
} // function // helper_2(33)

// ./doublet.dats: 1486(line=116, offs=1) -- 1676(line=130, offs=19)
function
helper_1_771_(a1x1)
{
let xtmp57;
let xtmp104;
let xtmp116;
;
// ./doublet.dats: 1576(line=124, offs=1) -- 1598(line=125, offs=15)
// L1DCLnone1(H0Cnone1(...));
// ./doublet.dats: 1599(line=126, offs=1) -- 1621(line=127, offs=15)
// L1DCLnone1(H0Cnone1(...));
// ./doublet.dats: 1622(line=128, offs=1) -- 1674(line=129, offs=45)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 12992(line=1074, offs=1) -- 13763(line=1139, offs=8)
function
stream_vt_maplist0_4820_(a2x1)
{
let xtmp103;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 13064(line=1082, offs=1) -- 13761(line=1138, offs=9)
function
auxmain0_13067_(a3x1)
{
let a3y1;
let xtmp60;
let xtmp64;
let xtmp65;
do {
;
xtmp64 =
function()
{
let xtmp61;
let xtmp62;
{
xtmp61 = auxloop2_13395_(XATS2JS_llazy_eval(a3x1));
}
;
return xtmp61;
} // lam-function
;
xtmp65 =
function()
{
let xtmp61;
let xtmp62;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a6x1)
{
;
return XATS2JS_llazy_free(a6x1);
} // function // stream_vt_free(45)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp62 = g_free_1550_(a3x1);
}
;
} // lam-function
;
xtmp60 = XATS2JS_new_llazy(xtmp64,xtmp65);
break;//return
} while( true );
return xtmp60;
} // function // auxmain0(43)
function
auxmain1_13166_(a3x1, a3x2)
{
let a3y1;
let a3y2;
let xtmp68;
let xtmp88;
let xtmp89;
do {
;
;
xtmp88 =
function()
{
let xtmp69;
let xtmp70;
let xtmp71;
let xtmp72;
let xtmp73;
let xtmp74;
let xtmp76;
{
xtmp70 = 0;
do {
do {
if(0!==a3x2[0]) break;
xtmp70 = 1;
} while(false);
if(xtmp70 > 0 ) break;
do {
if(1!==a3x2[0]) break;
//L1PCKany();
//L1PCKany();
xtmp70 = 2;
} while(false);
if(xtmp70 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp70) {
case 1:
{
xtmp69 = auxloop2_13395_(XATS2JS_llazy_eval(a3x1));
}
;
break;
case 2:
xtmp71 = a3x2[1];
xtmp72 = a3x2[2];
{
{
xtmp73 = auxmain1_13166_(a3x1, xtmp72);
}
;
xtmp69 = [1, xtmp71, xtmp73];
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp69;
} // lam-function
;
xtmp89 =
function()
{
let xtmp69;
let xtmp70;
let xtmp71;
let xtmp72;
let xtmp73;
let xtmp74;
let xtmp76;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a6x1)
{
;
return XATS2JS_llazy_free(a6x1);
} // function // stream_vt_free(45)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp74 = g_free_1550_(a3x1);
}
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 10325(line=852, offs=1) -- 10384(line=855, offs=31)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1225(line=100, offs=1) -- 1474(line=120, offs=13)
function
list_vt_free_2092_(a6x1)
{
let xtmp87;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1290(line=106, offs=1) -- 1452(line=119, offs=5)
function
loop_1293_(a7x1)
{
let xtmp79;
let xtmp80;
let xtmp81;
let xtmp82;
let xtmp83;
let xtmp86;
;
{
xtmp80 = 0;
do {
do {
if(0!==a7x1[0]) break;
xtmp80 = 1;
} while(false);
if(xtmp80 > 0 ) break;
do {
if(1!==a7x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp80 = 2;
} while(false);
if(xtmp80 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp80) {
case 1:
{
xtmp79 = [-1];;
}
;
break;
case 2:
xtmp81 = a7x1[1];
xtmp82 = a7x1[2];
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1412(line=117, offs=3) -- 1434(line=117, offs=25)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 175(line=18, offs=1) -- 207(line=20, offs=18)
function
g_free_1550_(a8x1)
{
let xtmp85;
;
{
xtmp85 = [-1];;
}
;
return xtmp85;
} // function // g_free(44)
;
xtmp83 = g_free_1550_(xtmp81);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(83)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(83)));
} // val(H0Pnil())
;
{
xtmp86 = loop_1293_(xtmp82);
}
;
xtmp79 = xtmp86;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp79;
} // function // loop(48)
;
{
xtmp87 = loop_1293_(a6x1);
}
;
return xtmp87;
} // function // list_vt_free(47)
;
// } // val-binding
const // implval/fun
g_free_1550_ = list_vt_free_2092_
;
xtmp76 = g_free_1550_(a3x2);
}
;
} // lam-function
;
xtmp68 = XATS2JS_new_llazy(xtmp88,xtmp89);
break;//return
} while( true );
return xtmp68;
} // function // auxmain1(46)
function
auxloop2_13395_(a3x1)
{
let a3y1;
let xtmp91;
let xtmp92;
let xtmp93;
let xtmp94;
let xtmp95;
let xtmp98;
let xtmp99;
let xtmp100;
let xtmp101;
let xtmp102;
do {
;
{
xtmp92 = 0;
do {
do {
if(0!==a3x1[0]) break;
xtmp92 = 1;
} while(false);
if(xtmp92 > 0 ) break;
do {
if(1!==a3x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp92 = 2;
} while(false);
if(xtmp92 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp92) {
case 1:
{
xtmp91 = [0];
}
;
break;
case 2:
xtmp93 = a3x1[1];
xtmp94 = a3x1[2];
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 13540(line=1126, offs=3) -- 13578(line=1128, offs=28)
{
{
// ./doublet.dats: 1622(line=128, offs=1) -- 1674(line=129, offs=45)
function
maplist0$fopr_3051_(a4x1)
{
let xtmp97;
;
{
xtmp97 = helper_2_854_(a1x1, a4x1);
}
;
return xtmp97;
} // function // maplist0$fopr(41)
;
xtmp95 = maplist0$fopr_3051_(xtmp93);
}
;
;
} // val(H0Pvar(ys(70)))
;
{
xtmp99 = 0;
do {
do {
if(0!==xtmp95[0]) break;
xtmp99 = 1;
} while(false);
if(xtmp99 > 0 ) break;
do {
if(1!==xtmp95[0]) break;
//L1PCKany();
//L1PCKany();
xtmp99 = 2;
} while(false);
if(xtmp99 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp99) {
case 1:
{
// tail-recursion:
// L1CMDapp(tmp(98); L1VALfcst(auxloop2(49)); L1VALeval3(L1VALtmp(tmp(94))))
a3y1 = XATS2JS_llazy_eval(xtmp94); a3x1 = a3y1; continue;
}
;
break;
case 2:
xtmp100 = xtmp95[1];
xtmp101 = xtmp95[2];
{
{
xtmp102 = auxmain1_13166_(xtmp94, xtmp101);
}
;
xtmp98 = [1, xtmp100, xtmp102];
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
xtmp91 = xtmp98;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp91;
} // function // auxloop2(49)
;
{
xtmp103 = auxmain0_13067_(a2x1);
}
;
return xtmp103;
} // function // stream_vt_maplist0(42)
;
{
// ./../../../../xanadu/prelude/DATS/gint.dats: 3983(line=224, offs=1) -- 4242(line=249, offs=8)
function
gint_streamize_nint_5231_(a2x1)
{
let xtmp115;
;
// ./../../../../xanadu/prelude/DATS/gint.dats: 4059(line=232, offs=1) -- 4240(line=248, offs=8)
function
auxmain_4062_(a3x1, a3x2)
{
let xtmp108;
let xtmp113;
let xtmp114;
;
;
xtmp113 =
function()
{
let xtmp109;
let xtmp110;
let xtmp111;
let xtmp112;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2883(line=207, offs=1) -- 2940(line=208, offs=50)
// { // val-binding
// } // val-binding
const // implval/fun
gint_gte_sint_sint_2466_ = XATS2JS_gint_gte_sint_sint
;
xtmp110 = gint_gte_sint_sint_2466_(a3x2, a3x1);
}
;
if
(xtmp110)
// then
{
{
xtmp109 = [0];
}
;
} // if-then
else
{
{
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp112 = gint_succ_sint_1861_(a3x2);
}
;
xtmp111 = auxmain_4062_(a3x1, xtmp112);
}
;
xtmp109 = [1, a3x2, xtmp111];
}
;
} // if-else
;
return xtmp109;
} // lam-function
;
xtmp114 =
function()
{
let xtmp109;
let xtmp110;
let xtmp111;
let xtmp112;
} // lam-function
;
xtmp108 = XATS2JS_new_llazy(xtmp113,xtmp114);
return xtmp108;
} // function // auxmain(51)
;
{
xtmp115 = auxmain_4062_(a2x1, 0);
}
;
return xtmp115;
} // function // gint_streamize_nint(50)
;
{
// ./../../../../xanadu/prelude/DATS/string.dats: 3130(line=162, offs=1) -- 3368(line=186, offs=8)
function
string_length_5305_(a2x1)
{
let xtmp129;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 3192(line=170, offs=1) -- 3351(line=184, offs=5)
function
loop_3195_(a3x1, a3x2)
{
let a3y1;
let a3y2;
let xtmp120;
let xtmp124;
let xtmp125;
let xtmp128;
do {
;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 3265(line=177, offs=1) -- 3291(line=178, offs=23)
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 1685(line=63, offs=1) -- 1744(line=66, offs=22)
function
string_nilq_3395_(a4x1)
{
let xtmp122;
let xtmp123;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 951(line=77, offs=1) -- 990(line=78, offs=32)
// { // val-binding
// } // val-binding
const // implval/fun
char_eqzq_1683_ = XATS2JS_char_eqzq
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7837(line=530, offs=1) -- 7965(line=539, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7905(line=536, offs=1) -- 7963(line=538, offs=31)
;
// } // val-binding
const // implval/fun
string_head_opt_3911_ = XATS2JS_string_head_opt
;
xtmp123 = string_head_opt_3911_(a4x1);
}
;
xtmp122 = char_eqzq_1683_(xtmp123);
}
;
return xtmp122;
} // function // string_nilq(24)
;
xtmp120 = string_nilq_3395_(a3x1);
}
;
;
} // val(H0Pvar(test(23)))
;
if
(xtmp120)
// then
{
xtmp124 = a3x2;
} // if-then
else
{
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 1879(line=77, offs=1) -- 1928(line=79, offs=22)
function
string_tail_4009_(a4x1)
{
let xtmp127;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8135(line=552, offs=1) -- 8265(line=561, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8203(line=558, offs=1) -- 8263(line=560, offs=33)
;
// } // val-binding
const // implval/fun
string_tail_raw_4165_ = XATS2JS_string_tail_raw
;
xtmp127 = string_tail_raw_4165_(a4x1);
}
;
return xtmp127;
} // function // string_tail(29)
;
xtmp125 = string_tail_4009_(a3x1);
}
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp128 = gint_succ_sint_1861_(a3x2);
}
;
// tail-recursion:
// L1CMDapp(tmp(124); L1VALfcst(loop(23)); L1VALtmp(tmp(125)), L1VALtmp(tmp(128)))
a3y1 = xtmp125; a3y2 = xtmp128; a3x1 = a3y1; a3x2 = a3y2; continue;
}
;
} // if-else
;
break;//return
} while( true );
return xtmp124;
} // function // loop(23)
;
{
xtmp129 = loop_3195_(a2x1, 0);
}
;
return xtmp129;
} // function // string_length(22)
;
xtmp116 = string_length_5305_(a1x1);
}
;
xtmp104 = gint_streamize_nint_5231_(xtmp116);
}
;
xtmp57 = stream_vt_maplist0_4820_(xtmp104);
}
;
return xtmp57;
} // function // helper_1(32)

// in-of-local
// ./doublet.dats: 1762(line=137, offs=1) -- 1787(line=138, offs=18)
// L1DCLnone1(H0Cnone1(...))
// ./doublet.dats: 1811(line=141, offs=1) -- 1839(line=142, offs=25)
{
{
xtop130 = theDict_make();
}
;
;
} // val(H0Pvar(theDict(77)))

// ./doublet.dats: 1866(line=146, offs=1) -- 1996(line=157, offs=12)
function
word_legalq_1869_(a1x1)
{
let xtmp132;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 2781(line=189, offs=1) -- 2954(line=200, offs=22)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 2849(line=194, offs=1) -- 2865(line=194, offs=17)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 2866(line=195, offs=1) -- 2952(line=199, offs=47)
;
// } // val-binding
const // implval/fun
XATS2JS_jsobjmap_keyq_2512_ = XATS2JS_jsobjmap_keyq
;
xtmp132 = XATS2JS_jsobjmap_keyq_2512_(xtop130, a1x1);
}
;
return xtmp132;
} // function // word_legalq(54)

// ./doublet.dats: 2021(line=161, offs=1) -- 3158(line=258, offs=15)
function
doublet_play_263_(a1x1, a1x2)
{
let xtmp135;
let xtmp148;
let xtmp149;
let xtmp294;
;
;
// ./doublet.dats: 2060(line=165, offs=1) -- 2102(line=167, offs=28)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 3261(line=220, offs=1) -- 3441(line=230, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 3337(line=225, offs=1) -- 3353(line=225, offs=17)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 3362(line=227, offs=1) -- 3439(line=229, offs=48)
;
// } // val-binding
const // implval/fun
XATS2JS_jsobjmap_make_nil_2997_ = XATS2JS_jsobjmap_make_nil
;
xtmp135 = XATS2JS_jsobjmap_make_nil_2997_();
}
;
;
} // val(H0Pvar(theMarks(83)))
;
// ./doublet.dats: 2106(line=169, offs=1) -- 2239(line=180, offs=13)
function
word_markedq_2109_(a2x1)
{
let xtmp137;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 2781(line=189, offs=1) -- 2954(line=200, offs=22)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 2849(line=194, offs=1) -- 2865(line=194, offs=17)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 2866(line=195, offs=1) -- 2952(line=199, offs=47)
;
// } // val-binding
const // implval/fun
XATS2JS_jsobjmap_keyq_2512_ = XATS2JS_jsobjmap_keyq
;
xtmp137 = XATS2JS_jsobjmap_keyq_2512_(xtmp135, a2x1);
}
;
return xtmp137;
} // function // word_markedq(59)
;
// ./doublet.dats: 2243(line=182, offs=1) -- 2642(line=218, offs=8)
// L1DCLnone0();
// ./doublet.dats: 2741(line=227, offs=1) -- 3058(line=250, offs=8)
function
auxsrch_2744_(a2x1)
{
let a2y1;
let xtmp139;
let xtmp140;
let xtmp141;
let xtmp142;
let xtmp143;
let xtmp144;
let xtmp145;
let xtmp146;
let xtmp147;
do {
;
xtmp140 = XATS2JS_llazy_eval(a2x1);
{
xtmp141 = 0;
do {
do {
if(0!==xtmp140[0]) break;
xtmp141 = 1;
} while(false);
if(xtmp141 > 0 ) break;
do {
if(1!==xtmp140[0]) break;
//L1PCKany();
//L1PCKany();
xtmp141 = 2;
} while(false);
if(xtmp141 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp141) {
case 1:
{
xtmp139 = [0];
}
;
break;
case 2:
xtmp142 = xtmp140[1];
xtmp143 = xtmp140[2];
// ./doublet.dats: 2886(line=240, offs=1) -- 2913(line=241, offs=23)
{
if(1!==xtmp142[0]) XATS2JS_patckerr0();
;
xtmp144 = xtmp142[1];
} // val(H0Pdapp(H0Pcon(list_cons(4)); -1; H0Pvar(wx(99)), H0Pany()))
;
// ./doublet.dats: 2914(line=242, offs=1) -- 2970(line=244, offs=28)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 5763(line=392, offs=1) -- 5971(line=404, offs=28)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 5843(line=397, offs=1) -- 5859(line=397, offs=17)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 5868(line=399, offs=1) -- 5969(line=403, offs=56)
;
// } // val-binding
const // implval/fun
XATS2JS_jsobjmap_insert_any_5328_ = XATS2JS_jsobjmap_insert_any
;
xtmp145 = XATS2JS_jsobjmap_insert_any_5328_(xtmp135, xtmp144, 0);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(145)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(145)));
} // val(H0Pnil())
;
{
// ./../../../../xanadu/prelude/DATS/string.dats: 8006(line=595, offs=1) -- 8036(line=596, offs=23)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7150(line=472, offs=1) -- 7272(line=482, offs=18)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7206(line=478, offs=1) -- 7270(line=481, offs=31)
;
// } // val-binding
const // implval/fun
string_eq_4449_ = XATS2JS_string_eq
;
// } // val-binding
const // implval/fun
g_eq_1500_ = string_eq_4449_
;
xtmp147 = g_eq_1500_(xtmp144, a1x2);
}
;
if
(xtmp147)
// then
{
{
xtmp146 = [1, xtmp142];
}
;
} // if-then
else
{
{
// tail-recursion:
// L1CMDapp(tmp(146); L1VALfcst(auxsrch(66)); L1VALtmp(tmp(143)))
a2y1 = xtmp143; a2x1 = a2y1; continue;
}
;
} // if-else
;
xtmp139 = xtmp146;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp139;
} // function // auxsrch(66)
;
{
{
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 2624(line=136, offs=1) -- 2735(line=143, offs=8)
function
gtree_bfs_streamize_2471_(a2x1)
{
let xtmp151;
let xtmp155;
;
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 2674(line=140, offs=1) -- 2699(line=141, offs=17)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 332(line=32, offs=1) -- 401(line=35, offs=32)
function
list_vt_sing_1720_(a3x1)
{
let xtmp153;
let xtmp154;
;
{
{
xtmp154 = [0];
}
;
xtmp153 = [1, a3x1, xtmp154];
}
;
return xtmp153;
} // function // list_vt_sing(72)
;
xtmp151 = list_vt_sing_1720_(a2x1);
}
;
;
} // val(H0Pvar(xs(104)))
;
{
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 2792(line=147, offs=1) -- 3587(line=215, offs=8)
function
gtree_bfs_streamize_list_2537_(a3x1)
{
let xtmp288;
let xtmp292;
let xtmp293;
;
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 2924(line=160, offs=1) -- 2949(line=161, offs=18)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 2950(line=162, offs=1) -- 3566(line=214, offs=13)
function
auxmain_2953_(a4x1, a4x2)
{
let xtmp159;
let xtmp286;
let xtmp287;
;
;
xtmp286 =
function()
{
let xtmp160;
let xtmp161;
let xtmp162;
let xtmp163;
let xtmp176;
let xtmp177;
let xtmp178;
let xtmp179;
let xtmp180;
let xtmp181;
let xtmp182;
let xtmp183;
let xtmp184;
let xtmp241;
let xtmp242;
let xtmp243;
let xtmp244;
let xtmp265;
{
xtmp161 = 0;
do {
do {
if(0!==a4x1[0]) break;
xtmp161 = 1;
} while(false);
if(xtmp161 > 0 ) break;
do {
if(1!==a4x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp161 = 2;
} while(false);
if(xtmp161 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp161) {
case 1:
{
xtmp162 = 0;
do {
do {
if(0!==a4x2[0]) break;
xtmp162 = 1;
} while(false);
if(xtmp162 > 0 ) break;
do {
//L1PCKany();
xtmp162 = 2;
} while(false);
if(xtmp162 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp162) {
case 1:
{
xtmp160 = [0];
}
;
break;
case 2:
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 3168(line=184, offs=1) -- 3198(line=185, offs=21)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3688(line=300, offs=1) -- 3766(line=303, offs=38)
function
list_vt_reverse_2756_(a6x1)
{
let xtmp165;
let xtmp175;
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3789(line=307, offs=1) -- 4160(line=338, offs=10)
function
list_vt_rappend_2826_(a7x1, a7x2)
{
let xtmp174;
;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3869(line=316, offs=1) -- 4135(line=336, offs=5)
function
loop_3872_(a8x1, a8x2)
{
let xtmp170;
let xtmp171;
let xtmp172;
let xtmp173;
;
;
{
xtmp171 = 0;
do {
do {
if(0!==a8x1[0]) break;
xtmp171 = 1;
} while(false);
if(xtmp171 > 0 ) break;
do {
if(1!==a8x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp171 = 2;
} while(false);
if(xtmp171 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp171) {
case 1:
xtmp170 = a8x2;
break;
case 2:
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 4032(line=331, offs=3) -- 4047(line=331, offs=18)
{
xtmp172 = a8x1[2];
;
} // val(H0Pvar(xs1(117)))
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 4050(line=332, offs=3) -- 4072(line=332, offs=25)
{
XATS2JS_lval_set(XATS2JS_new_cofs(a8x1,2), a8x2);
//L1PCKxpat(H0Pnil(); L1VALnone0());
//L1CMDmatch(H0Pnil(); L1VALnone0());
} // val(H0Pnil())
;
{
xtmp173 = loop_3872_(xtmp172, a8x1);
}
;
xtmp170 = xtmp173;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp170;
} // function // loop(77)
;
{
xtmp174 = loop_3872_(a7x1, a7x2);
}
;
return xtmp174;
} // function // list_vt_rappend(76)
;
{
xtmp175 = [0];
}
;
xtmp165 = list_vt_rappend_2826_(a6x1, xtmp175);
}
;
return xtmp165;
} // function // list_vt_reverse(75)
;
xtmp163 = list_vt_reverse_2756_(a4x2);
}
;
;
} // val(H0Pvar(xss(110)))
;
{
{
xtmp177 = [0];
}
;
xtmp176 = auxmain_2953_(xtmp163, xtmp177);
}
;
xtmp160 = XATS2JS_llazy_eval(xtmp176);
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;
case 2:
xtmp178 = a4x1[1];
xtmp179 = a4x1[2];
{
xtmp180 = 0;
do {
do {
if(0!==xtmp178[0]) break;
xtmp180 = 1;
} while(false);
if(xtmp180 > 0 ) break;
do {
if(1!==xtmp178[0]) break;
//L1PCKany();
//L1PCKany();
xtmp180 = 2;
} while(false);
if(xtmp180 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp180) {
case 1:
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 3314(line=198, offs=1) -- 3329(line=198, offs=16)
{
;
} // val(H0Pvar(xss1(120)))
;
{
xtmp181 = auxmain_2953_(xtmp179, a4x2);
}
;
xtmp160 = XATS2JS_llazy_eval(xtmp181);
break;
case 2:
xtmp182 = xtmp178[1];
xtmp183 = xtmp178[2];
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 3404(line=205, offs=1) -- 3427(line=205, offs=24)
{
XATS2JS_lval_set(XATS2JS_new_cofs(a4x1,1), xtmp183);
//L1PCKxpat(H0Pnil(); L1VALnone0());
//L1CMDmatch(H0Pnil(); L1VALnone0());
} // val(H0Pnil())
;
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 3428(line=206, offs=1) -- 3465(line=207, offs=28)
{
{
// ./doublet.dats: 2243(line=182, offs=1) -- 2642(line=218, offs=8)
function
gtree_node_childlst_1293_(a6x1)
{
let xtmp186;
let xtmp187;
let xtmp188;
let xtmp189;
let xtmp190;
let xtmp191;
let xtmp208;
let xtmp222;
;
// ./doublet.dats: 2291(line=187, offs=1) -- 2321(line=189, offs=16)
{
if(1!==a6x1[0]) XATS2JS_patckerr0();
;
xtmp186 = a6x1[1];
xtmp187 = a6x1[2];
} // val(H0Pdapp(H0Pcon(list_cons(4)); -1; H0Pvar(wx(89)), H0Pvar(_nx_(90))))
;
{
xtmp189 = word_markedq_2109_(xtmp186);
}
;
if
(xtmp189)
// then
{
{
xtmp188 = [0];
}
;
} // if-then
else
{
// ./doublet.dats: 2414(line=201, offs=1) -- 2435(line=201, offs=22)
{
{
xtmp190 = helper_1_771_(xtmp186);
}
;
;
} // val(H0Pvar(ws(91)))
;
// ./doublet.dats: 2439(line=203, offs=1) -- 2520(line=208, offs=22)
{
// ./doublet.dats: 2478(line=206, offs=1) -- 2518(line=207, offs=33)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9886(line=809, offs=1) -- 10327(line=849, offs=8)
function
stream_vt_filter0_4286_(a7x1)
{
let xtmp207;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9959(line=817, offs=1) -- 10325(line=848, offs=8)
function
auxmain_9962_(a8x1)
{
let a8y1;
let xtmp194;
let xtmp198;
let xtmp199;
do {
;
xtmp198 =
function()
{
let xtmp195;
let xtmp196;
{
xtmp195 = auxloop_10056_(XATS2JS_llazy_eval(a8x1));
}
;
return xtmp195;
} // lam-function
;
xtmp199 =
function()
{
let xtmp195;
let xtmp196;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a11x1)
{
;
return XATS2JS_llazy_free(a11x1);
} // function // stream_vt_free(45)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp196 = g_free_1550_(a8x1);
}
;
} // lam-function
;
xtmp194 = XATS2JS_new_llazy(xtmp198,xtmp199);
break;//return
} while( true );
return xtmp194;
} // function // auxmain(78)
function
auxloop_10056_(a8x1)
{
let a8y1;
let xtmp201;
let xtmp202;
let xtmp203;
let xtmp204;
let xtmp205;
let xtmp206;
do {
;
{
xtmp202 = 0;
do {
do {
if(0!==a8x1[0]) break;
xtmp202 = 1;
} while(false);
if(xtmp202 > 0 ) break;
do {
if(1!==a8x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp202 = 2;
} while(false);
if(xtmp202 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp202) {
case 1:
{
xtmp201 = [0];
}
;
break;
case 2:
xtmp203 = a8x1[1];
xtmp204 = a8x1[2];
{
// ./doublet.dats: 2478(line=206, offs=1) -- 2518(line=207, offs=33)
// { // val-binding
// } // val-binding
const // implval/fun
filter0$test_2547_ = word_legalq_1869_
;
xtmp205 = filter0$test_2547_(xtmp203);
}
;
if
(xtmp205)
// then
{
{
{
xtmp206 = auxmain_9962_(xtmp204);
}
;
xtmp201 = [1, xtmp203, xtmp206];
}
;
} // if-then
else
{
{
// tail-recursion:
// L1CMDapp(tmp(201); L1VALfcst(auxloop(79)); L1VALeval3(L1VALtmp(tmp(204))))
a8y1 = XATS2JS_llazy_eval(xtmp204); a8x1 = a8y1; continue;
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
return xtmp201;
} // function // auxloop(79)
;
{
xtmp207 = auxmain_9962_(a7x1);
}
;
return xtmp207;
} // function // stream_vt_filter0(62)
;
xtmp191 = stream_vt_filter0_4286_(xtmp190);
}
;
;
} // val(H0Pvar(ws(92)))
;
// ./doublet.dats: 2524(line=210, offs=1) -- 2578(line=212, offs=37)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 5034(line=402, offs=1) -- 5419(line=433, offs=8)
function
stream_vt_listize_3070_(a7x1)
{
let xtmp220;
let xtmp221;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 5084(line=407, offs=1) -- 5331(line=427, offs=5)
function
loop_5087_(a8x1, a8x2)
{
let xtmp212;
let xtmp213;
let xtmp214;
let xtmp215;
let xtmp216;
let xtmp217;
let xtmp218;
let xtmp219;
;
;
xtmp213 = XATS2JS_llazy_eval(a8x1);
{
xtmp214 = 0;
do {
do {
if(0!==xtmp213[0]) break;
xtmp214 = 1;
} while(false);
if(xtmp214 > 0 ) break;
do {
if(1!==xtmp213[0]) break;
//L1PCKany();
//L1PCKany();
xtmp214 = 2;
} while(false);
if(xtmp214 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp214) {
case 1:
{
xtmp215 = [0];
}
;
XATS2JS_lval_set(a8x2, xtmp215);
xtmp212 = null;
break;
case 2:
xtmp216 = xtmp213[1];
xtmp217 = xtmp213[2];
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 5254(line=422, offs=3) -- 5292(line=423, offs=30)
{
{
xtmp218 = [1, xtmp216, XATS2JS_top];
}
;
XATS2JS_lval_set(a8x2, xtmp218);
//L1PCKxpat(H0Pnil(); L1VALnone0());
//L1CMDmatch(H0Pnil(); L1VALnone0());
} // val(H0Pnil())
;
{
xtmp219 = loop_5087_(xtmp217, XATS2JS_new_cofs(XATS2JS_lval_get(a8x2),2));
}
;
xtmp212 = null;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp212;
} // function // loop(80)
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 5362(line=431, offs=1) -- 5380(line=431, offs=19)
{
xtmp220 = XATS2JS_new_var0();
} // val(r0(137))
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 5381(line=432, offs=1) -- 5402(line=432, offs=22)
{
{
xtmp221 = loop_5087_(a7x1, xtmp220);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(221)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(221)));
} // val(H0Pnil())
;
return XATS2JS_lval_get(xtmp220);
} // function // stream_vt_listize(64)
;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9181(line=740, offs=1) -- 9505(line=772, offs=8)
function
stream_vt_map0_4084_(a7x1)
{
let xtmp240;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9248(line=748, offs=1) -- 9503(line=771, offs=12)
function
auxmain_9251_(a8x1)
{
let xtmp225;
let xtmp238;
let xtmp239;
;
xtmp238 =
function()
{
let xtmp226;
let xtmp227;
let xtmp228;
let xtmp229;
let xtmp230;
let xtmp231;
let xtmp234;
let xtmp235;
let xtmp236;
xtmp227 = XATS2JS_llazy_eval(a8x1);
{
xtmp228 = 0;
do {
do {
if(0!==xtmp227[0]) break;
xtmp228 = 1;
} while(false);
if(xtmp228 > 0 ) break;
do {
if(1!==xtmp227[0]) break;
//L1PCKany();
//L1PCKany();
xtmp228 = 2;
} while(false);
if(xtmp228 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp228) {
case 1:
{
xtmp226 = [0];
}
;
break;
case 2:
xtmp229 = xtmp227[1];
xtmp230 = xtmp227[2];
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9427(line=766, offs=3) -- 9459(line=767, offs=24)
{
{
// ./doublet.dats: 2524(line=210, offs=1) -- 2578(line=212, offs=37)
function
map0$fopr_2343_(a10x1)
{
let xtmp233;
;
{
xtmp233 = [1, a10x1, a6x1];
}
;
return xtmp233;
} // function // map0$fopr(63)
;
xtmp231 = map0$fopr_2343_(xtmp229);
}
;
;
} // val(H0Pvar(y0(143)))
;
{
{
xtmp235 = auxmain_9251_(xtmp230);
}
;
xtmp234 = [1, xtmp231, xtmp235];
}
;
xtmp226 = xtmp234;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp226;
} // lam-function
;
xtmp239 =
function()
{
let xtmp226;
let xtmp227;
let xtmp228;
let xtmp229;
let xtmp230;
let xtmp231;
let xtmp234;
let xtmp235;
let xtmp236;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a11x1)
{
;
return XATS2JS_llazy_free(a11x1);
} // function // stream_vt_free(45)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp236 = g_free_1550_(a8x1);
}
;
} // lam-function
;
xtmp225 = XATS2JS_new_llazy(xtmp238,xtmp239);
return xtmp225;
} // function // auxmain(81)
;
{
xtmp240 = auxmain_9251_(a7x1);
}
;
return xtmp240;
} // function // stream_vt_map0(65)
;
xtmp222 = stream_vt_map0_4084_(xtmp191);
}
;
xtmp208 = stream_vt_listize_3070_(xtmp222);
}
;
xtmp188 = xtmp208;
} // if-else
;
return xtmp188;
} // function // gtree_node_childlst(60)
;
xtmp184 = gtree_node_childlst_1293_(xtmp182);
}
;
;
} // val(H0Pvar(xs0(123)))
;
{
{
{
xtmp243 = [1, xtmp184, a4x2];
}
;
xtmp242 = auxmain_2953_(a4x1, xtmp243);
}
;
xtmp241 = [1, xtmp182, xtmp242];
}
;
xtmp160 = xtmp241;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp160;
} // lam-function
;
xtmp287 =
function()
{
let xtmp160;
let xtmp161;
let xtmp162;
let xtmp163;
let xtmp176;
let xtmp177;
let xtmp178;
let xtmp179;
let xtmp180;
let xtmp181;
let xtmp182;
let xtmp183;
let xtmp184;
let xtmp241;
let xtmp242;
let xtmp243;
let xtmp244;
let xtmp265;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 10325(line=852, offs=1) -- 10384(line=855, offs=31)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1225(line=100, offs=1) -- 1474(line=120, offs=13)
function
list_vt_free_2092_(a7x1)
{
let xtmp264;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1290(line=106, offs=1) -- 1452(line=119, offs=5)
function
loop_1293_(a8x1)
{
let xtmp247;
let xtmp248;
let xtmp249;
let xtmp250;
let xtmp251;
let xtmp263;
;
{
xtmp248 = 0;
do {
do {
if(0!==a8x1[0]) break;
xtmp248 = 1;
} while(false);
if(xtmp248 > 0 ) break;
do {
if(1!==a8x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp248 = 2;
} while(false);
if(xtmp248 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp248) {
case 1:
{
xtmp247 = [-1];;
}
;
break;
case 2:
xtmp249 = a8x1[1];
xtmp250 = a8x1[2];
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1412(line=117, offs=3) -- 1434(line=117, offs=25)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 10325(line=852, offs=1) -- 10384(line=855, offs=31)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1225(line=100, offs=1) -- 1474(line=120, offs=13)
function
list_vt_free_2092_(a10x1)
{
let xtmp262;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1290(line=106, offs=1) -- 1452(line=119, offs=5)
function
loop_1293_(a11x1)
{
let xtmp254;
let xtmp255;
let xtmp256;
let xtmp257;
let xtmp258;
let xtmp261;
;
{
xtmp255 = 0;
do {
do {
if(0!==a11x1[0]) break;
xtmp255 = 1;
} while(false);
if(xtmp255 > 0 ) break;
do {
if(1!==a11x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp255 = 2;
} while(false);
if(xtmp255 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp255) {
case 1:
{
xtmp254 = [-1];;
}
;
break;
case 2:
xtmp256 = a11x1[1];
xtmp257 = a11x1[2];
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1412(line=117, offs=3) -- 1434(line=117, offs=25)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 175(line=18, offs=1) -- 207(line=20, offs=18)
function
g_free_1550_(a12x1)
{
let xtmp260;
;
{
xtmp260 = [-1];;
}
;
return xtmp260;
} // function // g_free(44)
;
xtmp258 = g_free_1550_(xtmp256);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(258)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(258)));
} // val(H0Pnil())
;
{
xtmp261 = loop_1293_(xtmp257);
}
;
xtmp254 = xtmp261;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp254;
} // function // loop(48)
;
{
xtmp262 = loop_1293_(a10x1);
}
;
return xtmp262;
} // function // list_vt_free(47)
;
// } // val-binding
const // implval/fun
g_free_1550_ = list_vt_free_2092_
;
xtmp251 = g_free_1550_(xtmp249);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(251)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(251)));
} // val(H0Pnil())
;
{
xtmp263 = loop_1293_(xtmp250);
}
;
xtmp247 = xtmp263;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp247;
} // function // loop(48)
;
{
xtmp264 = loop_1293_(a7x1);
}
;
return xtmp264;
} // function // list_vt_free(47)
;
// } // val-binding
const // implval/fun
g_free_1550_ = list_vt_free_2092_
;
xtmp244 = g_free_1550_(a4x1);
}
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 10325(line=852, offs=1) -- 10384(line=855, offs=31)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1225(line=100, offs=1) -- 1474(line=120, offs=13)
function
list_vt_free_2092_(a7x1)
{
let xtmp285;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1290(line=106, offs=1) -- 1452(line=119, offs=5)
function
loop_1293_(a8x1)
{
let xtmp268;
let xtmp269;
let xtmp270;
let xtmp271;
let xtmp272;
let xtmp284;
;
{
xtmp269 = 0;
do {
do {
if(0!==a8x1[0]) break;
xtmp269 = 1;
} while(false);
if(xtmp269 > 0 ) break;
do {
if(1!==a8x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp269 = 2;
} while(false);
if(xtmp269 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp269) {
case 1:
{
xtmp268 = [-1];;
}
;
break;
case 2:
xtmp270 = a8x1[1];
xtmp271 = a8x1[2];
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1412(line=117, offs=3) -- 1434(line=117, offs=25)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 10325(line=852, offs=1) -- 10384(line=855, offs=31)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1225(line=100, offs=1) -- 1474(line=120, offs=13)
function
list_vt_free_2092_(a10x1)
{
let xtmp283;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1290(line=106, offs=1) -- 1452(line=119, offs=5)
function
loop_1293_(a11x1)
{
let xtmp275;
let xtmp276;
let xtmp277;
let xtmp278;
let xtmp279;
let xtmp282;
;
{
xtmp276 = 0;
do {
do {
if(0!==a11x1[0]) break;
xtmp276 = 1;
} while(false);
if(xtmp276 > 0 ) break;
do {
if(1!==a11x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp276 = 2;
} while(false);
if(xtmp276 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp276) {
case 1:
{
xtmp275 = [-1];;
}
;
break;
case 2:
xtmp277 = a11x1[1];
xtmp278 = a11x1[2];
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 1412(line=117, offs=3) -- 1434(line=117, offs=25)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 175(line=18, offs=1) -- 207(line=20, offs=18)
function
g_free_1550_(a12x1)
{
let xtmp281;
;
{
xtmp281 = [-1];;
}
;
return xtmp281;
} // function // g_free(44)
;
xtmp279 = g_free_1550_(xtmp277);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(279)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(279)));
} // val(H0Pnil())
;
{
xtmp282 = loop_1293_(xtmp278);
}
;
xtmp275 = xtmp282;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp275;
} // function // loop(48)
;
{
xtmp283 = loop_1293_(a10x1);
}
;
return xtmp283;
} // function // list_vt_free(47)
;
// } // val-binding
const // implval/fun
g_free_1550_ = list_vt_free_2092_
;
xtmp272 = g_free_1550_(xtmp270);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(272)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(272)));
} // val(H0Pnil())
;
{
xtmp284 = loop_1293_(xtmp271);
}
;
xtmp268 = xtmp284;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp268;
} // function // loop(48)
;
{
xtmp285 = loop_1293_(a7x1);
}
;
return xtmp285;
} // function // list_vt_free(47)
;
// } // val-binding
const // implval/fun
g_free_1550_ = list_vt_free_2092_
;
xtmp265 = g_free_1550_(a4x2);
}
;
} // lam-function
;
xtmp159 = XATS2JS_new_llazy(xtmp286,xtmp287);
return xtmp159;
} // function // auxmain(74)
;
// ./../../../../xanadu/xatslib/githwxi/DATS/gtree1.dats: 2852(line=153, offs=1) -- 2878(line=154, offs=17)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 332(line=32, offs=1) -- 401(line=35, offs=32)
function
list_vt_sing_1720_(a4x1)
{
let xtmp290;
let xtmp291;
;
{
{
xtmp291 = [0];
}
;
xtmp290 = [1, a4x1, xtmp291];
}
;
return xtmp290;
} // function // list_vt_sing(72)
;
xtmp288 = list_vt_sing_1720_(a3x1);
}
;
;
} // val(H0Pvar(xss(144)))
;
{
{
xtmp293 = [0];
}
;
xtmp292 = auxmain_2953_(xtmp288, xtmp293);
}
;
return xtmp292;
} // function // gtree_bfs_streamize_list(73)
;
xtmp155 = gtree_bfs_streamize_list_2537_(xtmp151);
}
;
return xtmp155;
} // function // gtree_bfs_streamize(71)
;
{
// ./../../../../xanadu/prelude/DATS/list.dats: 286(line=30, offs=1) -- 346(line=33, offs=26)
function
list_sing_1582_(a2x1)
{
let xtmp296;
let xtmp297;
;
{
{
xtmp297 = [0];
}
;
xtmp296 = [1, a2x1, xtmp297];
}
;
return xtmp296;
} // function // list_sing(82)
;
xtmp294 = list_sing_1582_(a1x1);
}
;
xtmp149 = gtree_bfs_streamize_2471_(xtmp294);
}
;
xtmp148 = auxsrch_2744_(xtmp149);
}
;
return xtmp148;
} // function // doublet_play(0)

// } // end-of-local


// ./JS_doublet.dats: 21(line=2, offs=1) -- 73(line=4, offs=29)
// { // include
// ./../../../../share/xats2js_prelude.hats
// ././../../../../share/xats2js_prelude.hats: 114(line=8, offs=1) -- 151(line=8, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 172(line=10, offs=1) -- 209(line=10, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 210(line=11, offs=1) -- 247(line=11, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 268(line=13, offs=1) -- 305(line=13, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 306(line=14, offs=1) -- 343(line=14, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 344(line=15, offs=1) -- 381(line=15, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 402(line=17, offs=1) -- 439(line=17, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 440(line=18, offs=1) -- 477(line=18, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 478(line=19, offs=1) -- 515(line=19, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 516(line=20, offs=1) -- 553(line=20, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 574(line=22, offs=1) -- 612(line=22, offs=39)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 613(line=23, offs=1) -- 652(line=23, offs=40)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 673(line=25, offs=1) -- 710(line=25, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 711(line=26, offs=1) -- 748(line=26, offs=38)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 749(line=27, offs=1) -- 788(line=27, offs=40)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 809(line=29, offs=1) -- 847(line=29, offs=39)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 868(line=31, offs=1) -- 908(line=31, offs=41)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 929(line=33, offs=1) -- 969(line=33, offs=41)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 970(line=34, offs=1) -- 1010(line=34, offs=41)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1011(line=35, offs=1) -- 1053(line=35, offs=43)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1074(line=37, offs=1) -- 1113(line=37, offs=40)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1134(line=39, offs=1) -- 1175(line=39, offs=42)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1199(line=42, offs=1) -- 1246(line=42, offs=48)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1250(line=44, offs=1) -- 1297(line=44, offs=48)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1301(line=46, offs=1) -- 1349(line=46, offs=49)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1353(line=48, offs=1) -- 1401(line=48, offs=49)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1405(line=50, offs=1) -- 1453(line=50, offs=49)
// L1DCLnone1(H0Cnone1(...))
// ././../../../../share/xats2js_prelude.hats: 1457(line=52, offs=1) -- 1506(line=52, offs=50)
// L1DCLnone1(H0Cnone1(...))
// } // end-of-include


// ./JS_doublet.dats: 94(line=6, offs=1) -- 124(line=6, offs=31)
// L1DCLnone1(H0Cnone1(...))

// ./JS_doublet.dats: 145(line=8, offs=1) -- 188(line=9, offs=35)
// L1DCLnone1(H0Cnone1(...))

// ./JS_doublet.dats: 209(line=11, offs=1) -- 254(line=12, offs=37)
// L1DCLnone1(H0Cnone1(...))

// ./JS_doublet.dats: 283(line=15, offs=1) -- 334(line=18, offs=21)


// ./JS_doublet.dats: 355(line=20, offs=1) -- 708(line=48, offs=11)
function
theDict_make()
{
let xtmp0;
let xtmp195;
let xtmp196;
let xtmp197;
// ./JS_doublet.dats: 468(line=32, offs=1) -- 515(line=34, offs=20)
{
{
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 8549(line=621, offs=1) -- 8750(line=634, offs=8)
function
string_split_lines_8197_(a2x1)
{
let xtmp2;
let xtmp19;
let xtmp168;
;
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 8596(line=625, offs=1) -- 8615(line=625, offs=20)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 8616(line=626, offs=1) -- 8638(line=626, offs=23)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 8639(line=627, offs=1) -- 8678(line=628, offs=32)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9181(line=740, offs=1) -- 9505(line=772, offs=8)
function
stream_vt_map0_4084_(a3x1)
{
let xtmp18;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9248(line=748, offs=1) -- 9503(line=771, offs=12)
function
auxmain_9251_(a4x1)
{
let xtmp5;
let xtmp16;
let xtmp17;
;
xtmp16 =
function()
{
let xtmp6;
let xtmp7;
let xtmp8;
let xtmp9;
let xtmp10;
let xtmp11;
let xtmp12;
let xtmp13;
let xtmp14;
xtmp7 = XATS2JS_llazy_eval(a4x1);
{
xtmp8 = 0;
do {
do {
if(0!==xtmp7[0]) break;
xtmp8 = 1;
} while(false);
if(xtmp8 > 0 ) break;
do {
if(1!==xtmp7[0]) break;
//L1PCKany();
//L1PCKany();
xtmp8 = 2;
} while(false);
if(xtmp8 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp8) {
case 1:
{
xtmp6 = [0];
}
;
break;
case 2:
xtmp9 = xtmp7[1];
xtmp10 = xtmp7[2];
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9427(line=766, offs=3) -- 9459(line=767, offs=24)
{
{
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 8639(line=627, offs=1) -- 8678(line=628, offs=32)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6502(line=415, offs=1) -- 6622(line=425, offs=20)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 6562(line=421, offs=1) -- 6620(line=424, offs=31)
;
// } // val-binding
const // implval/fun
string_vt2t_2060_ = XATS2JS_string_vt2t
;
// } // val-binding
const // implval/fun
map0$fopr_2343_ = string_vt2t_2060_
;
xtmp11 = map0$fopr_2343_(xtmp9);
}
;
;
} // val(H0Pvar(y0(10)))
;
{
{
xtmp13 = auxmain_9251_(xtmp10);
}
;
xtmp12 = [1, xtmp11, xtmp13];
}
;
xtmp6 = xtmp12;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp6;
} // lam-function
;
xtmp17 =
function()
{
let xtmp6;
let xtmp7;
let xtmp8;
let xtmp9;
let xtmp10;
let xtmp11;
let xtmp12;
let xtmp13;
let xtmp14;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a7x1)
{
;
return XATS2JS_llazy_free(a7x1);
} // function // stream_vt_free(9)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp14 = g_free_1550_(a4x1);
}
;
} // lam-function
;
xtmp5 = XATS2JS_new_llazy(xtmp16,xtmp17);
return xtmp5;
} // function // auxmain(6)
;
{
xtmp18 = auxmain_9251_(a3x1);
}
;
return xtmp18;
} // function // stream_vt_map0(5)
;
{
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 8948(line=647, offs=1) -- 9840(line=728, offs=8)
function
cstream_vt_split_lines_8464_(a3x1)
{
let xtmp167;
;
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9028(line=656, offs=1) -- 9072(line=660, offs=21)
function
iseol_9031_(a4x1)
{
let xtmp22;
;
{
// ./../../../../xanadu/prelude/DATS/gord.dats: 121(line=12, offs=1) -- 172(line=15, offs=21)
function
g_eq_1500_(a5x1, a5x2)
{
let xtmp25;
let xtmp26;
;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2559(line=185, offs=1) -- 2614(line=186, offs=48)
// { // val-binding
// } // val-binding
const // implval/fun
gint_eq_sint_sint_2293_ = XATS2JS_gint_eq_sint_sint
;
{
// ./../../../../xanadu/prelude/DATS/char.dats: 2035(line=94, offs=1) -- 2067(line=95, offs=25)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 1183(line=91, offs=1) -- 1220(line=92, offs=30)
// { // val-binding
// } // val-binding
const // implval/fun
char_cmp_2060_ = XATS2JS_char_cmp
;
// } // val-binding
const // implval/fun
g_cmp_1644_ = char_cmp_2060_
;
xtmp26 = g_cmp_1644_(a5x1, a5x2);
}
;
xtmp25 = gint_eq_sint_sint_2293_(xtmp26, 0);
}
;
return xtmp25;
} // function // g_eq(12)
;
xtmp22 = g_eq_1500_(a4x1, XATS2JS_char('\n'));
}
;
return xtmp22;
} // function // iseol(11)
;
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9073(line=661, offs=1) -- 9811(line=726, offs=9)
function
auxmain0_9076_(a4x1)
{
let xtmp28;
let xtmp72;
let xtmp73;
;
xtmp72 =
function()
{
let xtmp29;
let xtmp30;
let xtmp31;
let xtmp32;
let xtmp33;
let xtmp34;
let xtmp35;
let xtmp61;
let xtmp62;
let xtmp63;
let xtmp67;
let xtmp68;
xtmp30 = XATS2JS_llazy_eval(a4x1);
{
xtmp31 = 0;
do {
do {
if(0!==xtmp30[0]) break;
xtmp31 = 1;
} while(false);
if(xtmp31 > 0 ) break;
do {
if(1!==xtmp30[0]) break;
//L1PCKany();
//L1PCKany();
xtmp31 = 2;
} while(false);
if(xtmp31 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp31) {
case 1:
{
xtmp29 = [0];
}
;
break;
case 2:
xtmp32 = xtmp30[1];
xtmp33 = xtmp30[2];
{
xtmp34 = iseol_9031_(xtmp32);
}
;
if
(xtmp34)
// then
{
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9297(line=681, offs=3) -- 9321(line=681, offs=27)
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 1592(line=56, offs=1) -- 1660(line=59, offs=23)
function
string_vt_nil_3244_()
{
let xtmp36;
let xtmp60;
{
// ./../../../../xanadu/prelude/DATS/string.dats: 6193(line=432, offs=1) -- 6644(line=476, offs=8)
function
string_vt_make_list_vt_7451_(a7x1)
{
let xtmp48;
let xtmp49;
let xtmp58;
let xtmp59;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6370(line=449, offs=1) -- 6393(line=450, offs=16)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/string.dats: 6397(line=452, offs=1) -- 6639(line=474, offs=5)
function
loop_6400_(a8x1, a8x2, a8x3)
{
let a8y1;
let a8y2;
let a8y3;
let xtmp41;
let xtmp42;
let xtmp43;
let xtmp44;
let xtmp45;
let xtmp46;
let xtmp47;
do {
;
;
;
{
xtmp42 = 0;
do {
do {
if(0!==a8x3[0]) break;
xtmp42 = 1;
} while(false);
if(xtmp42 > 0 ) break;
do {
if(1!==a8x3[0]) break;
//L1PCKany();
//L1PCKany();
xtmp42 = 2;
} while(false);
if(xtmp42 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp42) {
case 1:
{
xtmp41 = [-1];;
}
;
break;
case 2:
xtmp43 = a8x3[1];
xtmp44 = a8x3[2];
// ./../../../../xanadu/prelude/DATS/string.dats: 6596(line=471, offs=1) -- 6635(line=472, offs=31)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8867(line=604, offs=1) -- 9021(line=614, offs=25)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8937(line=610, offs=1) -- 9019(line=613, offs=38)
;
// } // val-binding
const // implval/fun
strtmp_vt_set_at_5715_ = XATS2JS_strtmp_vt_set_at
;
xtmp45 = strtmp_vt_set_at_5715_(a8x1, a8x2, xtmp43);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(45)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(45)));
} // val(H0Pnil())
;
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp47 = gint_succ_sint_1861_(a8x2);
}
;
// tail-recursion:
// L1CMDapp(tmp(46); L1VALfcst(loop(21)); L1VALtmp(arg[1](38)), L1VALtmp(tmp(47)), L1VALtmp(tmp(44)))
a8y1 = a8x1; a8y2 = xtmp47; a8y3 = xtmp44; a8x1 = a8y1; a8x2 = a8y2; a8x3 = a8y3; continue;
}
;
xtmp41 = xtmp46;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp41;
} // function // loop(21)
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6275(line=440, offs=1) -- 6322(line=442, offs=21)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8712(line=593, offs=1) -- 8846(line=602, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8780(line=599, offs=1) -- 8844(line=601, offs=37)
;
// } // val-binding
const // implval/fun
strtmp_vt_alloc_6891_ = XATS2JS_strtmp_vt_alloc
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 2057(line=166, offs=1) -- 2297(line=186, offs=16)
function
list_vt_length_2328_(a8x1)
{
let xtmp57;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 2127(line=172, offs=1) -- 2288(line=185, offs=5)
function
loop_2130_(a9x1, a9x2)
{
let xtmp53;
let xtmp54;
let xtmp55;
let xtmp56;
;
;
{
xtmp54 = 0;
do {
do {
if(0!==a9x1[0]) break;
xtmp54 = 1;
} while(false);
if(xtmp54 > 0 ) break;
do {
if(1!==a9x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp54 = 2;
} while(false);
if(xtmp54 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp54) {
case 1:
xtmp53 = a9x2;
break;
case 2:
xtmp55 = a9x1[2];
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3428(line=245, offs=1) -- 3485(line=246, offs=50)
// { // val-binding
// } // val-binding
const // implval/fun
gint_add_sint_sint_3439_ = XATS2JS_gint_add_sint_sint
;
xtmp56 = gint_add_sint_sint_3439_(a9x2, 1);
}
;
xtmp53 = loop_2130_(xtmp55, xtmp56);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp53;
} // function // loop(29)
;
{
xtmp57 = loop_2130_(a8x1, 0);
}
;
return xtmp57;
} // function // list_vt_length(28)
;
xtmp49 = list_vt_length_2328_(a7x1);
}
;
xtmp48 = strtmp_vt_alloc_6891_(xtmp49);
}
;
;
} // val(H0Pvar(p0(33)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6323(line=443, offs=1) -- 6353(line=444, offs=22)
{
{
xtmp58 = loop_6400_(xtmp48, 0, a7x1);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(58)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(58)));
} // val(H0Pnil())
;
{
xtmp59 = XATS2JS_fcast(xtmp48);
}
;
return xtmp59;
} // function // string_vt_make_list_vt(20)
;
{
xtmp60 = [0];
}
;
xtmp36 = string_vt_make_list_vt_7451_(xtmp60);
}
;
return xtmp36;
} // function // string_vt_nil(19)
;
xtmp35 = string_vt_nil_3244_();
}
;
;
} // val(H0Pvar(l1(22)))
;
{
{
xtmp62 = auxmain0_9076_(xtmp33);
}
;
xtmp61 = [1, xtmp35, xtmp62];
}
;
xtmp29 = xtmp61;
} // if-then
else
{
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9333(line=685, offs=1) -- 9358(line=686, offs=17)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 332(line=32, offs=1) -- 401(line=35, offs=32)
function
list_vt_sing_1720_(a6x1)
{
let xtmp65;
let xtmp66;
;
{
{
xtmp66 = [0];
}
;
xtmp65 = [1, a6x1, xtmp66];
}
;
return xtmp65;
} // function // list_vt_sing(33)
;
xtmp63 = list_vt_sing_1720_(xtmp32);
}
;
;
} // val(H0Pvar(rs(40)))
;
{
xtmp67 = auxmain1_9388_(xtmp33, xtmp63);
}
;
xtmp29 = xtmp67;
} // if-else
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp29;
} // lam-function
;
xtmp73 =
function()
{
let xtmp29;
let xtmp30;
let xtmp31;
let xtmp32;
let xtmp33;
let xtmp34;
let xtmp35;
let xtmp61;
let xtmp62;
let xtmp63;
let xtmp67;
let xtmp68;
{
// ./../../../../xanadu/prelude/DATS/synougat.dats: 211(line=19, offs=1) -- 250(line=21, offs=27)
function
free1_111_(a6x1)
{
let xtmp70;
;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a8x1)
{
;
return XATS2JS_llazy_free(a8x1);
} // function // stream_vt_free(9)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp70 = g_free_1550_(a6x1);
}
;
return xtmp70;
} // function // free1(34)
;
xtmp68 = free1_111_(a4x1);
}
;
} // lam-function
;
xtmp28 = XATS2JS_new_llazy(xtmp72,xtmp73);
return xtmp28;
} // function // auxmain0(18)
function
auxmain1_9388_(a4x1, a4x2)
{
let xtmp76;
let xtmp77;
let xtmp78;
let xtmp79;
let xtmp92;
let xtmp116;
let xtmp124;
let xtmp125;
let xtmp126;
let xtmp127;
let xtmp140;
let xtmp164;
let xtmp165;
let xtmp166;
;
;
xtmp77 = XATS2JS_llazy_eval(a4x1);
{
xtmp78 = 0;
do {
do {
if(0!==xtmp77[0]) break;
xtmp78 = 1;
} while(false);
if(xtmp78 > 0 ) break;
do {
if(1!==xtmp77[0]) break;
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
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9535(line=704, offs=1) -- 9563(line=705, offs=20)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3688(line=300, offs=1) -- 3766(line=303, offs=38)
function
list_vt_reverse_2756_(a5x1)
{
let xtmp81;
let xtmp91;
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3789(line=307, offs=1) -- 4160(line=338, offs=10)
function
list_vt_rappend_2826_(a6x1, a6x2)
{
let xtmp90;
;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3869(line=316, offs=1) -- 4135(line=336, offs=5)
function
loop_3872_(a7x1, a7x2)
{
let xtmp86;
let xtmp87;
let xtmp88;
let xtmp89;
;
;
{
xtmp87 = 0;
do {
do {
if(0!==a7x1[0]) break;
xtmp87 = 1;
} while(false);
if(xtmp87 > 0 ) break;
do {
if(1!==a7x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp87 = 2;
} while(false);
if(xtmp87 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp87) {
case 1:
xtmp86 = a7x2;
break;
case 2:
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 4032(line=331, offs=3) -- 4047(line=331, offs=18)
{
xtmp88 = a7x1[2];
;
} // val(H0Pvar(xs1(53)))
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 4050(line=332, offs=3) -- 4072(line=332, offs=25)
{
XATS2JS_lval_set(XATS2JS_new_cofs(a7x1,2), a7x2);
//L1PCKxpat(H0Pnil(); L1VALnone0());
//L1CMDmatch(H0Pnil(); L1VALnone0());
} // val(H0Pnil())
;
{
xtmp89 = loop_3872_(xtmp88, a7x1);
}
;
xtmp86 = xtmp89;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp86;
} // function // loop(38)
;
{
xtmp90 = loop_3872_(a6x1, a6x2);
}
;
return xtmp90;
} // function // list_vt_rappend(37)
;
{
xtmp91 = [0];
}
;
xtmp81 = list_vt_rappend_2826_(a5x1, xtmp91);
}
;
return xtmp81;
} // function // list_vt_reverse(36)
;
xtmp79 = list_vt_reverse_2756_(a4x2);
}
;
;
} // val(H0Pvar(rs(46)))
;
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9564(line=706, offs=1) -- 9599(line=707, offs=27)
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 6193(line=432, offs=1) -- 6644(line=476, offs=8)
function
string_vt_make_list_vt_7451_(a5x1)
{
let xtmp104;
let xtmp105;
let xtmp114;
let xtmp115;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6370(line=449, offs=1) -- 6393(line=450, offs=16)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/string.dats: 6397(line=452, offs=1) -- 6639(line=474, offs=5)
function
loop_6400_(a6x1, a6x2, a6x3)
{
let a6y1;
let a6y2;
let a6y3;
let xtmp97;
let xtmp98;
let xtmp99;
let xtmp100;
let xtmp101;
let xtmp102;
let xtmp103;
do {
;
;
;
{
xtmp98 = 0;
do {
do {
if(0!==a6x3[0]) break;
xtmp98 = 1;
} while(false);
if(xtmp98 > 0 ) break;
do {
if(1!==a6x3[0]) break;
//L1PCKany();
//L1PCKany();
xtmp98 = 2;
} while(false);
if(xtmp98 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp98) {
case 1:
{
xtmp97 = [-1];;
}
;
break;
case 2:
xtmp99 = a6x3[1];
xtmp100 = a6x3[2];
// ./../../../../xanadu/prelude/DATS/string.dats: 6596(line=471, offs=1) -- 6635(line=472, offs=31)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8867(line=604, offs=1) -- 9021(line=614, offs=25)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8937(line=610, offs=1) -- 9019(line=613, offs=38)
;
// } // val-binding
const // implval/fun
strtmp_vt_set_at_5715_ = XATS2JS_strtmp_vt_set_at
;
xtmp101 = strtmp_vt_set_at_5715_(a6x1, a6x2, xtmp99);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(101)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(101)));
} // val(H0Pnil())
;
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp103 = gint_succ_sint_1861_(a6x2);
}
;
// tail-recursion:
// L1CMDapp(tmp(102); L1VALfcst(loop(21)); L1VALtmp(arg[1](94)), L1VALtmp(tmp(103)), L1VALtmp(tmp(100)))
a6y1 = a6x1; a6y2 = xtmp103; a6y3 = xtmp100; a6x1 = a6y1; a6x2 = a6y2; a6x3 = a6y3; continue;
}
;
xtmp97 = xtmp102;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp97;
} // function // loop(21)
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6275(line=440, offs=1) -- 6322(line=442, offs=21)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8712(line=593, offs=1) -- 8846(line=602, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8780(line=599, offs=1) -- 8844(line=601, offs=37)
;
// } // val-binding
const // implval/fun
strtmp_vt_alloc_6891_ = XATS2JS_strtmp_vt_alloc
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 2057(line=166, offs=1) -- 2297(line=186, offs=16)
function
list_vt_length_2328_(a6x1)
{
let xtmp113;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 2127(line=172, offs=1) -- 2288(line=185, offs=5)
function
loop_2130_(a7x1, a7x2)
{
let xtmp109;
let xtmp110;
let xtmp111;
let xtmp112;
;
;
{
xtmp110 = 0;
do {
do {
if(0!==a7x1[0]) break;
xtmp110 = 1;
} while(false);
if(xtmp110 > 0 ) break;
do {
if(1!==a7x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp110 = 2;
} while(false);
if(xtmp110 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp110) {
case 1:
xtmp109 = a7x2;
break;
case 2:
xtmp111 = a7x1[2];
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3428(line=245, offs=1) -- 3485(line=246, offs=50)
// { // val-binding
// } // val-binding
const // implval/fun
gint_add_sint_sint_3439_ = XATS2JS_gint_add_sint_sint
;
xtmp112 = gint_add_sint_sint_3439_(a7x2, 1);
}
;
xtmp109 = loop_2130_(xtmp111, xtmp112);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp109;
} // function // loop(29)
;
{
xtmp113 = loop_2130_(a6x1, 0);
}
;
return xtmp113;
} // function // list_vt_length(28)
;
xtmp105 = list_vt_length_2328_(a5x1);
}
;
xtmp104 = strtmp_vt_alloc_6891_(xtmp105);
}
;
;
} // val(H0Pvar(p0(33)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6323(line=443, offs=1) -- 6353(line=444, offs=22)
{
{
xtmp114 = loop_6400_(xtmp104, 0, a5x1);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(114)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(114)));
} // val(H0Pnil())
;
{
xtmp115 = XATS2JS_fcast(xtmp104);
}
;
return xtmp115;
} // function // string_vt_make_list_vt(20)
;
xtmp92 = string_vt_make_list_vt_7451_(xtmp79);
}
;
;
} // val(H0Pvar(l1(54)))
;
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1484(line=121, offs=1) -- 1561(line=124, offs=37)
function
strmcon_vt_sing_2027_(a5x1)
{
let xtmp118;
let xtmp119;
;
{
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1210(line=99, offs=1) -- 1271(line=102, offs=25)
function
stream_vt_nil_1837_()
{
let xtmp120;
let xtmp122;
let xtmp123;
xtmp122 =
function()
{
let xtmp121;
{
xtmp121 = [0];
}
;
return xtmp121;
} // lam-function
;
xtmp123 =
function()
{
let xtmp121;
} // lam-function
;
xtmp120 = XATS2JS_new_llazy(xtmp122,xtmp123);
return xtmp120;
} // function // stream_vt_nil(40)
;
xtmp119 = stream_vt_nil_1837_();
}
;
xtmp118 = [1, a5x1, xtmp119];
}
;
return xtmp118;
} // function // strmcon_vt_sing(39)
;
xtmp116 = strmcon_vt_sing_2027_(xtmp92);
}
;
xtmp76 = xtmp116;
break;
case 2:
xtmp124 = xtmp77[1];
xtmp125 = xtmp77[2];
{
xtmp126 = iseol_9031_(xtmp124);
}
;
if
(xtmp126)
// then
{
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9655(line=715, offs=1) -- 9683(line=716, offs=20)
{
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3688(line=300, offs=1) -- 3766(line=303, offs=38)
function
list_vt_reverse_2756_(a5x1)
{
let xtmp129;
let xtmp139;
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3789(line=307, offs=1) -- 4160(line=338, offs=10)
function
list_vt_rappend_2826_(a6x1, a6x2)
{
let xtmp138;
;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 3869(line=316, offs=1) -- 4135(line=336, offs=5)
function
loop_3872_(a7x1, a7x2)
{
let xtmp134;
let xtmp135;
let xtmp136;
let xtmp137;
;
;
{
xtmp135 = 0;
do {
do {
if(0!==a7x1[0]) break;
xtmp135 = 1;
} while(false);
if(xtmp135 > 0 ) break;
do {
if(1!==a7x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp135 = 2;
} while(false);
if(xtmp135 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp135) {
case 1:
xtmp134 = a7x2;
break;
case 2:
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 4032(line=331, offs=3) -- 4047(line=331, offs=18)
{
xtmp136 = a7x1[2];
;
} // val(H0Pvar(xs1(53)))
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 4050(line=332, offs=3) -- 4072(line=332, offs=25)
{
XATS2JS_lval_set(XATS2JS_new_cofs(a7x1,2), a7x2);
//L1PCKxpat(H0Pnil(); L1VALnone0());
//L1CMDmatch(H0Pnil(); L1VALnone0());
} // val(H0Pnil())
;
{
xtmp137 = loop_3872_(xtmp136, a7x1);
}
;
xtmp134 = xtmp137;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp134;
} // function // loop(38)
;
{
xtmp138 = loop_3872_(a6x1, a6x2);
}
;
return xtmp138;
} // function // list_vt_rappend(37)
;
{
xtmp139 = [0];
}
;
xtmp129 = list_vt_rappend_2826_(a5x1, xtmp139);
}
;
return xtmp129;
} // function // list_vt_reverse(36)
;
xtmp127 = list_vt_reverse_2756_(a4x2);
}
;
;
} // val(H0Pvar(rs(58)))
;
// ./../../../../xanadu/xatslib/githwxi/DATS/mygist.dats: 9684(line=717, offs=1) -- 9719(line=718, offs=27)
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 6193(line=432, offs=1) -- 6644(line=476, offs=8)
function
string_vt_make_list_vt_7451_(a5x1)
{
let xtmp152;
let xtmp153;
let xtmp162;
let xtmp163;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6370(line=449, offs=1) -- 6393(line=450, offs=16)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/string.dats: 6397(line=452, offs=1) -- 6639(line=474, offs=5)
function
loop_6400_(a6x1, a6x2, a6x3)
{
let a6y1;
let a6y2;
let a6y3;
let xtmp145;
let xtmp146;
let xtmp147;
let xtmp148;
let xtmp149;
let xtmp150;
let xtmp151;
do {
;
;
;
{
xtmp146 = 0;
do {
do {
if(0!==a6x3[0]) break;
xtmp146 = 1;
} while(false);
if(xtmp146 > 0 ) break;
do {
if(1!==a6x3[0]) break;
//L1PCKany();
//L1PCKany();
xtmp146 = 2;
} while(false);
if(xtmp146 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp146) {
case 1:
{
xtmp145 = [-1];;
}
;
break;
case 2:
xtmp147 = a6x3[1];
xtmp148 = a6x3[2];
// ./../../../../xanadu/prelude/DATS/string.dats: 6596(line=471, offs=1) -- 6635(line=472, offs=31)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8867(line=604, offs=1) -- 9021(line=614, offs=25)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8937(line=610, offs=1) -- 9019(line=613, offs=38)
;
// } // val-binding
const // implval/fun
strtmp_vt_set_at_5715_ = XATS2JS_strtmp_vt_set_at
;
xtmp149 = strtmp_vt_set_at_5715_(a6x1, a6x2, xtmp147);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(149)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(149)));
} // val(H0Pnil())
;
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp151 = gint_succ_sint_1861_(a6x2);
}
;
// tail-recursion:
// L1CMDapp(tmp(150); L1VALfcst(loop(21)); L1VALtmp(arg[1](142)), L1VALtmp(tmp(151)), L1VALtmp(tmp(148)))
a6y1 = a6x1; a6y2 = xtmp151; a6y3 = xtmp148; a6x1 = a6y1; a6x2 = a6y2; a6x3 = a6y3; continue;
}
;
xtmp145 = xtmp150;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp145;
} // function // loop(21)
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6275(line=440, offs=1) -- 6322(line=442, offs=21)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8712(line=593, offs=1) -- 8846(line=602, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8780(line=599, offs=1) -- 8844(line=601, offs=37)
;
// } // val-binding
const // implval/fun
strtmp_vt_alloc_6891_ = XATS2JS_strtmp_vt_alloc
;
{
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 2057(line=166, offs=1) -- 2297(line=186, offs=16)
function
list_vt_length_2328_(a6x1)
{
let xtmp161;
;
// ./../../../../xanadu/prelude/DATS/list_vt.dats: 2127(line=172, offs=1) -- 2288(line=185, offs=5)
function
loop_2130_(a7x1, a7x2)
{
let xtmp157;
let xtmp158;
let xtmp159;
let xtmp160;
;
;
{
xtmp158 = 0;
do {
do {
if(0!==a7x1[0]) break;
xtmp158 = 1;
} while(false);
if(xtmp158 > 0 ) break;
do {
if(1!==a7x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp158 = 2;
} while(false);
if(xtmp158 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp158) {
case 1:
xtmp157 = a7x2;
break;
case 2:
xtmp159 = a7x1[2];
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 3428(line=245, offs=1) -- 3485(line=246, offs=50)
// { // val-binding
// } // val-binding
const // implval/fun
gint_add_sint_sint_3439_ = XATS2JS_gint_add_sint_sint
;
xtmp160 = gint_add_sint_sint_3439_(a7x2, 1);
}
;
xtmp157 = loop_2130_(xtmp159, xtmp160);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp157;
} // function // loop(29)
;
{
xtmp161 = loop_2130_(a6x1, 0);
}
;
return xtmp161;
} // function // list_vt_length(28)
;
xtmp153 = list_vt_length_2328_(a5x1);
}
;
xtmp152 = strtmp_vt_alloc_6891_(xtmp153);
}
;
;
} // val(H0Pvar(p0(33)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 6323(line=443, offs=1) -- 6353(line=444, offs=22)
{
{
xtmp162 = loop_6400_(xtmp152, 0, a5x1);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(162)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(162)));
} // val(H0Pnil())
;
{
xtmp163 = XATS2JS_fcast(xtmp152);
}
;
return xtmp163;
} // function // string_vt_make_list_vt(20)
;
xtmp140 = string_vt_make_list_vt_7451_(xtmp127);
}
;
;
} // val(H0Pvar(l1(59)))
;
{
{
xtmp165 = auxmain0_9076_(xtmp125);
}
;
xtmp164 = [1, xtmp140, xtmp165];
}
;
xtmp76 = xtmp164;
} // if-then
else
{
{
{
xtmp166 = [1, xtmp124, a4x2];
}
;
xtmp76 = auxmain1_9388_(xtmp125, xtmp166);
}
;
} // if-else
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp76;
} // function // auxmain1(35)
;
{
xtmp167 = auxmain0_9076_(a3x1);
}
;
return xtmp167;
} // function // cstream_vt_split_lines(10)
;
{
// ./../../../../xanadu/prelude/DATS/string.dats: 5174(line=336, offs=1) -- 5461(line=364, offs=8)
function
string_streamize_6812_(a3x1)
{
let xtmp170;
let xtmp194;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 5243(line=344, offs=1) -- 5271(line=345, offs=20)
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 3130(line=162, offs=1) -- 3368(line=186, offs=8)
function
string_length_5305_(a4x1)
{
let xtmp183;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 3192(line=170, offs=1) -- 3351(line=184, offs=5)
function
loop_3195_(a5x1, a5x2)
{
let a5y1;
let a5y2;
let xtmp174;
let xtmp178;
let xtmp179;
let xtmp182;
do {
;
;
// ./../../../../xanadu/prelude/DATS/string.dats: 3265(line=177, offs=1) -- 3291(line=178, offs=23)
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 1685(line=63, offs=1) -- 1744(line=66, offs=22)
function
string_nilq_3395_(a6x1)
{
let xtmp176;
let xtmp177;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 951(line=77, offs=1) -- 990(line=78, offs=32)
// { // val-binding
// } // val-binding
const // implval/fun
char_eqzq_1683_ = XATS2JS_char_eqzq
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7837(line=530, offs=1) -- 7965(line=539, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 7905(line=536, offs=1) -- 7963(line=538, offs=31)
;
// } // val-binding
const // implval/fun
string_head_opt_3911_ = XATS2JS_string_head_opt
;
xtmp177 = string_head_opt_3911_(a6x1);
}
;
xtmp176 = char_eqzq_1683_(xtmp177);
}
;
return xtmp176;
} // function // string_nilq(44)
;
xtmp174 = string_nilq_3395_(a5x1);
}
;
;
} // val(H0Pvar(test(66)))
;
if
(xtmp174)
// then
{
xtmp178 = a5x2;
} // if-then
else
{
{
{
// ./../../../../xanadu/prelude/DATS/string.dats: 1879(line=77, offs=1) -- 1928(line=79, offs=22)
function
string_tail_4009_(a6x1)
{
let xtmp181;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8135(line=552, offs=1) -- 8265(line=561, offs=24)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8203(line=558, offs=1) -- 8263(line=560, offs=33)
;
// } // val-binding
const // implval/fun
string_tail_raw_4165_ = XATS2JS_string_tail_raw
;
xtmp181 = string_tail_raw_4165_(a6x1);
}
;
return xtmp181;
} // function // string_tail(49)
;
xtmp179 = string_tail_4009_(a5x1);
}
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp182 = gint_succ_sint_1861_(a5x2);
}
;
// tail-recursion:
// L1CMDapp(tmp(178); L1VALfcst(loop(43)); L1VALtmp(tmp(179)), L1VALtmp(tmp(182)))
a5y1 = xtmp179; a5y2 = xtmp182; a5x1 = a5y1; a5x2 = a5y2; continue;
}
;
} // if-else
;
break;//return
} while( true );
return xtmp178;
} // function // loop(43)
;
{
xtmp183 = loop_3195_(a4x1, 0);
}
;
return xtmp183;
} // function // string_length(42)
;
xtmp170 = string_length_5305_(a3x1);
}
;
;
} // val(H0Pvar(n0(61)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 5272(line=346, offs=1) -- 5459(line=363, offs=8)
function
auxmain_5275_(a4x1)
{
let xtmp185;
let xtmp192;
let xtmp193;
;
xtmp192 =
function()
{
let xtmp186;
let xtmp187;
let xtmp188;
let xtmp189;
let xtmp190;
let xtmp191;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2883(line=207, offs=1) -- 2940(line=208, offs=50)
// { // val-binding
// } // val-binding
const // implval/fun
gint_gte_sint_sint_2466_ = XATS2JS_gint_gte_sint_sint
;
xtmp187 = gint_gte_sint_sint_2466_(a4x1, xtmp170);
}
;
if
(xtmp187)
// then
{
{
xtmp186 = [0];
}
;
} // if-then
else
{
// ./../../../../xanadu/prelude/DATS/string.dats: 5367(line=358, offs=1) -- 5382(line=358, offs=16)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8286(line=563, offs=1) -- 8428(line=574, offs=22)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 8350(line=569, offs=1) -- 8426(line=573, offs=22)
;
// } // val-binding
const // implval/fun
string_get_at_5545_ = XATS2JS_string_get_at
;
xtmp188 = string_get_at_5545_(a3x1, a4x1);
}
;
;
} // val(H0Pvar(ci(73)))
;
// ./../../../../xanadu/prelude/DATS/string.dats: 5383(line=359, offs=1) -- 5400(line=359, offs=18)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp189 = gint_succ_sint_1861_(a4x1);
}
;
;
} // val(H0Pvar(i0(75)))
;
{
{
xtmp191 = auxmain_5275_(xtmp189);
}
;
xtmp190 = [1, xtmp188, xtmp191];
}
;
xtmp186 = xtmp190;
} // if-else
;
return xtmp186;
} // lam-function
;
xtmp193 =
function()
{
let xtmp186;
let xtmp187;
let xtmp188;
let xtmp189;
let xtmp190;
let xtmp191;
} // lam-function
;
xtmp185 = XATS2JS_new_llazy(xtmp192,xtmp193);
return xtmp185;
} // function // auxmain(52)
;
{
xtmp194 = auxmain_5275_(0);
}
;
return xtmp194;
} // function // string_streamize(41)
;
xtmp168 = string_streamize_6812_(a2x1);
}
;
xtmp19 = cstream_vt_split_lines_8464_(xtmp168);
}
;
xtmp2 = stream_vt_map0_4084_(xtmp19);
}
;
return xtmp2;
} // function // string_split_lines(2)
;
{
xtmp195 = JS_doublet_dict();
}
;
xtmp0 = string_split_lines_8197_(xtmp195);
}
;
;
} // val(H0Pvar(ws(1)))
;
// ./JS_doublet.dats: 519(line=36, offs=1) -- 560(line=38, offs=28)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 3261(line=220, offs=1) -- 3441(line=230, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 3337(line=225, offs=1) -- 3353(line=225, offs=17)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 3362(line=227, offs=1) -- 3439(line=229, offs=48)
;
// } // val-binding
const // implval/fun
XATS2JS_jsobjmap_make_nil_2997_ = XATS2JS_jsobjmap_make_nil
;
xtmp196 = XATS2JS_jsobjmap_make_nil_2997_();
}
;
;
} // val(H0Pvar(theDict(76)))
;
// ./JS_doublet.dats: 561(line=39, offs=1) -- 706(line=47, offs=23)
{
// ./JS_doublet.dats: 609(line=43, offs=1) -- 628(line=43, offs=20)
// L1DCLnone1(H0Cnone1(...));
// ./JS_doublet.dats: 629(line=44, offs=1) -- 704(line=46, offs=44)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 8921(line=718, offs=1) -- 9119(line=736, offs=13)
function
stream_vt_foreach0_3963_(a2x1)
{
let xtmp199;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 8975(line=723, offs=1) -- 9096(line=732, offs=25)
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9019(line=727, offs=1) -- 9094(line=731, offs=8)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 8563(line=689, offs=1) -- 8865(line=714, offs=13)
function
stream_vt_forall0_3912_(a3x1)
{
let xtmp215;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 8630(line=695, offs=1) -- 8843(line=713, offs=5)
function
loop_8633_(a4x1)
{
let a4y1;
let xtmp202;
let xtmp203;
let xtmp204;
let xtmp205;
let xtmp206;
let xtmp207;
let xtmp212;
let xtmp213;
do {
;
xtmp203 = XATS2JS_llazy_eval(a4x1);
{
xtmp204 = 0;
do {
do {
if(0!==xtmp203[0]) break;
xtmp204 = 1;
} while(false);
if(xtmp204 > 0 ) break;
do {
if(1!==xtmp203[0]) break;
//L1PCKany();
//L1PCKany();
xtmp204 = 2;
} while(false);
if(xtmp204 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp204) {
case 1:
xtmp202 = true;
break;
case 2:
xtmp205 = xtmp203[1];
xtmp206 = xtmp203[2];
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 8749(line=706, offs=3) -- 8781(line=707, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9019(line=727, offs=1) -- 9094(line=731, offs=8)
function
forall0$test_3538_(a5x1)
{
let xtmp209;
;
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 9053(line=730, offs=1) -- 9082(line=730, offs=30)
{
{
// ./JS_doublet.dats: 629(line=44, offs=1) -- 704(line=46, offs=44)
function
foreach0$work_3681_(a6x1)
{
let xtmp211;
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 5763(line=392, offs=1) -- 5971(line=404, offs=28)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 5843(line=397, offs=1) -- 5859(line=397, offs=17)
// L1DCLnone1(H0Cnone1(...));
// ./../../../../xanadu/prelude/DATS/CATS/JS/jsbasics.dats: 5868(line=399, offs=1) -- 5969(line=403, offs=56)
;
// } // val-binding
const // implval/fun
XATS2JS_jsobjmap_insert_any_5328_ = XATS2JS_jsobjmap_insert_any
;
xtmp211 = XATS2JS_jsobjmap_insert_any_5328_(xtmp196, a6x1, 0);
}
;
return xtmp211;
} // function // foreach0$work(59)
;
xtmp209 = foreach0$work_3681_(a5x1);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(209)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(209)));
} // val(H0Pnil())
;
return true;
} // function // forall0$test(62)
;
xtmp207 = forall0$test_3538_(xtmp205);
}
;
;
} // val(H0Pvar(test(87)))
;
if
(xtmp207)
// then
{
{
// tail-recursion:
// L1CMDapp(tmp(212); L1VALfcst(loop(64)); L1VALtmp(tmp(206)))
a4y1 = xtmp206; a4x1 = a4y1; continue;
}
;
} // if-then
else
{
{
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1837(line=143, offs=1) -- 1892(line=145, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/stream_vt.dats: 1784(line=139, offs=1) -- 1833(line=141, offs=31)
function
stream_vt_free_2236_(a6x1)
{
;
return XATS2JS_llazy_free(a6x1);
} // function // stream_vt_free(9)
;
// } // val-binding
const // implval/fun
g_free_1550_ = stream_vt_free_2236_
;
xtmp213 = g_free_1550_(xtmp206);
}
;
xtmp212 = false;
} // if-else
;
xtmp202 = xtmp212;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp202;
} // function // loop(64)
;
{
xtmp215 = loop_8633_(a3x1);
}
;
return xtmp215;
} // function // stream_vt_forall0(63)
;
xtmp199 = stream_vt_forall0_3912_(a2x1);
}
;
;
} // val(H0Pvar(test(80)))
;
return null;
} // function // stream_vt_foreach0(61)
;
xtmp197 = stream_vt_foreach0_3963_(xtmp0);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(197)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(197)));
} // val(H0Pnil())
;
return xtmp196;
} // function // theDict_make(1)


// ./JS_doublet.dats: 1014(line=67, offs=1) -- 1063(line=69, offs=29)


// ./JS_doublet.dats: 1067(line=71, offs=1) -- 1529(line=103, offs=8)
function
ATS_doublet_call()
{
let xtmp216;
let xtmp217;
let xtmp218;
let xtmp219;
let xtmp220;
let xtmp240;
let xtmp241;
let xtmp255;
// ./JS_doublet.dats: 1100(line=74, offs=1) -- 1197(line=81, offs=19)
{
// ./JS_doublet.dats: 1144(line=78, offs=1) -- 1195(line=80, offs=31)
;
{
xtmp216 = JS_doublet_word1();
}
;
;
} // val(H0Pvar(w1(90)))
;
// ./JS_doublet.dats: 1198(line=82, offs=1) -- 1295(line=89, offs=19)
{
// ./JS_doublet.dats: 1242(line=86, offs=1) -- 1293(line=88, offs=31)
;
{
xtmp217 = JS_doublet_word2();
}
;
;
} // val(H0Pvar(w2(92)))
;
// ./JS_doublet.dats: 1296(line=90, offs=1) -- 1330(line=90, offs=35)
{
{
xtmp218 = doublet_play_263_(xtmp216, xtmp217);
}
;
;
} // val(H0Pvar(opt(94)))
;
{
xtmp220 = 0;
do {
do {
if(0!==xtmp218[0]) break;
xtmp220 = 1;
} while(false);
if(xtmp220 > 0 ) break;
do {
if(1!==xtmp218[0]) break;
//L1PCKany();
xtmp220 = 2;
} while(false);
if(xtmp220 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp220) {
case 1:
{
// ./../../../../xanadu/prelude/DATS/synougat.dats: 6161(line=512, offs=1) -- 6283(line=527, offs=13)
function
println_5_2132_(a2x1, a2x2, a2x3, a2x4, a2x5)
{
let xtmp226;
let xtmp238;
;
;
;
;
;
{
// ./../../../../xanadu/prelude/DATS/synougat.dats: 3887(line=325, offs=1) -- 4114(line=343, offs=12)
function
print_5_733_(a3x1, a3x2, a3x3, a3x4, a3x5)
{
let xtmp232;
let xtmp233;
let xtmp234;
let xtmp235;
let xtmp236;
let xtmp237;
;
;
;
;
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 3970(line=338, offs=3) -- 3996(line=338, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp232 = gl_print1_2233_(a3x1);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(232)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(232)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 3999(line=339, offs=3) -- 4025(line=339, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp233 = gl_print1_2233_(a3x2);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(233)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(233)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4028(line=340, offs=3) -- 4054(line=340, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp234 = gl_print1_2233_(a3x3);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(234)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(234)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4057(line=341, offs=3) -- 4083(line=341, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp235 = gl_print1_2233_(a3x4);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(235)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(235)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4086(line=342, offs=3) -- 4112(line=342, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp236 = gl_print1_2233_(a3x5);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(236)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(236)));
} // val(H0Pnil())
;
{
xtmp237 = [-1];;
}
;
return xtmp237;
} // function // print_5(71)
;
xtmp226 = print_5_733_(a2x1, a2x2, a2x3, a2x4, a2x5);
}
;
{
// ./../../../../xanadu/prelude/DATS/synougat.dats: 5533(line=453, offs=1) -- 5586(line=456, offs=26)
function
println_0_1752_()
{
let xtmp239;
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp239 = gl_print1_2233_("\n");
}
;
return xtmp239;
} // function // println_0(76)
;
xtmp238 = println_0_1752_();
}
;
return xtmp238;
} // function // println_5(70)
;
xtmp219 = println_5_2132_("[", xtmp216, "] and [", xtmp217, "] are not a doublet!");
}
;
break;
case 2:
xtmp240 = xtmp218[1];
// ./JS_doublet.dats: 1442(line=99, offs=1) -- 1462(line=99, offs=21)
{
{
// ./../../../../xanadu/prelude/DATS/list.dats: 3364(line=297, offs=1) -- 3442(line=303, offs=8)
function
list_reverse_3062_(a2x1)
{
let xtmp243;
let xtmp254;
;
{
// ./../../../../xanadu/prelude/DATS/list.dats: 2782(line=246, offs=1) -- 3020(line=267, offs=8)
function
list_rappend_2835_(a3x1, a3x2)
{
let xtmp253;
;
;
// ./../../../../xanadu/prelude/DATS/list.dats: 2854(line=254, offs=1) -- 3018(line=266, offs=5)
function
loop_2857_(a4x1, a4x2)
{
let xtmp248;
let xtmp249;
let xtmp250;
let xtmp251;
let xtmp252;
;
;
{
xtmp249 = 0;
do {
do {
if(0!==a4x1[0]) break;
xtmp249 = 1;
} while(false);
if(xtmp249 > 0 ) break;
do {
if(1!==a4x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp249 = 2;
} while(false);
if(xtmp249 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp249) {
case 1:
xtmp248 = a4x2;
break;
case 2:
xtmp250 = a4x1[1];
xtmp251 = a4x1[2];
{
{
xtmp252 = [1, xtmp250, a4x2];
}
;
xtmp248 = loop_2857_(xtmp251, xtmp252);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp248;
} // function // loop(79)
;
{
xtmp253 = loop_2857_(a3x1, a3x2);
}
;
return xtmp253;
} // function // list_rappend(78)
;
{
xtmp254 = [0];
}
;
xtmp243 = list_rappend_2835_(a2x1, xtmp254);
}
;
return xtmp243;
} // function // list_reverse(77)
;
xtmp241 = list_reverse_3062_(xtmp240);
}
;
;
} // val(H0Pvar(ws(109)))
;
{
// ./../../../../xanadu/prelude/DATS/synougat.dats: 6335(line=531, offs=1) -- 6470(line=547, offs=13)
function
println_6_2259_(a2x1, a2x2, a2x3, a2x4, a2x5, a2x6)
{
let xtmp262;
let xtmp309;
;
;
;
;
;
;
{
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4141(line=347, offs=1) -- 4407(line=368, offs=12)
function
print_6_858_(a3x1, a3x2, a3x3, a3x4, a3x5, a3x6)
{
let xtmp269;
let xtmp270;
let xtmp271;
let xtmp272;
let xtmp273;
let xtmp274;
let xtmp308;
;
;
;
;
;
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4234(line=362, offs=3) -- 4260(line=362, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp269 = gl_print1_2233_(a3x1);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(269)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(269)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4263(line=363, offs=3) -- 4289(line=363, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp270 = gl_print1_2233_(a3x2);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(270)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(270)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4292(line=364, offs=3) -- 4318(line=364, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp271 = gl_print1_2233_(a3x3);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(271)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(271)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4321(line=365, offs=3) -- 4347(line=365, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp272 = gl_print1_2233_(a3x4);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(272)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(272)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4350(line=366, offs=3) -- 4376(line=366, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp273 = gl_print1_2233_(a3x5);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(273)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(273)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/synougat.dats: 4379(line=367, offs=3) -- 4405(line=367, offs=29)
{
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/list.dats: 7521(line=651, offs=1) -- 7577(line=654, offs=23)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/gseq.dats: 1915(line=160, offs=1) -- 2258(line=192, offs=8)
function
gseq_print_1299_(a6x1)
{
let xtmp276;
let xtmp278;
let xtmp306;
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 1956(line=165, offs=1) -- 1989(line=166, offs=25)
{
{
// ./../../../../xanadu/prelude/DATS/list.dats: 7581(line=656, offs=1) -- 7645(line=659, offs=35)
function
gseq_print$beg_1344_()
{
let xtmp277;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
xtmp277 = string_print_4753_("(");
}
;
return xtmp277;
} // function // gseq_print$beg(83)
;
xtmp276 = gseq_print$beg_1344_();
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(276)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(276)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 1993(line=168, offs=1) -- 2191(line=187, offs=7)
{
// ./../../../../xanadu/prelude/DATS/gseq.dats: 2045(line=174, offs=1) -- 2174(line=185, offs=8)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14990(line=1224, offs=1) -- 15182(line=1240, offs=8)
function
gseq_iforeach_5155_(a7x1)
{
let xtmp280;
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 15031(line=1228, offs=1) -- 15162(line=1237, offs=25)
{
// ./../../../../xanadu/prelude/DATS/gseq.dats: 15075(line=1232, offs=1) -- 15160(line=1236, offs=8)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14634(line=1194, offs=1) -- 14935(line=1220, offs=8)
function
gseq_iforall_5108_(a8x1)
{
let xtmp282;
let xtmp283;
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14677(line=1199, offs=1) -- 14693(line=1199, offs=17)
{
xtmp282 = XATS2JS_new_var1(0);
} // val(i0(140))
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14694(line=1200, offs=1) -- 14712(line=1200, offs=19)
{
;
} // val(H0Pvar(p0(141)))
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14726(line=1205, offs=1) -- 14868(line=1215, offs=8)
// L1DCLnone0();
{
// ./../../../../xanadu/prelude/DATS/list.dats: 7884(line=677, offs=1) -- 7939(line=679, offs=41)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/list.dats: 3488(line=307, offs=1) -- 3691(line=323, offs=13)
function
list_forall_3143_(a10x1)
{
let xtmp305;
;
// ./../../../../xanadu/prelude/DATS/list.dats: 3546(line=312, offs=1) -- 3689(line=322, offs=5)
function
loop_3549_(a11x1)
{
let xtmp286;
let xtmp287;
let xtmp288;
let xtmp289;
let xtmp290;
;
{
xtmp287 = 0;
do {
do {
if(0!==a11x1[0]) break;
xtmp287 = 1;
} while(false);
if(xtmp287 > 0 ) break;
do {
if(1!==a11x1[0]) break;
//L1PCKany();
//L1PCKany();
xtmp287 = 2;
} while(false);
if(xtmp287 > 0 ) break;
} while(false);
} // case-patck0
switch
(xtmp287) {
case 1:
xtmp286 = true;
break;
case 2:
xtmp288 = a11x1[1];
xtmp289 = a11x1[2];
{
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14726(line=1205, offs=1) -- 14868(line=1215, offs=8)
function
forall$test_3500_(a12x1)
{
let xtmp292;
let xtmp293;
let xtmp294;
let xtmp295;
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14793(line=1211, offs=1) -- 14824(line=1212, offs=23)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/unsafe.dats: 239(line=19, offs=1) -- 292(line=21, offs=35)
// { // val-binding
// } // val-binding
const // implval/fun
p2tr_get_1962_ = XATS2JS_UN_p2tr_get
;
xtmp292 = p2tr_get_1962_(xtmp282);
}
;
;
} // val(H0Pvar(i0(143)))
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 14825(line=1213, offs=1) -- 14866(line=1214, offs=33)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/unsafe.dats: 401(line=30, offs=1) -- 454(line=32, offs=35)
// { // val-binding
// } // val-binding
const // implval/fun
p2tr_set_1998_ = XATS2JS_UN_p2tr_set
;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2015(line=148, offs=1) -- 2064(line=149, offs=42)
// { // val-binding
// } // val-binding
const // implval/fun
gint_succ_sint_1861_ = XATS2JS_gint_succ_sint
;
xtmp294 = gint_succ_sint_1861_(xtmp292);
}
;
xtmp293 = p2tr_set_1998_(xtmp282, xtmp294);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(293)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(293)));
} // val(H0Pnil())
;
{
// ./../../../../xanadu/prelude/DATS/gseq.dats: 15075(line=1232, offs=1) -- 15160(line=1236, offs=8)
function
iforall$test_5435_(a13x1, a13x2)
{
let xtmp298;
;
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 15114(line=1235, offs=1) -- 15148(line=1235, offs=35)
{
{
// ./../../../../xanadu/prelude/DATS/gseq.dats: 2045(line=174, offs=1) -- 2174(line=185, offs=8)
function
iforeach$work_5677_(a14x1, a14x2)
{
let xtmp301;
let xtmp302;
let xtmp304;
;
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 2116(line=181, offs=3) -- 2172(line=184, offs=32)
{
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/basics.dats: 2400(line=174, offs=1) -- 2455(line=175, offs=48)
// { // val-binding
// } // val-binding
const // implval/fun
gint_gt_sint_sint_2209_ = XATS2JS_gint_gt_sint_sint
;
xtmp302 = gint_gt_sint_sint_2209_(a14x1, 0);
}
;
if
(xtmp302)
// then
{
{
// ./../../../../xanadu/prelude/DATS/list.dats: 7711(line=664, offs=1) -- 7775(line=667, offs=35)
function
gseq_print$sep_1446_()
{
let xtmp303;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
xtmp303 = string_print_4753_(";");
}
;
return xtmp303;
} // function // gseq_print$sep(86)
;
xtmp301 = gseq_print$sep_1446_();
}
;
} // if-then
else
{
} // if-else
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(301)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(301)));
} // val(H0Pnil())
;
{
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
xtmp304 = g_print_2168_(a14x2);
}
;
return xtmp304;
} // function // iforeach$work(84)
;
xtmp298 = iforeach$work_5677_(a13x1, a13x2);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(298)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(298)));
} // val(H0Pnil())
;
return true;
} // function // iforall$test(88)
;
xtmp295 = iforall$test_5435_(xtmp292, a12x1);
}
;
return xtmp295;
} // function // forall$test(90)
;
xtmp290 = forall$test_3500_(xtmp288);
}
;
if
(xtmp290)
// then
{
{
xtmp286 = loop_3549_(xtmp289);
}
;
} // if-then
else
{
xtmp286 = false;
} // if-else
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp286;
} // function // loop(95)
;
{
xtmp305 = loop_3549_(a10x1);
}
;
return xtmp305;
} // function // list_forall(94)
;
// } // val-binding
const // implval/fun
gseq_forall_1939_ = list_forall_3143_
;
xtmp283 = gseq_forall_1939_(a8x1);
}
;
return xtmp283;
} // function // gseq_iforall(89)
;
xtmp280 = gseq_iforall_5108_(a7x1);
}
;
;
} // val(H0Pvar(test(136)))
;
return null;
} // function // gseq_iforeach(87)
;
xtmp278 = gseq_iforeach_5155_(a6x1);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(278)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(278)));
} // val(H0Pnil())
;
// ./../../../../xanadu/prelude/DATS/gseq.dats: 2207(line=189, offs=1) -- 2248(line=190, offs=33)
{
{
// ./../../../../xanadu/prelude/DATS/list.dats: 7646(line=660, offs=1) -- 7710(line=663, offs=35)
function
gseq_print$end_1395_()
{
let xtmp307;
{
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
xtmp307 = string_print_4753_(")");
}
;
return xtmp307;
} // function // gseq_print$end(99)
;
xtmp306 = gseq_print$end_1395_();
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(306)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(306)));
} // val(H0Pnil())
;
return null;
} // function // gseq_print(82)
;
// } // val-binding
const // implval/fun
g_print_2168_ = gseq_print_1299_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp274 = gl_print1_2233_(a3x6);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(274)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(274)));
} // val(H0Pnil())
;
{
xtmp308 = [-1];;
}
;
return xtmp308;
} // function // print_6(81)
;
xtmp262 = print_6_858_(a2x1, a2x2, a2x3, a2x4, a2x5, a2x6);
}
;
{
// ./../../../../xanadu/prelude/DATS/synougat.dats: 5533(line=453, offs=1) -- 5586(line=456, offs=26)
function
println_0_1752_()
{
let xtmp310;
{
// ./../../../../xanadu/prelude/DATS/gbas.dats: 825(line=82, offs=1) -- 865(line=84, offs=26)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/string.dats: 8281(line=614, offs=1) -- 8317(line=615, offs=29)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 915(line=80, offs=1) -- 1034(line=89, offs=21)
// { // val-binding
// ./../../../../xanadu/prelude/DATS/CATS/JS/g_print.dats: 977(line=86, offs=1) -- 1032(line=88, offs=31)
;
// } // val-binding
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
// } // val-binding
const // implval/fun
g_print_2168_ = string_print_4753_
;
// } // val-binding
const // implval/fun
gl_print1_2233_ = g_print_2168_
;
xtmp310 = gl_print1_2233_("\n");
}
;
return xtmp310;
} // function // println_0(76)
;
xtmp309 = println_0_1752_();
}
;
return xtmp309;
} // function // println_6(80)
;
xtmp255 = println_6_2259_("[", xtmp216, "] and [", xtmp217, "] are a doublet:", xtmp241);
}
;
xtmp219 = xtmp255;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp219;
} // function // ATS_doublet_call(66)


