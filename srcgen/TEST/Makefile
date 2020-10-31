######
#
# For testing xats2js
#
######

MAKE=make

######

test:: \
test_output

test:: \
test_nodejs

######

test_output:: ; \
$(MAKE) -f Makefile_output
test_nodejs:: ; \
$(MAKE) -f Makefile_nodejs

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
###### end of [Makefile] ######
