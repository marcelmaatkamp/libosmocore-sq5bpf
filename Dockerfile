FROM marcelmaatkamp/gnuradio:3.7.1

MAINTAINER m.maatkamp@gmail.com version: 0.1

RUN  apt-get install -y libpcsclite-dev

# ---
# libosmocom

WORKDIR /gnuradio 

ADD configure.ac /gnuradio/osmocom/libosmocore-sq5bpf/
ADD COPYING /gnuradio/osmocom/libosmocore-sq5bpf/
ADD debian /osmocom/libosmocore-sq5bpf/debian/
ADD doc /gnuradio/osmocom/libosmocore-sq5bpf/doc/
ADD Doxyfile.codec.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD Doxyfile.core.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD Doxyfile.gsm.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD Doxyfile.vty.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD generate.sh /gnuradio/osmocom/libosmocore-sq5bpf/
ADD git-version-gen /gnuradio/osmocom/libosmocore-sq5bpf/
ADD include /gnuradio/osmocom/libosmocore-sq5bpf/include/
ADD libosmocodec.pc.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD libosmocore.pc.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD libosmogb.pc.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD libosmogsm.pc.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD libosmovty.pc.in /gnuradio/osmocom/libosmocore-sq5bpf/
ADD m4 /gnuradio/osmocom/libosmocore-sq5bpf/m4/
ADD Makefile.am /gnuradio/osmocom/libosmocore-sq5bpf/
ADD README.md /gnuradio/osmocom/libosmocore-sq5bpf/
ADD src /gnuradio/osmocom/libosmocore-sq5bpf/src/
ADD tests /gnuradio/osmocom/libosmocore-sq5bpf/tests/
ADD TODO-RELEASE /gnuradio/osmocom/libosmocore-sq5bpf/
ADD utils /gnuradio/osmocom/libosmocore-sq5bpf/utils/

RUN cd /gnuradio/osmocom/libosmocore-sq5bpf && autoreconf -i && ./configure && make && make install && ldconfig

ENTRYPOINT ["/bin/bash"]
