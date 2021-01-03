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
SHARE=./../../../share
XATSOPT=./../../../xatsopt
XATS2JS="./../../../bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(SHARE)/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(SHARE)/runtime/xats2js_prelude_node.js"
XATS2JS_XATSLIB_NODE=\
"$(SHARE)/runtime/xats2js_xatslib_node.js"
######
test:: \
hello
hello:: ; \
$(CAT) $(XATS2JS_PRELUDE) > hello_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> hello_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a hello_dats.js -d ./hello.dats && $(NODE) hello_dats.js
######
test:: \
acker2
acker2:: ; \
$(CAT) $(XATS2JS_PRELUDE) > acker2_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> acker2_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a acker2_dats.js -d ./acker2.dats && $(NODE) acker2_dats.js
######
test:: \
readfile
readfile:: ; \
$(CAT) $(XATS2JS_PRELUDE) > readfile_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> readfile_dats.js && \
$(CAT) $(XATS2JS_XATSLIB_NODE) >> readfile_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a readfile_dats.js -d ./readfile.dats && $(NODE) readfile_dats.js
######
test:: \
readline
readline:: ; \
$(CAT) readline.cats > readline_dats.js && \
$(CAT) $(XATS2JS_PRELUDE) >> readline_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> readline_dats.js && \
$(XATS2JS) 1>/dev/null 2>&1 --output-a readline_dats.js -d ./readline.dats && $(CAT) readline.cats | $(NODE) readline_dats.js
######
test:: \
Functest
Functest:: ; \
$(MAKE) -C Functest test
######
test:: \
Game-of-24
Game-of-24:: ; \
$(MAKE) -C Game-of-24 test
######
test:: \
QueenPuzzle
Game-of-24:: ; \
$(MAKE) -C QueenPuzzle test
######
test:: \
Oberon_Chapter2
Oberon_Chapter2:: ; \
$(MAKE) -C Oberon/Chapter2 test
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
cleanall:: ; $(MAKE) -C Functest cleanall
cleanall:: ; $(MAKE) -C StreamDemo cleanall
cleanall:: ; $(MAKE) -C StreaxDemo cleanall
cleanall:: ; $(MAKE) -C Game-of-24 cleanall
cleanall:: ; $(MAKE) -C QueenPuzzle cleanall
cleanall:: ; $(MAKE) -C Tic-Tac-Toe cleanall
cleanall:: ; $(MAKE) -C Oberon/Chapter2 cleanall
######
export XATS2JSD=./../../..
export XATSHOME=$(XATS2JSD)/xatsopt
###### end of [Makefile] ######
