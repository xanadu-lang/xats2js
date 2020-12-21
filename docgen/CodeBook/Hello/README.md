# Hello, World!

I assume that you have already installed XATS2JS at this point.

The path to the directory where XATS2JS is located should be stored in
the environment variable of the name XATS2JSD. And I often write
${XATS2JSD} (which means the content of XATS2JD) to refer to this
directory.

If you have not installed XATS2JS, I suggest as follows a simple and
clean way to just play with it a bit.
The repository for the XATS2JS package is publicly accessible at the
following URL:

https://github.com/xanadu-lang/xats2js

Please first git-clone this repository into /tmp/myxats2js:

```
cd /tmp
git clone https://github.com/xanadu-lang/xats2js myxats2js
```

Note that the path /tmp/myxats2js points to the directory where
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

The example I am about to present is in the following
directory:

/tmp/myxats2js/docgen/CodeBook/Hello

which can also be accessed [here](https://github.com/xanadu-lang/xats2js/tree/master/docgen/CodeBook/Hello)
in the on-line repository of XATS2JS.

## Co-Programming with ATS3 and JS

Conceptually, co-programming with ATS3 and JS refers to a style of
programming where the JS code generated from ATS3 source (via some
form of compilation) is directly combined with the JS code obtained
otherwise (e.g., manually written by a programmer). And a simple form
of direct combination can be achieved by just copying/pasting.

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

In the rest of the presentation, if a command-line is to be executed,
it is supposed to be done in the directory containing the aforementioned
files.

#### hello.dats
  
Let us start with [hello.dats](./hello.dats), whose content is listed as follows:

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

One can form a line-comment in ATS by starting the line with
two slashes (//). One can also form a block-comment in ATS by using
the ML-style of commenting:

```ats
(*
...here-is-a-block-comment...
*)
```

In ATS3, one can break a line of string into several lines by
inserting a single backslash symbol (\\). For instance, the following
code:

```ats
#include"\
$(XATS2JSD)\
/share/xats2js_prelude.hats"
```

is completely equivalent to the code below:

```ats
#include"$(XATS2JSD)/share/xats2js_prelude.hats"
```

This include-directive essentially staloads (that is, statically
loads) the API for a collection of functions declared and implemented
in the prelude library of ATS3. This is a necessary step for the code
following the include-directive to access these library functions.

In the following code, a function of the name `ATS_hello` is declared
and then implemented:
  
```ats
#extern
fun
ATS_hello(): void = $exname()
implfun
ATS_hello() = print("Hello, world!")
```

The keyword `#extern` indicates that the declared function is
accessible externally, that is, outside the file (which is treated
as a module of some sort).

The special expression `$exname()` indicates to the compiler (xats2js)
that the generated JS function corresponding to `ATS_hello` should be
given the same name. As can be expected, name correspondence (that is,
mapping names in code from one language to another) is a central issue
in any kind of co-programming. And anyone implementing a compiler
should be aware of this issue very well.

The keyword `implfun` initiates the implementation of a declared name
(which refers to a function in this case).

#### hello.cats

Let us switch to [hello.cats](./hello.cats), whose content is listed as follows:

```js
/* ****** ****** */

function
JS_hello()
{
  ATS_hello();
  let output =
  XATS2JS_the_print_store_join();
  XATS2JS_the_print_store_clear();
  alert(output);
}

/* ****** ****** */

/* end of [hello.cats] */
```

The `print` function in [hello.dats](./hello.dats) saves a string
representation of its argument into a global array; the function
`XATS2JS_the_print_store_join` joins all of the strings in the array
into a single one; the function `XATS2JS_the_print_store_clear` clears
the array (that is, reset it to its initial state of emptiness).

#### Putting it all together

By issuing the command-line below:

```
${XATS2JSD}/bin/xats2js -d hello.dats
```

we expect the following kind of JS code
to be generated:


```js
function
ATS_hello()
{
let xtmp0;
{
const // implval/fun
string_print_4753_ = XATS2JS_string_print
;
xtmp0 = string_print_4753_("Hello, world!");
}
;
return xtmp0;
} // function // ATS_hello(0)
```

There is a small library of functions needed for running the generated
JS code, which can found in the following file:

[$(XATS2JSD)/share/runtime/xats2js_prelude.js](https://github.com/xanadu-lang/xats2js/tree/master/share/runtime/xats2js_prelude.js)

Copying into a file (of the name, say, hello_dats.js) the code in the
above library file, the code in hello.cats, and the generated JS code from
hello.dats, we have finally completed the task of building the
[webpage](https://xanadu-lang.github.io/xats2js/docgen/CodeBook/Hello/2020-11-22/hello.html)
by simply adding a line for loading hello_dats.js (in the html file
created for the webpage). Please find the provided Makefile for streamlining this process of compiling and assembling..

Happy programming in ATS3!!!
