# SAMx8

# (C) 2023-2025 Ciaran Anscomb
#
# Released under the Creative Commons Attribution-ShareAlike 4.0
# International License (CC BY-SA 4.0).  Full text in the LICENSE file.

# Requires GNU Make.

PACKAGE_NAME = samx8
PACKAGE_VERSION = 1.0

CPLD_TARGETS = \
	cpld/samx8.jed cpld/samx8.svf

# No variants for the SAMx8, so no additional targets.

ALL_CPLD_TARGETS = $(CPLD_TARGETS)

.PHONY: default
default: $(CPLD_TARGETS)

.PHONY: all
all: $(ALL_CPLD_TARGETS)

###

$(ALL_CPLD_TARGETS):
	$(MAKE) -C cpld $(notdir $@)

# CPLD build needs ISE environment variables, but we need to override those for
# the PDF build.

doc/samx8.pdf:
	LD_LIBRARY_PATH= $(MAKE) -C doc samx8.pdf

###

distdir = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

.PHONY: dist
dist: $(CPLD_TARGETS) doc/samx8.pdf
	@if test -e "$(distdir)"; then echo "$(distdir) exists: not creating zip" >&2; exit 1; fi
	ln -s . "$(distdir)"
	git archive --format=zip --prefix=$(distdir)/ -o $(distdir).zip HEAD
	zip $(distdir).zip $(foreach t,$(CPLD_TARGETS),$(distdir)/$(t))
	zip $(distdir).zip $(distdir)/doc/samx8.pdf
	rm -f "$(distdir)"

###

.PHONY: clean
clean:
	$(MAKE) -C cpld clean
	$(MAKE) -C doc clean

.PHONY: clena
clena: clean
	@echo "How much clena do you want it?"

.PHONY: distclean
distclean: clean
	$(MAKE) -C cpld distclean
