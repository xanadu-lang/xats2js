######
#
# A simple Makefile
#
######
CAT=cat
RMF=rm -f
ECHO=echo
NODE=node
######
XATS2JS=$(XATS2JSD)/bin/xats2js
######
XATS2JS_PRELUDE=\
"$(XATS2JSD)/share/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(XATS2JSD)/share/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE=\
"$(XATS2JSD)/share/runtime/xats2js_xatslib_node.js"
######
#
# doublet:: ; \
# $(XATS2JS) -d doublet.dats
# mytest01:: ; \
# $(XATS2JS) -d mytest01.dats
# JS_doublet:: ; \
# $(XATS2JS) -d JS_doublet.dats
#
######
all:: \
JS_doublet
######
mytest01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > mytest01_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> mytest01_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> mytest01_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a mytest01_dats.js -d ./doublet.dats && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a mytest01_dats.js -d ./mytest01.dats && $(NODE) mytest01_dats.js
######
JS_doublet:: ; \
$(CAT) JS_doublet.cats > JS_doublet_dats.js && \
$(CAT) $(XATS2JS_PRELUDE) >> JS_doublet_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a JS_doublet_dats.js -d ./doublet.dats && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a JS_doublet_dats.js -d ./JS_doublet.dats && $(ECHO) "JS_doublet_dats.js generated!"
######
clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; rm -f *_dats.js

######
export XATS2JSD=./../../..
export XATSHOME=$(XATS2JSD)/xatsopt
######

###### end of [Makefile] ######
