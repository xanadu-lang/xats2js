######
#
# A simple Makefile
#
######
CAT=cat
CPF=cp -f
ECHO=echo
NODE=node
######
SHARE=./../../../../share
XATSOPT=./../../../../xatsopt
XATS2JS="./../../../../bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(SHARE)/runtime/xats2js_prelude.js"
XATS2JS_XATSLIB_NODE=\
"$(SHARE)/runtime/xats2js_xatslib_node.js"
######
test::
######
# StreamDemo:: ; $(XATS2JS) -d ./StreamDemo.dats
# JS_StreamDemo:: ; $(XATS2JS) -d ./JS_StreamDemo.dats
######
test:: \
JS_StreamDemo
JS_StreamDemo:: ; \
$(CAT) $(XATS2JS_PRELUDE) > JS_StreamDemo_dats.js && \
$(CAT) JS_StreamDemo.cats >> JS_StreamDemo_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a JS_StreamDemo_dats.js -d ./JS_StreamDemo.dats
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
######
export XATS2JSD=./../../../..
export XATSHOME=$(XATS2JSD)/xatsopt
######
###### end of [Makefile] ######
