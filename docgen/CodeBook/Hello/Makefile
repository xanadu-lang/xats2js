######
#
# A simple Makefile
#
######
#
# HX-2018-01-05:
# TEMPTORY is environmental
#
######

RMF=rm -f

######

XATS2JS=\
"./../../../bin/xats2js"

######

all:: hello_dats.js

######

testall:: all
testall:: regress
testall:: cleanall

######

regress:: \
hello_dats.js; \
$(NODE) ./hello_dats.js

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) hello_dats.js

######

%_dats.js: %.dats; $(XATS2JS) -o $@ -d $<

######

###### end of [Makefile] ######
