# DataStructures.jl

[![Run tests](https://github.com/hesseltuinhof/DataStructures.jl/actions/workflows/ci.yml/badge.svg)](https://github.com/hesseltuinhof/DataStructures.jl/actions/workflows/ci.yml)

## About

This repository only serves an educational purpose. It implements a large number of data structures and algorithms from
the similarly named book by [Clifford A. Schaffer](https://people.cs.vt.edu/shaffer/). The term _educational_ implies
that the focus is on sticking closely to the book and thus not strictly applying all of `julia`'s style recommendations
at all times.

A copy of _Data Structures & Algorithm Analysis in C++_ can be found [here](https://people.cs.vt.edu/shaffer/Book/).

## Installation

To make the package available one can use the built-in package manager from `julia` to install it. Add the Package to the manifest

```
pkg> dev https://github.com/hesseltuinhof/DataStructures.jl.git
```

This only needs to be done the first time.

Then to play around with it, use `using DataStructures` and to run the tests

```
pkg> test DataStructures
```
