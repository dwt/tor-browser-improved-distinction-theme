zipfile = torbrowser-improved-distinction.xpi
files := $(filter-out $(zipfile), $(wildcard *))

SHELL = /bin/sh
.PHONY: all clean

all: $(zipfile)

$(zipfile): $(files)
	zip -r $@ $(files)

clean:
	-rm -f $(zipfile)