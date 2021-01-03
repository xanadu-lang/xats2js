# Doublet

Doublet is a word game invented by Lewis Carroll (1832-1898), the
author of children's classics "Alice in Wonderland".
For a description of this game, please visit, for instance, this [link](http://www.logicville.com/doublets.htm).
And for playing the game, you may click [here](https://xanadu-lang.github.io/xats2js/docgen/CodeBook/Doublet/2020-11-29/.).

## Algorithm

Let us define a relation N(w1, w2) between two words: The relation
holds if and only if w1 and w2 are of the same length and they differ
at exactly one position. For instance, N("head", "heat") holds and
N("head", "heed") holds as well. Clearly, this relation is symmetric
but not reflexive. Given a word w1, the neighbors of w1 consist of all
the words w2 such that N(w1, w2) hold. With this defintion of
neighbors, we can define a corresponding graph G. Given two words w1
and w2, determining whether they form a doublet is the same as
determining whether there is a path connecting w1 to w2 in the graph
G, which can be implemented as a typical graph-based breadth search.

## Implementation

An implementation is given that makes direct use of breadth-first
graph streamization.
