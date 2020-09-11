//
// HX-2020-09-10
//
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

console.log("fact(10) =", fact(10))

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
