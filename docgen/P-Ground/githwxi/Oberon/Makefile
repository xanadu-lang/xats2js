######
#
# A simple Makefile
#
######
CAT=cat
CPF=cp -f
ECHO=echo
MAKE=make
NODE=node
######
SHARE=./../../../../share
XANADU=./../../../../xanadu
XATS2JS="./../../../../bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(SHARE)/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(SHARE)/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE=\
"$(SHARE)/runtime/xats2js_xatslib_node.js"
######
RandomNumbers:: ; $(XATS2JS) -d RandomNumbers.dats
######
test:: \
RandomNumbers
RandomNumbers:: ; \
$(CAT) $(XATS2JS_PRELUDE) > RandomNumbers_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> RandomNumbers_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a RandomNumbers_dats.js -d ./RandomNumbers.dats && $(NODE) RandomNumbers_dats.js
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f *_dats.js
######
export XATS2JSD=./../../../..
export XATSHOME=$(XATS2JSD)/xanadu
###### end of [Makefile] ######
