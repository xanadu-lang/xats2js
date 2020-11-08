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
SHARE=./../../../share
XANADU=./../../../xanadu
XATS2JS="./../../../bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(SHARE)/runtime/xats2js_prelude.js"
######
test:: \
hello
hello:: ; \
$(CAT) $(XATS2JS_PRELUDE) > hello_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a hello_dats.js -d ./hello.dats && $(NODE) hello_dats.js
######
test:: \
QueenPuzzle
QueenPuzzle:: ; \
$(CAT) $(XATS2JS_PRELUDE) > QueenPuzzle_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a QueenPuzzle_dats.js -d ./QueenPuzzle.dats && $(NODE) QueenPuzzle_dats.js
######
test:: \
readline
readline:: ; \
$(CAT) readline.cats > readline_dats.js && \
$(CAT) $(XATS2JS_PRELUDE) >> readline_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a readline_dats.js -d ./readline.dats && $(CAT) readline.cats | $(NODE) readline_dats.js
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
###### end of [Makefile_nodejs] ######
