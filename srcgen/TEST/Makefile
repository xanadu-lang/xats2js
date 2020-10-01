######
#
# For testing xats2js
#
######

ECHO=echo

######

XATS2JS="./../../bin/xats2js"

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

######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
###### end of [Makefile] ######

