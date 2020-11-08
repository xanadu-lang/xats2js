######
#
# For xats2js/prelude
#
######

CAT=cat
CPF=cp -f
ECHO=echo

######

all:: ; \
echo "Please do 'make xats2js_prelude'!"

######
XANADU=./../../xanadu
XATS2JS="./../../bin/xats2js"
######
xats2js_prelude:: ; \
$(ECHO) \
"/* ****** ****** */\n" > xats2js_prelude.js \
&& \
$(ECHO) "'use strict';\n" >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/runtime.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/prelude.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/Node/g_print.cats >> xats2js_prelude.js
######
clean:: ; rm -f *~
######
cleanall:: clean
# cleanall:: ; rm -f xats2js_prelude.js
######
###### end of [Makefile_nodejs] ######
