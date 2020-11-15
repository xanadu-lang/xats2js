/* ****** ****** */
//
// For testing the factorial function
//
/* ****** ****** */
var
JS_factorial_arg0 =
document.getElementById("JS_factorial_arg0");
/* ****** ****** */
var
JS_factorial_output =
document.getElementById("JS_factorial_output");
//
/* ****** ****** */
//
function
JS_factorial_args_rand()
{
//
var MAX0 = 10;
//
JS_factorial_arg0.value =
Math.floor((1+MAX0)*Math.random()).toString();
//
return;
} // end of [JS_factorial_args_rand()]
//
/* ****** ****** */
//
function
JS_factorial_arg0_int()
{
  return parseInt( JS_factorial_arg0.value, 10 );
}
//
/* ****** ****** */  
//
function
JS_factorial_func_call()
{
//
XATS2JS_the_print_store_clear();
//
JS_factorial_main(/*entry*/);
//
JS_factorial_output.innerHTML = XATS2JS_the_print_store_join();
//
return;
//
} // end of [JS_factorial_func_call()]
//
/* ****** ****** */
//
// For testing the ackermann function
//
/* ****** ****** */
var
JS_ackermann_arg0 =
document.getElementById("JS_ackermann_arg0");
var
JS_ackermann_arg1 =
document.getElementById("JS_ackermann_arg1");
/* ****** ****** */
var
JS_ackermann_output =
document.getElementById("JS_ackermann_output");
//
/* ****** ****** */
//
function
JS_ackermann_args_rand()
{
//
var MAX0 = 3;
var MAX1 = 10;
//
JS_ackermann_arg0.value =
Math.floor((1+MAX0)*Math.random()).toString();
JS_ackermann_arg1.value =
Math.floor((1+MAX1)*Math.random()).toString();
//
return;
} // end of [JS_ackermann_args_rand()]
//
/* ****** ****** */
//
function
JS_ackermann_arg0_int()
{
  return parseInt( JS_ackermann_arg0.value, 10 );
}
function
JS_ackermann_arg1_int()
{
  return parseInt( JS_ackermann_arg1.value, 10 );
}
//
/* ****** ****** */  
//
function
JS_ackermann_func_call()
{
//
XATS2JS_the_print_store_clear();
//
JS_ackermann_main(/*entry*/);
//
JS_ackermann_output.innerHTML = XATS2JS_the_print_store_join();
//
return;
//
} // end of [JS_ackermann_func_call()]
//
/* ****** ****** */

/* end of [Functest.cats] */
