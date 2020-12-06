############
CAT=cat
ECHO=echo
############
XJSHOME =\
"./../../../../../../.."
############
XATS2JS =\
"$(XJSHOME)/bin/xats2js"
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
all:: midterm_head0
all:: midterm_type0
all:: midterm_tpext
all:: midterm_t0erm
all:: midterm_s0env
all:: midterm_tpinf
all:: midterm_value
all:: midterm_d0env
all:: midterm_intrp
all:: midterm_main0
############
prelude:: ; \
echo > midterm_output.js && \
$(CAT) $(XATS2JS_PRELUDE) >> midterm_output.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> midterm_output.js
############
midterm_head0:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm.dats
############
midterm_type0:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_type0.dats
############
midterm_tpext:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_tpext.dats
############
midterm_t0erm:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_t0erm.dats
############
midterm_s0env:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_s0env.dats
############
midterm_tpinf:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_tpinf.dats
############
midterm_value:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_value.dats
############
midterm_d0env:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_d0env.dats
############
midterm_intrp:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_intrp.dats
############
midterm_intrp:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_intrp.dats
############
midterm_main0:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_main0.dats
############

clean:: ; rm -f *~

cleanall:: clean
cleanall:: ; rm -f midterm_output.js

############ end of [Makefile] ############
