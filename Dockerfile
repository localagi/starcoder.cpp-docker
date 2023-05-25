ARG FROM_IMAGE
FROM ${FROM_IMAGE}

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y --no-install-recommends ninja-build build-essential cmake libopenblas-dev

COPY --link . /starcoder.cpp
WORKDIR /starcoder.cpp
ARG LLAMA_OPENBLAS
ARG LLAMA_CUBLAS
RUN make -j4

WORKDIR /starcoder.cpp
ENV PATH="PATH=$PATH:/ggml/build/bin"
