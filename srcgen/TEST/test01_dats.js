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
fact(x0a1)
{
var tmp10;
//L1DCLfundecl(LFUNDECL@{nam=loop(5), hdc=loop(3), hag=HFARGnpats(-1; H0Pvar(i(6)), H0Pvar(r(7))), def=Some(L1VALtmp(tmp(4))), hag_blk=L1BLKsome(L1CMDassrt(L1BTFbtf(true)), L1CMDassrt(L1BTFbtf(true))), def_blk=L1BLKsome(L1CMDapp(tmp(5); L1VALtcst(gint_lt_sint_sint(4)(1)); L1VALtmp(arg[1](2)), L1VALtmp(arg[1](1))), L1CMDif0(L1VALtmp(tmp(5)); L1BLKsome(L1CMDapp(tmp(7); L1VALtcst(gint_add_sint_sint(0)(2)); L1VALtmp(arg[1](2)), L1VALint(INT1(1))), L1CMDapp(tmp(9); L1VALtcst(gint_add_sint_sint(0)(4)); L1VALtmp(arg[1](2)), L1VALint(INT1(1))), L1CMDapp(tmp(8); L1VALtcst(gint_mul_sint_sint(6)(3)); L1VALtmp(tmp(9)), L1VALtmp(arg[2](3))), L1CMDapp(tmp(6); L1VALfcst(loop(3)); L1VALtmp(tmp(7)), L1VALtmp(tmp(8))), L1CMDmov(tmp(4); L1VALtmp(tmp(6)))); L1BLKsome(L1CMDmov(tmp(4); L1VALtmp(arg[2](3)))))), })
function
loop(arg1, arg2)
{
var tmp4;
var tmp5;
var tmp6;
var tmp7;
var tmp8;
var tmp9;
tmp5 = (arg1 < x0a1);
if
(tmp5)
// then
{
tmp7 = (arg1 + 1);
tmp9 = (arg1 + 1);
tmp8 = (tmp9 * arg2);
tmp6 = loop(tmp7, tmp8);
tmp4 = tmp6;
} // if-then
else
{
tmp4 = arg2;
} // if-else
;
return tmp4;
} // function
;
tmp10 = loop(0, 1);
return tmp10;
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
