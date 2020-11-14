/* ****** ****** */
var
Functest_arg0 =
document.getElementById("Functest_arg0");
var
Functest_arg1 =
document.getElementById("Functest_arg1");
/* ****** ****** */
var
Functest_output =
document.getElementById("Functest_output");
//
/* ****** ****** */
//
function
Functest_args_rand()
{
//
var MAX0 = 3;
var MAX1 = 10;
//
Functest_arg0.value =
Math.floor(1+MAX0*Math.random()).toString();
Functest_arg1.value =
Math.floor(1+MAX1*Math.random()).toString();
//
return;
} // end of [Functest_args_rand()]
//
/* ****** ****** */
//
function
Functest_arg0_int()
{
  return parseInt( Functest_arg0.value, 10 );
}
function
Functest_arg1_int()
{
  return parseInt( Functest_arg1.value, 10 );
}
//
/* ****** ****** */  
//
function
Functest_func_call()
{
//
XATS2JS_the_print_store_clear();
//
Functest_main(/*entry*/);
//
Functest_output.innerHTML = XATS2JS_the_print_store_join();
//
return;
//
} // end of [Functest_func_call()]
//
/* ****** ****** */

/* end of [Functest.cats] */
