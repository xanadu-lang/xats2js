# Hello, World!

I assume that you have already installed XATS2JS at this point.

The path to the directory where XATS2JS is located should be stored in
the environment variable of the name XATS2JSD. And I often write
${XATS2JSD} (which means the content of XATS2JD) to refer to this
directory.

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
export XATS2JSD=/tmp/myxats2js
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

And the example I am about to present is contained in the following
directory:

/tmp/myxats2js/docgen/CodeBook/Hello

which can also be accessed [here](https://github.com/xanadu-lang/xats2js/tree/master/docgen/CodeBook/Hello)
in the on-line repository of XATS2JS.

## Co-Programming with ATS3 and JS

Conceptually, co-programming with ATS3 and JS refers to a style of
programming where the JS code generated from ATS3 source (via some
form of compilation) is directly combined with the JS code obtained
otherwise (e.g., manually written by a programmer).

Let us implement a webpage containing a button. Once the button is
clicked, an alert window is popped up with the message saying "Hello,
world!". For instance, a demo of such a
[webpage](https://xanadu-lang.github.io/xats2js/docgen/CodeBook/Hello/2020-11-22/hello.html)
is given as follows:
  
https://xanadu-lang.github.io/xats2js/docgen/CodeBook/Hello/2020-11-22/hello.html

To demonstrate the spirit of co-programming, we hereby have two source
files: [hello.cats](./hello.cats) and [hello.dats](./hello.dats); the
former is for storing manually written JS code and the later for
manually written ATS3 code.  Note that the filename extension `cats`
is not significant; it is chosen here for a historic reason as this
extension used to indicate a file containing external C code in
so-called co-programming with ATS2 and C. On the other hand, the
filename `dats` is signifcant as it is recognized by xats2js for some
special usage.

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
