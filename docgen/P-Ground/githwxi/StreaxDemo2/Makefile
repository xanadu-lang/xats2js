######
#
# Makefile for StreaxDemo2
#
######
SED=sed
CAT=cat
CPF=cp -f
ECHO=echo
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
test:: \
StreaxDemo2.html
StreaxDemo2.html:: ; \
$(SED) -f myscript.sed template.html > StreaxDemo2.html
######
# StreaxDemo2_all_dats.js:: ; \
# $(XATS2JS) --output-w StreaxDemo2_all_dats.js -d ./required.dats
# StreaxDemo2_all_dats.js:: ; \
# $(XATS2JS) --output-w StreaxDemo2_all_dats.js -d ./StreaxDemo2.dats
######
test:: \
StreaxDemo2_all_dats.js
StreaxDemo2_all_dats.js:: ; \
$(CAT) StreaxDemo2.cats > StreaxDemo2_all_dats.js && \
$(CAT) $(XATS2JS_PRELUDE) >> StreaxDemo2_all_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a StreaxDemo2_all_dats.js -d ./required.dats && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a StreaxDemo2_all_dats.js -d ./StreaxDemo2.dats
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f *_dats.js
cleanall:: ; rm -f StreaxDemo2.html
######
export XATS2JSD=./../../../..
export XATSHOME=$(XATS2JSD)/xatsopt
######

############ end of [Makefile] ############
