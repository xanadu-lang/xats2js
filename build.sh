#!/bin/sh

######
#
# Author:
# Richar Kent (https://github.com/sparverius)
#
######

make_all() {
    make -C srcgen all
}

######
#
# For when this repository is cloned without --recursive flag
#
######

clone_xatsopt() {
    if [ ! -d xatsopt/srcgen ]; then
	git clone https://github.com/xanadu-lang/xatsopt.git
    fi
}

######

XATS2JS_SCRIPT='#!/bin/sh

XATS2JS='${PWD}/bin/xats2js'

if [ ! "$XATSHOME" ] ; then
  export XATSHOME='${PWD}/xatsopt'
fi

if [ -f "$XATS2JS" ] ; then
  "$XATS2JS" "$@"
else
  # if build failed or "make cleanall" was executed
  echo "please execute `make all` to build [xats2js]"
fi
'
generate_script() {
    printf "${XATS2JS_SCRIPT}" > ./bin/xats2js.sh
}

######

main() {
    clone_xatsopt
    make_all
    generate_script
}

main

###### end of [build.sh] ######
