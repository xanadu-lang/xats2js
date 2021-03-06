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
MYTEST="."
######
SHARE=./../../../share
XATS2JS="./../../../bin/xats2js"
######
XATS2JS_PRELUDE=\
"$(SHARE)/runtime/xats2js_prelude.js"
XATS2JS_PRELUDE_NODE=\
"$(SHARE)/runtime/xats2js_prelude_node.js"
######
all:: test
######
test:: ; $(XATS2JS)
######
#
test:: \
mytest01
mytest01:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest01.dats && $(NODE) output_dats.js
#
######
#
# HX-2020-11-08:
# An example of
# non-terminating tail-calls
#
# test:: \
# mytest02
# mytest02:: ; \
# $(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
# $(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
# $(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest02.dats && $(NODE) output_dats.js
#
######
test:: \
mytest03
mytest03:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest03.dats && $(NODE) output_dats.js
######
test:: \
mytest04
mytest04:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest04.dats && $(NODE) output_dats.js
######
test:: \
mytest05
mytest05:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest05.dats && $(NODE) output_dats.js
######
test:: \
mytest06
mytest06:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest06.dats && $(NODE) output_dats.js
######
test:: \
mytest07
mytest07:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest07.dats && $(NODE) output_dats.js
######
test:: \
mytest08
mytest08:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(CAT) $(MYTEST)/mytest08.cats >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest08.dats && $(NODE) output_dats.js
######
test:: \
mytest09
mytest09:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(CAT) $(MYTEST)/mytest09.cats >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest09.dats && $(NODE) output_dats.js
######
test:: \
mytest10
mytest10:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/mytest10.dats && $(NODE) output_dats.js
######
test:: \
Zoe_Tally
Zoe_Tally:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/Zoe/lecture-2018-12-24/Tally.dats && $(NODE) output_dats.js
######
test:: \
Zoe_IsPrime
Zoe_IsPrime:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/Zoe/lecture-2018-12-27/IsPrime.dats && $(NODE) output_dats.js
######
test:: \
Zoe_IntPrint
Zoe_IntPrint:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/Zoe/lecture-2018-12-28/IntPrint.dats && $(NODE) output_dats.js
######
test:: \
Zoe_LinSearch
Zoe_LinSearch:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/Zoe/lecture-2019-01-07/linear_search.dats && $(NODE) output_dats.js
######
test:: \
Zoe_LinSearch2D
Zoe_LinSearch2D:: ; \
$(CAT) $(XATS2JS_PRELUDE) > output_dats.js && \
$(CAT) $(XATS2JS_PRELUDE_NODE) >> output_dats.js && \
$(XATS2JS) --output-a output_dats.js -d $(MYTEST)/Zoe/lecture-2019-01-07/linear_search_2d.dats && $(NODE) output_dats.js
######
#
# HX: for cleaning up
#
######
clean:: ; rm -f *~
######
cleanall:: clean
cleanall:: ; rm -f output
cleanall:: ; rm -f output_dats.js
######
# export XATSHOME=$(XANADU)
# XANADU=$(shell pwd)/../../xanadu
######
###### end of [Makefile_output] ######
