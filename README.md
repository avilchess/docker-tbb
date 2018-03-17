# [docker-tbb](https://github.com/avilchess/docker-tbb)

This repository generates a Docker container with the [CLANG 6](https://clang.llvm.org/) and [Intel Thread Building Blocks](https://www.threadingbuildingblocks.org/ "TBB") development environment.

## Building from source:

```bash
docker build -t avilchess/tbb:1.0 .
```

## Running the docker image:

```bash
docker run -i -t avilchess/tbb:1.0 /bin/bash
```

## Testing TBB installation:

```bash
cd ${TBB_INSTALL_DIR}/tbb${TBB_VERSION}oss/examples/parallel_for/seismic
make
```

The Dockerfile is available on [GitHub](https://github.com/avilchess/docker-tbb) and the pre-built container from [Docker Hub](https://hub.docker.com/r/avilchess/tbb/).

> Written with [StackEdit](https://stackedit.io/).
