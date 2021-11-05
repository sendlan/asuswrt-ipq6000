# Convert asuswrt build environment variable to qca-hk
PKG_BUILD_DIR=$(shell pwd)/source

# Define variables for qca-wifi-fw
INSTALLFWDIR:=$(INSTALLDIR)/lib/firmware
overwrite_files:= $(filter-out REG_CTL, $(shell ls $(BUILD_NAME)))

all:
	@#Nothing to do

install:
	install -d $(INSTALLDIR)/vendor/firmware
	install -d $(INSTALLFWDIR)/IPQ6018
	install -m 644 $(PKG_BUILD_DIR)/* $(INSTALLFWDIR)/IPQ6018
	[ ! -e $(BUILD_NAME) ] || [ "$(overwrite_files)" == "" ] || (cd $(BUILD_NAME) && install -m 644 $(overwrite_files) $(INSTALLFWDIR)/IPQ6018)
	ln -sf IPQ6018/firmware_rdp_feature.ini $(INSTALLFWDIR)/firmware_rdp_feature.ini
	@#ln -sf /tmp/IPQ6018/caldata.bin $(INSTALLFWDIR)/IPQ6018/caldata.bin

clean:
	@#Nothing to do
