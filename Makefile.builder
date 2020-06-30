ifeq ($(filter $(DIST), stretch buster),)
DEBIAN_BUILD_DIRS := debian-pkg/debian
SOURCE_COPY_IN := source-debian-copy-in
endif

NO_ARCHIVE := 1

source-debian-copy-in: VERSION = $(shell cat $(ORIG_SRC)/version)
source-debian-copy-in: ORIG_FILE = $(CHROOT_DIR)/$(DIST_SRC)/librepo_$(VERSION).orig.tar.gz
source-debian-copy-in: SRC_FILE  = $(ORIG_SRC)/librepo-$(VERSION).tar.gz
source-debian-copy-in:
	cp -p $(SRC_FILE) $(ORIG_FILE)
	tar xvf $(SRC_FILE) -C $(CHROOT_DIR)/$(DIST_SRC)/debian-pkg --strip-components=1

# vim: ft=make
