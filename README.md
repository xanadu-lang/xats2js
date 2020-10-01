# xats2js

For compiling ATS/Xanadu to JS

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
make -C srcgen/TEST test > output
```


## Remarks

- Xats2js is for debugging the implementation of Xanadu

- Xats2js is meant to be a practical compiler from Xanadu to JS

- This project should be constantly under construction for quite some time
