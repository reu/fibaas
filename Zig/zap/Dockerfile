FROM debian:12-slim

WORKDIR /fibass

RUN apt-get update && apt-get install -y \
    xz-utils wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://ziglang.org/download/0.11.0/zig-linux-x86_64-0.11.0.tar.xz
RUN tar -xvf zig-linux-x86_64-0.11.0.tar.xz

ENV PATH="/fibass/zig-linux-x86_64-0.11.0:$PATH"

ADD . .

RUN zig build

CMD ["zig", "build", "run"]
