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
MYROOT=./../../../../..
######
XATS2JS=$(MYROOT)/bin/xats2js
######
XATS2JS_PRELUDE=\
"$(MYROOT)/share/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(MYROOT)/share/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE=\
"$(MYROOT)/share/runtime/xats2js_xatslib_node.js"
######
# ListRN:: ; $(XATS2JS) -d ListRN.dats
# RandomNumbers:: ; $(XATS2JS) -d RandomNumbers.dats
######
test:: \
ListRN
ListRN:: \
RandomNumbers ; \
$(CAT) $(XATS2JS_PRELUDE) > ListRN_dats.js && \
$(CAT) RandomNumbers_dats.js >> ListRN_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> ListRN_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a ListRN_dats.js -d ./ListRN.dats && $(NODE) ListRN_dats.js
test:: \
RandomNumbers
RandomNumbers:: ; $(XATS2JS) 1>/dev/null 2>&1 --output-w RandomNumbers_dats.js -d ./RandomNumbers.dats
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
export XATS2JSD=$(MYROOT)
export XATSHOME=$(XATS2JSD)/xatsopt
###### end of [Makefile] ######
