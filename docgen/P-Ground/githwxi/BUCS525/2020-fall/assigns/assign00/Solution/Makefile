############
CAT=cat
ECHO=echo
############
XJSHOME =\
"./../../../../../../../.."
############
XATS2JS ="$(XJSHOME)/bin/xats2js"
############
XATS2JS_PRELUDE=\
"$(XJSHOME)/share/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(XJSHOME)/share/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_LIBC=\
"$(XJSHOME)/share/runtime/xats2js_xatslib_libc.js"
############
all:: prelude
############
all:: assign00_sol
############
prelude:: ; \
echo > assign00_sol_dats.js && \
$(CAT) $(XATS2JS_PRELUDE) >> assign00_sol_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> assign00_sol_dats.js
############
assign00_sol:: ; \
$(XATS2JS) --output-a assign00_sol_dats.js -d ./assign00_sol.dats
############

clean:: ; rm -f *~

cleanall:: clean
cleanall:: ; rm -f assign00_sol_dats.js

############ end of [Makefile] ############
