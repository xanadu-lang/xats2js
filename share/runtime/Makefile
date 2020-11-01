######
#
# For xats2js/runtime
#
######

CAT=cat
CPF=cp -f
ECHO=echo

######

all:: ; \
echo "Please do 'make xats2js_runtime'!"

######
XANADU=./../../xanadu
XATS2JS="./../../bin/xats2js"
######
xats2js_runtime:: ; \
$(ECHO) \
"/* ****** ****** */\n" > xats2js_runtime.js \
&& \
$(ECHO) "'use strict';\n" >> xats2js_runtime.js
xats2js_runtime:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/runtime.cats >> xats2js_runtime.js
xats2js_runtime:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/Node/g_print.cats >> xats2js_runtime.js
######
clean:: ; rm -f *~
######
cleanall:: clean
# cleanall:: ; rm -f xats2js_runtime.js
######
###### end of [Makefile_nodejs] ######
