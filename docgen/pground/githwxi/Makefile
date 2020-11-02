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
XATS2JS_RUNTIME=\
"$(SHARE)/runtime/xats2js_runtime.js"
######
test:: \
hello
hello:: ; \
$(CAT) $(XATS2JS_RUNTIME) > hello_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a hello_dats.js -d ./hello.dats && $(NODE) hello_dats.js
######
test:: \
QueenPuzzle
QueenPuzzle:: ; \
$(CAT) $(XATS2JS_RUNTIME) > QueenPuzzle_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a QueenPuzzle_dats.js -d ./QueenPuzzle.dats && $(NODE) QueenPuzzle_dats.js
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
