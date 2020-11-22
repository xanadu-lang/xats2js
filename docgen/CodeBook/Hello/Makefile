######
#
# A simple Makefile
#
######
CAT=cat
RMF=rm -f
NODE=node
######
XATS2JS=$(XATS2JSD)/bin/xats2js
######
XATS2JS_PRELUDE=\
"$(XATS2JSD)/share/runtime/xats2js_prelude.js"
XATS2JS_XATSLIB_LIBC=\
"$(XATS2JSD)/share/runtime/xats2js_xatslib_libc.js"
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

%_dats.js: %.dats; \
( $(CAT) $(XATS2JS_PRELUDE) $(XATS2JS_XATSLIB_LIBC) > $@ && $(XATS2JS) --output-a $@ -d $< )

######
export XATS2JSD=./../../..
######
export XATSHOME=$(XATS2JSD)/xanadu
######

###### end of [Makefile] ######
