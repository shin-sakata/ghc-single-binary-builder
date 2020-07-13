FROM alpine:3.12 as GHC

# INSTALL GHC

# Dependence on the GHC build
RUN apk add --update --no-cache \
    musl-dev \
    python3 \
    gcc \
    clang \
    make
RUN mkdir /root/workspace
RUN wget -O - 'https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-alpine3.10-linux-integer-simple.tar.xz' | tar -Jxvf - -C /root/workspace
WORKDIR /root/workspace/ghc-8.10.1-x86_64-unknown-linux
RUN ./configure --prefix=/ghc
RUN make install

FROM alpine:3.12

COPY --from=GHC /ghc /ghc
ENV PATH /ghc/bin:$PATH

# INSTALL STACK
RUN wget -qO- https://get.haskellstack.org/ | sh

# Dependence on the Stack and GHC to run
RUN apk add --update --no-cache \
    musl-dev \
    gcc \
    ncurses-libs \
    gmp-dev \
    shadow \
    binutils-gold

# Change linker to gold.
RUN unlink /usr/bin/ld && ln -s /usr/bin/ld.gold /usr/bin/ld
