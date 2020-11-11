###### beg of [README.txt] ######

This midterm asks you to implement the
following two items for the programming
language LAMBDA:

1.
(100 points)
a closure-based interpreter

2.
(100 points)
a type checker (based on type inference).
Please note that your implementation is
required to handle the issue of occurs-check.

The datatype for the abstract syntax for
LAMBDA is given in the file midterm.sats,
WHICH SHOULD NOT BE MODIFIED WITH CONSULTING
ME FIRST.

Your submitted code should be put into the
MySolution directory. Please include a README
and a Makefile.

######

Testing:

Your implementation is expected to handle
the following two examples

1.
(20 points)
Please implement a function of the name
isPrime, which tests whether a given natural
number is a prime or not. A prime number is
one that does not have non-trivial factors,
that is, factors that are not 1 or itself.

2.
(30 points)
Please translate the following 8-queen
puzzle implementation into LAMBDA:

http://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/HTMLTOC/x631.html

######

If libxatsopt is not already built, please
do the following first:

make libxatsopt libxatsopt_clean

###### end of [README.txt] ######
