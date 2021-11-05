# qca-nss-fw-cp-retail & qca-nss-fw-eip-cp

# Convert asuswrt build environment variable to qca-nss-fw-eip-hk
PKG_BUILD_DIR=$(shell pwd)/source

# Define variables for qca-nss-fw-eip-hk
INSTALLFWDIR:=$(INSTALLDIR)/lib/firmware
EIP_FW:=ifpp.bin ipue.bin ofpp.bin opue.bin

all:
	@#Nothing to do

install:
	@echo Install NSS firmware.
	install -d $(INSTALLFWDIR)
	install -d $(INSTALLFWDIR)/qca
	install -m 644 $(PKG_BUILD_DIR)/retail_router0.bin $(INSTALLFWDIR)/qca-nss0-retail.bin
	ln -sf qca-nss0-retail.bin $(INSTALLFWDIR)/qca-nss0.bin
	install -m 644 $(foreach fw,$(EIP_FW),$(PKG_BUILD_DIR)/$(fw)) $(INSTALLFWDIR)

clean:
	@#Nothing to do
