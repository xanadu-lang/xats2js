######
#
# For testing xats2js
#
######
CAT=cat
CPF=cp -f
ECHO=echo
NODE=node
######
MYTEST="."
######
SHARE=./../../../share
XATS2JS="./../../../bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(SHARE)/runtime/xats2js_prelude.js"
######
all:: test
######
test:: ; $(XATS2JS)
######
#
test:: \
mytest01
mytest01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest01.dats && $(NODE) output_dats.js
#
######
#
# HX-2020-11-08:
# An example of
# non-terminating tail-calls
#
# test:: \
# mytest02
# mytest02:: ; \
# $(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
# $(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest02.dats && $(NODE) output_dats.js
#
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f output_dats.js
######
# export XATSHOME=$(XANADU)
# XANADU=$(shell pwd)/../../xanadu
######
###### end of [Makefile_output] ######
