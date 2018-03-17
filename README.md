# [docker-tbb](https://github.com/avilchess/docker-tbb)

This repository generates a Docker container with the CLANG 5 and [Intel Thread Building Blocks](https://www.threadingbuildingblocks.org/ "TBB") development environment.

Quick Start:

```bash
docker run -it avilchess/tbb
```

To run one of the TBB code examples try:

```bash
cd ${TBB_INSTALL_DIR}/tbb${TBB_VERSION}oss/examples/GettingStarted/sub_string_finder
make
```

The Dockerfile is available on [GitHub](https://github.com/avilchess/docker-tbb) and the pre-built container from [Docker Hub](https://hub.docker.com/r/avilchess/tbb/).

