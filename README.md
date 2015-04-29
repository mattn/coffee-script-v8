# coffee-script-v8

CoffeeScript compiler/runner.

## Requirements

* libv8-dev

if you are on ubuntu:

```
$ sudo apt-get install libv8-dev
```

## Build

* For Windows

```
g++ -o coffee coffee.cc -lv8 -lwinmm -lws2_32
```

* For other environment

```
g++ -o coffee coffee.cc -lv8 -lpthread
```

## Usage

```
coffee -h
```

## Author

> Yasuhiro Matsumoto `<mattn.jp@gmail.com>`

