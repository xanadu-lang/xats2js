# xats2js

Xats2js is currently linked to Xats2js-H0, which is
for compiling from the H0-level syntax of ATS3/Xanadu to JS.

## Build Status

* [![Build Status](https://travis-ci.org/xanadu-lang/xats2js.svg?branch=master)](https://travis-ci.org/xanadu-lang/xats2js) Ubuntu

## Download

```
git clone --recursive https://github.com/xanadu-lang/xats2js.git
```

## Prerequisites

ATS2-0.4.2 or a later version is required,
which is available [here](http://www.ats-lang.org/Downloads.html)

## Build with ATS2

```
(cd xats2js && sh build.sh)
```

## Testing

```
cd xats2js
./bin/xats2js -h
make -C srcgen/TEST -f Makefile_test
```

## Remarks

- xats2js is for debugging the implementation ATS3/Xanadu

- xats2js is meant to be a practical compiler from XATSCML to JS

- This project should be constantly under construction for quite some time
