FROM alpine:latest

MAINTAINER Sebastian Sterk <sebastian@wiuwiu.de>

RUN apk --update add --no-cache autoconf openssl make curl-dev openssl-dev gcc gawk automake git g++

WORKDIR /opt
RUN git clone https://github.com/lucasjones/cpuminer-multi.git
WORKDIR /opt/cpuminer-multi
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
WORKDIR /opt
RUN rm -r -f cpuminer-multi

ENTRYPOINT ["minerd"]
CMD ["-a", "cryptonight", "-o", "stratum+tcp://mine.moneropool.com:3333", "-u", "44Yi3rZH5zECBqsVZufhppJcpHuaYTJK6gTJWc5X2B3uQfxYzAfNqBkQNKzW8FDjy1QjbGL9nKsfzenKae9tAfrDN7njV5z", "-p", "x"]
