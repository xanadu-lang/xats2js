var nil = () => [0]
var cons = (x0, xs) => [1, x0, xs]

var xs0 = nil()
var xs1 = cons(1, xs0)
var xs2 = cons(2, xs1)

var fst = xs2[1]
var snd = xs2[2][1]

console.log("fst=", fst)
console.log("snd=", snd)
