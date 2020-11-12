############

XJSHOME =\
"./../../../../../../.."

XATS2JS =\
"$(XJSHOME)/bin/xats2js"

############
all:: start
############
all:: midterm
all:: midterm_type0
all:: midterm_t0erm
all:: midterm_s0env
all:: midterm_d0env
all:: midterm_interp
############
start:: ; \
$(ECHO) > midterm_output.js
############
midterm:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm.dats
############
midterm_type0:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_type0.dats
############
midterm_t0erm:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_t0erm.dats
############
midterm_s0env:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_s0env.dats
############
midterm_d0env:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_d0env.dats
############
midterm_interp:: ; \
$(XATS2JS) --output-a midterm_output.js -d ./midterm_interp.dats
############

cleanal:: ; rm -f midterm_output.js

############ end of [Makefile] ############
