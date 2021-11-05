PBBINS=$(wildcard prebuilt/*)
QCAHOSTAP_SH=$(filter %.sh,$(PBBINS))
QCAHOSTAP_EXEC=$(filter-out $(QCAHOSTAP_SH),$(PBBINS))

# librt.so
CROSS_TOOLCHAIN_DIR=$(TOOLCHAIN)
ifneq ($(or $(MUSL32),$(MUSL64)),y)
LIBRT_FILE=$(shell basename $(CROSS_TOOLCHAIN_DIR)/lib/librt-*.so)
endif

all:

install:
ifneq ($(or $(MUSL32),$(MUSL64)),y)
	@install -D $(CROSS_TOOLCHAIN_DIR)/lib/$(LIBRT_FILE) $(INSTALLDIR)/lib/$(LIBRT_FILE)
	@cd $(INSTALLDIR)/lib && ln -sf $(LIBRT_FILE) librt.so
	@cd $(INSTALLDIR)/lib && ln -sf $(LIBRT_FILE) librt.so.0
	@cd $(INSTALLDIR)/lib && ln -sf $(LIBRT_FILE) librt.so.1
	$(STRIP) $(INSTALLDIR)/lib/*.so
endif
	@[ -d $(INSTALLDIR)/usr/bin ] || install -d $(INSTALLDIR)/usr/bin
	@for i in $(QCAHOSTAP_EXEC); do install -D $$i $(INSTALLDIR)/usr/bin ; done
	@$(STRIP) $(INSTALLDIR)/usr/bin/*
ifeq ($(AMAS),y)
	@[ -d $(INSTALLDIR)/usr/sbin ] || install -d $(INSTALLDIR)/usr/sbin
	@for i in $(QCAHOSTAP_SH); do install -D $$i $(INSTALLDIR)/usr/sbin ; done
endif

clean:

stage:
