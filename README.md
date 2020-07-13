# GHC Single-Binary builder

This repository provides an easy way to build a single statically linked binary that does not depend on Glibc or other shared libraries.

Currently, only GHC 8.10.1 is supported.

The advantage is that anyone can easily add dependent libraries by not using long, time-consuming GHC builds or unfamiliar nix hacks

## GitHub

[shin-sakata/ghc-single-binary-builder](https://github.com/shin-sakata/ghc-single-binary-builder)

## Docker Hub

[shinsakata/ghc-single-binary-builder](https://hub.docker.com/repository/docker/shinsakata/ghc-single-binary-builder)

## Usage

### Stack

1. Change resolver in `stack.yaml`

Use one of the resolvers where ghc8.10.1 is used

```yaml:stack.yaml
resolver: ghc-8.10.1 
# or resolver: nightly-2020-07-12
```

2. Add the following to `stack.yaml`

```yaml:stack.yaml
docker:
    enable: true
    repo: shinsakata/ghc-single-binary-builder:ghc8.10.1-v1.1.0
```

3. Add options to package.yaml

```yaml:package.yaml
executables:
  stack-minimum-example-exe:
    main:                Main.hs
    source-dirs:         app
    ghc-options:
    - -threaded
    - -rtsopts
    - -with-rtsopts=-N
    - -static -optl-static -optl-pthread -fPIC # <- Add options here.
    dependencies:
    - stack-minimum-example
```

3. Get the binary

Execute the following command.

```sh
$ stack install --local-bin-path=./bin
```

A single binary will be built in `./bin/`.
