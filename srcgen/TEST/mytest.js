

function
foo(x, y)
{
    function bar(y)
    { 
	function bar(x) { return x + 10; }; return bar(y) + 1
    }
    var tmp1
    {
	tmp1 = bar(x)
    }
    var tmp2
    {
	tmp2 = bar(y)
    }
    console.log("tmp1 =", tmp1);
    console.log("tmp2 =", tmp2);
    return;
}


foo(1, 10)

