# Nim by example

Content and build toolchain for [Nim by Example](https://nimbyexample.com),
a site that teaches [Nim](https://nim-lang.org/) via annotated example programs.

### Overview

The Nim by Example site is built by extracting code and comments from source files in `examples` and rendering them via the `templates` into a static `public` directory.
The source code implementing this build process is in `src` directory.

The built `public` directory can be served by any static content system.

### Building

To build the site you'll need [Node](https://nodejs.org) installed.

First, install the dependencies by running:

```console
$ npm install
```

To run the build once:

```console
$ npm run build
```

To keep building on file changes:

```console
$ npm run watch
```

Nim files can be checked for corectness:

```console
$ npm run build testNim
```

To generate `out` files from Nim source code:

```console
$ npm run build outputNim
```


### License

TODO

### Thanks

Thanks to [Mark McGranaghan](https://github.com/mmcgrana) for [Go by Example](https://gobyexample.com),
which inspired this project.