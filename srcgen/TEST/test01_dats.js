//
// HX-2020-09-10
//
/*
function
fact
(arg1)
{
var tmp2;
var tmp3;
var tmp4;
var tmp5;

tmp3 = (arg1 > 0);

if
(tmp3)
// then
{
tmp6 = arg1 - 1;
tmp5 = fact(tmp6);
tmp4 = arg1 * tmp5;
tmp2 = tmp4;
} // then
else
{
tmp2 = 1;
} // else
;
return tmp2;
} // function
*/

function
fact(a1x1)
{
var tmp10;
function
loop__3(a2x1, a2x2)
{
var tmp4;
var tmp5;
var tmp6;
var tmp7;
var tmp8;
var tmp9;

while(true)
{
tmp5 = (a2x1 < a1x1);
if
(tmp5)
// then
{
tmp7 = (a2x1 + 1);
tmp9 = (a2x1 + 1);
tmp8 = (tmp9 * a2x2);
{
    a2x1 = tmp7;
    a2x2 = tmp8; continue;
}
} // if-then
else
{
tmp4 = a2x2;
} // if-else
break; // while-break
}
;
return tmp4;
} // function
;
tmp10 = loop__3(0, 1);
return tmp10;
} // function

console.log("fact(10) =", fact(10))

/* ****** ****** */

function
fact2
(arg1, arg2)
{

var tmp10;
var tmp11;
var tmp12;
var tmp13;

tmp10 = (arg1 > 0)
if
(tmp10)
// then
{
tmp12 = (arg1 - 1);
tmp13 = (arg1 * arg2);
tmp11 = fact2(tmp12, tmp13);
tmp9 = tmp11;
} // then
else
{
tmp9 = arg2;
} // else
;
return tmp9;
} // function

console.log("fact2(10, 1) =", fact2(10, 1))

/* ****** ****** */

function
fact2_(arg1)
{
return function(arg2)
{
var tmp9;
var tmp10;
var tmp11;
var tmp12;
var tmp13;
var tmp14;
tmp10 = (arg1 > 0);
if
(tmp10)
// then
{
tmp13 = (arg1 - 1);
tmp12 = fact2_(tmp13);
tmp14 = (arg1 * arg2);
tmp11 = tmp12(tmp14);
tmp9 = tmp11;
} // if-then
else
{
tmp9 = arg2;
} // if-else
;
return tmp9;
} // function
} // function

console.log("fact2_(10)(1) =", fact2_(10)(1))

/* ****** ****** */
