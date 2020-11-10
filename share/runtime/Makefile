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
all:: ; \
echo "Please do 'make xats2js_xatslib_libc'!"

######
XANADU=./../../xanadu
XATS2JS="./../../bin/xats2js"
######
#
xats2js_prelude:: ; \
$(ECHO) \
"/* ****** ****** */" > xats2js_prelude.js \
&& \
$(ECHO) \
"// XATS2JS_PRELUDE" >> xats2js_prelude.js \
&& \
$(ECHO) \
"/* ****** ****** */\n" >> xats2js_prelude.js \
&& \
$(ECHO) "'use strict';\n" >> xats2js_prelude.js
#
xats2js_prelude:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/runtime.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/prelude.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/g_print.cats >> xats2js_prelude.js
xats2js_prelude:: ; \
$(CAT) \
$(XANADU)/prelude/DATS/CATS/JS/Node/g_print.cats >> xats2js_prelude.js
######
xats2js_xatslib_libc:: ; \
$(ECHO) \
"/* ****** ****** */" > xats2js_xatslib_libc.js \
&& \
$(ECHO) \
"/*\nXATS2JS_XATSLIB_LIBC\n*/" >> xats2js_xatslib_libc.js \
&& \
$(ECHO) "/* ****** ****** */\n" >> xats2js_xatslib_libc.js
#
xats2js_xatslib_libc:: ; \
$(CAT) \
$(XANADU)/xatslib/libc/DATS/CATS/JS/Node/prelude.cats >> xats2js_xatslib_libc.js
#
######
clean:: ; rm -f *~
######
cleanall:: clean
# cleanall:: ; rm -f xats2js_prelude.js
######
###### end of [Makefile_nodejs] ######
