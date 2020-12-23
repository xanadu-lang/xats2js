function
JS_spelling_arg0()
{
    return document.getElementById("JS_spelling_arg0").value;
}
function
JS_spelling_arg1()
{
    return document.getElementById("JS_spelling_arg1").value;
}
function
JS_spelling_dict()
{
    return document.getElementById("JS_spelling_dict").innerText;
}

function
JS_spelling_call()
{
//
ATS_spelling_call();
//
ATS_theWords_print1();
let output1 =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
alert(output1);
//
ATS_theWords_print2();
let output2 =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
JS_spelling_output.innerHTML = output2;
//
}

/* ****** ****** */

/* end of [JS_spelling.cats] */

