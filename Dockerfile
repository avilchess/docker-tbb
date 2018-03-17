# Use the latest stable Ubuntu version (currently 16.04)
FROM ubuntu:16.04

ENV TBB_RELEASE 2018_U2
ENV TBB_VERSION 2018_20171205
ENV TBB_DOWNLOAD_URL https://github.com/01org/tbb/releases/download/${TBB_RELEASE}/tbb${TBB_VERSION}oss_lin.tgz
ENV TBB_INSTALL_DIR /opt
ENV CLANG_VERSION 6.0.0

# Make sure the image is updated, install some prerequisites,  Download the latest version of Clang (official binary) for Ubuntu
# Extract the archive and add Clang to the PATH
RUN apt update && apt install -y \
  xz-utils \
  build-essential \
  curl \
  wget \
  && rm -rf /var/lib/apt/lists/* \
  && curl -SL http://releases.llvm.org/${CLANG_VERSION}/clang+llvm-${CLANG_VERSION}-x86_64-linux-gnu-ubuntu-14.04.tar.xz \
  | tar -xJC . && mv clang+llvm-${CLANG_VERSION}-x86_64-linux-gnu-ubuntu-14.04 clang_${CLANG_VERSION} && \
  echo 'export PATH=/clang_${CLANG_VERSION}/bin:$PATH' >> ~/.bashrc && \
  echo 'export LD_LIBRARY_PATH=/clang_${CLANG_VERSION}/lib:LD_LIBRARY_PATH' >> ~/.bashrc

# Download and install TBB
RUN wget ${TBB_DOWNLOAD_URL} && \
	tar -C ${TBB_INSTALL_DIR} -xf tbb${TBB_VERSION}oss_lin.tgz && \
	rm tbb${TBB_VERSION}oss_lin.tgz && \
	sed -i "s%SUBSTITUTE_INSTALL_DIR_HERE%${TBB_INSTALL_DIR}/tbb${TBB_VERSION}oss%" ${TBB_INSTALL_DIR}/tbb${TBB_VERSION}oss/bin/tbbvars.* && \
	echo "source ${TBB_INSTALL_DIR}/tbb${TBB_VERSION}oss/bin/tbbvars.sh intel64" >> ~/.bashrc

# Start from a Bash prompt
CMD [ "/bin/bash" ]
