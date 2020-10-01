######
#
# For testing xats2js
#
######

ECHO=echo

######

XATS2JS="./../../bin/xats2js"

######
all:: test
######
#
test:: bools
bools: ; \
$(XATS2JS) -d ./prelude/bools.dats
test:: chars
chars: ; \
$(XATS2JS) -d ./prelude/chars.dats
#
######
#
test:: lists
lists: ; \
$(XATS2JS) -d ./prelude/lists.dats
test:: strms
strms: ; \
$(XATS2JS) -d ./prelude/strms.dats
#
######
#
test:: addrs
addrs: ; \
$(XATS2JS) -d ./prelude/addrs.dats
#
test:: pswap
pswap: ; \
$(XATS2JS) -d ./prelude/pswap.dats
#
######
#
test:: cbref
cbref: ; \
$(XATS2JS) -d ./prelude/cbref.dats
#
######
#
test:: foldl
foldl: ; \
$(XATS2JS) -d ./prelude/foldl.dats
#
######
#
test:: kfact
kfact: ; \
$(XATS2JS) -d ./prelude/kfact.dats
test:: kfibo
kfibo: ; \
$(XATS2JS) -d ./prelude/kfibo.dats
test:: kisevn
kisevn: ; \
$(XATS2JS) -d ./prelude/kisevn.dats
#
######
test:: koka-amb
koka-amb: ; \
$(XATS2JS) -d ./prelude/koka-amb.dats
######
#
test:: isAVL
isAVL: ; \
$(XATS2JS) -d ./prelude/isAVL.dats
test:: rfind
rfind: ; \
$(XATS2JS) -d ./prelude/rfind.dats
#
######
test:: sieve
sieve: ; \
$(XATS2JS) -d ./prelude/sieve.dats
test:: sieve1
sieve1: ; \
$(XATS2JS) -d ./prelude/sieve1.dats
######
test:: sieve_vt
sieve_vt: ; \
$(XATS2JS) -d ./prelude/sieve_vt.dats
test:: sieve1_vt
sieve1_vt: ; \
$(XATS2JS) -d ./prelude/sieve1_vt.dats
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
######
###### end of [Makefile] ######

