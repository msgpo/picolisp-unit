FROM tatsushid/tinycore:9.0-x86_64

MAINTAINER aw "https://github.com/aw"

ARG picolisp_version=18.12

# Install PicoLisp
RUN tce-load -wicl openssl ipv6-KERNEL
RUN wget https://software-lab.de/picoLisp-${picolisp_version}.tgz -O /tmp/picolisp.tgz
RUN cd /tmp; tar -xf /tmp/picolisp.tgz
RUN cd /tmp/picoLisp; wget https://software-lab.de/x86-64.linux.tgz && tar -xf x86-64.linux.tgz
RUN cd /tmp/picoLisp/src64; make all clean && make
