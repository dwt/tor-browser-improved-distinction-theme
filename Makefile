xpi = dist/torbrowser-improved-distinction.xpi
files := $(filter-out dist, $(wildcard *))

SHELL = /bin/sh
.PHONY: all clean

all: $(xpi)

clean:
	-rm -f $(xpi)

$(xpi): $(files)
	zip -r $@ $?

dist/update-installed-xpi: $(xpi) 
	# sadly mac only 
	-open -a Firefox $(xpi)
	# -firefox $(xpi)
	-touch $@
