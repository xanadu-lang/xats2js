# CodeBook

This directory contains coding examples of all sorts written in
ATS3 and possibly other programming languages. These examples
are primarily meant as recipes for people interested in learning
ATS3 as well as using it to construct software for use in the
real world.

ATS3 can be seen as a generic programming language that targets a
variety of other programming languages such as C/C++ and JS (that is,
JavaScript). The examples in this directory can be first compiled to
XATSCML (by xatsopt) and then from XATSCML to JS (by xats2js), where
XATSCML refers to an intermediate language of some C-likeness (e.g.,
supporting native unboxed data representation) and ML-likeness (e.g.,
supporting pattern matching and higher-order functions).

## [CodeBook/Hello](./Hello)

This example gives a brief introduction to co-programming
with ATS and JS.

## [CodeBook/Doublet](./Doublet)

This example implements Doublet, a word game by Lewis Carrol (of the
fame of "Alice in Wonderland")

## [CodeBook/Spelling](./Spelling)

This example implements a simple word game that asks the player to use
a given subset of the English alphabet to form words that must contain
a specified letter.


