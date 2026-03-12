FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libgmp-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN rm -rf build && mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    libgmpxx4ldbl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/

COPY --from=builder /app/build/MyApp .

CMD ["./MyApp"]