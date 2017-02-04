FROM debian:latest

RUN echo "deb http://pkg.mxe.cc/repos/apt/debian jessie main" >/etc/apt/sources.list.d/mxeapt.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
  apt-get install -y mxe-i686-w64-mingw32.shared-qtserialport mxe-i686-w64-mingw32.shared-qttools git && \
  git clone http://code.qt.io/cgit/installer-framework/installer-framework.git && \
  cd installer-framework && \
  /usr/lib/mxe/usr/i686-w64-mingw32.shared/qt5/bin/qmake && \
  make

ENV PATH=/usr/lib/mxe/usr/bin:$PATH
RUN apt-get clean && rm -Rf /var/lib/apt/lists/*
