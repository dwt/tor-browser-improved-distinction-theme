xpi = dist/torbrowser-improved-distinction@haecker.me.xpi
files := $(filter-out dist, $(wildcard *))

SHELL = /bin/sh
.PHONY: all clean xpi

all: clean xpi

clean:
	-rm -f dist/*

xpi: $(xpi)
$(xpi): $(files)
	zip -r $@ $?

# refresh plugin installed in local firefox for improved testing
dist/update-installed-xpi: $(xpi) 
	# sadly mac only 
	-open -a Firefox $(xpi)
	# -firefox $(xpi)
	-touch $@

.PHONY: watch
watch: $(xpi)
	watching_testrunner --pattern='*' -- make dist/update-installed-xpi