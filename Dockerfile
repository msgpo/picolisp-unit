FROM tatsushid/tinycore:9.0-x86_64

ARG picolisp_version=18.12

# Install PicoLisp
WORKDIR /tmp
RUN tce-load -wicl openssl compiletc
RUN wget https://software-lab.de/picoLisp-${picolisp_version}.tgz -O /tmp/picolisp.tgz
RUN tar -xf /tmp/picolisp.tgz
RUN cd /tmp/picoLisp; wget https://software-lab.de/x86-64.linux.tgz && tar -xf x86-64.linux.tgz
RUN cd /tmp/picoLisp/src64; make all clean && make
RUN mv /tmp/picoLisp /usr/lib/picolisp
RUN ln -s /usr/lib/picolisp/bin/picolisp /usr/bin
RUN ln -s /usr/lib/picolisp/bin/pil /usr/bin

# Copy the files
WORKDIR /tmp/picolisp-unit
COPY . /tmp/picolisp-unit
