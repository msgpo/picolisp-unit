# picolisp-unit Makefile

.PHONY: all

all: check

check:
		@for i in plain default; do PIL_NAMESPACES=false TEST_REPORTER="$$i" ./test.l; done
