PBBINS=$(wildcard prebuilt/*)
QCA_IOT_LIBS=$(filter %.so,$(PBBINS))
QCA_IOT_EXEC=$(filter-out $(QCA_IOT_LIBS),$(PBBINS))

all:

install: all
	@[ -d $(INSTALLDIR)/usr/bin ] || install -d $(INSTALLDIR)/usr/bin
	@[ -d $(INSTALLDIR)/usr/lib ] || install -d $(INSTALLDIR)/usr/lib
	@for i in $(QCA_IOT_EXEC); do install -m 755 -D $$i $(INSTALLDIR)/usr/bin ; done
	@for i in $(QCA_IOT_LIBS); do install -m 755 -D $$i $(INSTALLDIR)/usr/lib ; done
	@-$(STRIP) $(INSTALLDIR)/usr/bin/*
	@$(STRIP) $(INSTALLDIR)/usr/lib/*

clean:

stage:
