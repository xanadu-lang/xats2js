/* ****** ****** */
var
JS_Functest_arg0 =
document.getElementById("JS_Functest_arg0");
/* ****** ****** */
var
JS_Functest_output =
document.getElementById("JS_Functest_output");
//
/* ****** ****** */
//
function
JS_Functest_args_rand()
{
//
var MAX0 = 10;
//
JS_Functest_arg0.value =
Math.floor(1+MAX0*Math.random()).toString();
//
return;
} // end of [JS_Functest_args_rand()]
//
/* ****** ****** */
//
function
JS_Functest_arg0_int()
{
  return parseInt( JS_Functest_arg0.value, 10 );
}
//
/* ****** ****** */  
//
function
JS_Functest_func_call()
{
//
XATS2JS_the_print_store_clear();
//
JS_Functest_main(/*entry*/);
//
JS_Functest_output.innerHTML = XATS2JS_the_print_store_join();
//
return;
//
} // end of [JS_Functest_func_call()]
//
/* ****** ****** */

/* end of [Functest1.cats] */
