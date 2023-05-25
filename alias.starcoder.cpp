# Alias helper
source .env
GPU_ARGS="--gpus all"
alias starcoder.cpp="docker run --init ${GPU_ARGS} -v ${LOCAL_MODEL_DIR}:${LOCAL_MODEL_DIR} localagi/starcoder.cpp:${STARCODER_CPP_VERSION}${STARCODER_CPP_FLAVOR}
