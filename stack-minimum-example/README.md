# stack-minimum-example

Here's a use case for a minimal Stack project

## Usage

See Makefile for more information

### 1. Build a single binary

```
$ make build
```

### 2. Build a Docker image with a single binary running

```
$ make build-image
```

### 3. Runs a Docker image with a single binary

```
$ make run
```

## Tidying up

### Remove docker images running a single binary
```
$ make remove-image
```
