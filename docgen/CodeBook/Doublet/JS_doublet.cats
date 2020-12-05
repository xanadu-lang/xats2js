/* ****** ****** */

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

/* ****** ****** */

/* end of [JS_doublet.cats] */
