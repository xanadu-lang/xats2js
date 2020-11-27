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
let output =
XATS2JS_the_print_store_join();
XATS2JS_the_print_store_clear();
alert(output);
JS_spelling_output.innerHTML = output;
}
