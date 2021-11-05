INSTALLKMODDIR:=$(INSTALLDIR)/lib/modules/$(LINUX_KERNEL)
PBBINS=$(wildcard prebuilt/*)
QCA_DIAG_LIBS=$(filter %.so,$(PBBINS))
QCA_DIAG_EXEC=$(filter-out $(QCA_DIAG_LIBS),$(PBBINS))

all:

install:
	@[ -d $(INSTALLDIR)/usr/lib ] || install -d $(INSTALLDIR)/usr/lib
	@for i in $(QCA_DIAG_LIBS); do install -D $$i $(INSTALLDIR)/usr/lib ; done
	@[ -d $(INSTALLDIR)/usr/sbin ] || install -d $(INSTALLDIR)/usr/sbin
	@for i in $(QCA_DIAG_EXEC); do install -D $$i $(INSTALLDIR)/usr/sbin ; done
	@$(STRIP) $(INSTALLDIR)/usr/sbin/*

clean:

stage:
