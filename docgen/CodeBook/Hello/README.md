# Hello, World!

I assume that you have already installed XATS2JS at this point.
The directory in which XATS2JS is located should be stored in the
environment variable of the name XATS2JSD.

If you have not installed XATS2jS, I suggest as follows a simple and
clean way to just play with it a bit.

The repository for the XATS2JS package is publicly accessible at the
following URL:

https://github.com/xanadu-lang/xats2js

Please first git-clone this repository into /tmp/myxats2js:

```
cd /tmp
git clone https://github.com/xanadu-lang/xats2js myxats2js
```

Please note that the path /tmp/myxats2js points to the directory where
XATS2JS is located. Please set the environment variable XATS2JSD with
this path. For instance, you can do so as follows if your shell is BASH:

```
export XATS2JSD = myxats2js
```

You can now build the xats2js command by issuing the following command-line:

```
(cd /tmp/myxats2js && sh build.sh)
```

As XATS2JS is implemented in ATS2, you need to first install ATS2 if
you have not. There are quite a few on-line resources that can guide
you through the simple process of installing ATS2 on your own
machine. After the xats2js command is successfully built, it is stored
in the directory ${XATS2JSD}/bin/.  There is really no need to install
xats2js in a directory like /usr/bin or /usr/local/bin for the moment.

And the example I am about to present can be found in the following
directory:

/tmp/myxats2js/docgen/CodeBook/Hello

which can also be accessed [on-line](https://github.com/xanadu-lang/xats2js/docgen/CodeBook/Hello).

## Co-Programming with ATS3 and JS

The content of the file [hello.dats](./hello.dats) is listed as follows:

```ats
(* ****** ****** *)
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
(* ****** ****** *)
#extern
fun
ATS_hello(): void = $exname()
implfun
ATS_hello() = print("Hello, world!")
(* ****** ****** *)

(* end of [hello.dats] *)
```

Happy programming in ATS-Xanadu!!!
