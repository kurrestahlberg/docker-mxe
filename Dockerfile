FROM debian:jessie

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf automake bash bison bzip2 \
                cmake flex gettext git g++ intltool \
                libffi-dev libtool libltdl-dev libssl-dev \
                libxml-parser-perl make openssl patch perl \
                pkg-config scons sed unzip wget xz-utils g++-multilib \
                libc6-dev-i386 git htop unzip wget ruby gperf autopoint \
                p7zip-full libgdk-pixbuf2.0-dev libtool-bin

RUN echo "deb http://pkg.mxe.cc/repos/apt/debian jessie main" >/etc/apt/sources.list.d/mxeapt.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
RUN apt-get update && apt-get install -y mxe-i686-w64-mingw32.shared-qtserialport
ENV PATH=/usr/lib/mxe/usr/bin:$PATH
RUN apt-get clean && rm /var/lib/apt/lists/*
