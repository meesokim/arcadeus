###############################################################################
#
# mupen64plus-rsp-hle
#
###############################################################################

MUPEN64PLUS_RSP_HLE_VERSION = 2.5
MUPEN64PLUS_RSP_HLE_SITE = https://github.com/mupen64plus/mupen64plus-rsp-hle.git
MUPEN64PLUS_RSP_HLE_SITE_METHOD = git
MUPEN64PLUS_RSP_HLE_DEPENDENCIES = mupen64plus-core

define MUPEN64PLUS_RSP_HLE_BUILD_CMDS
	CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
	HOST_CPU="$(MUPEN64PLUS_CPU)" \
	APIDIR="$(STAGING_DIR)/usr/include/mupen64plus" \
	$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
	-C $(@D)/projects/unix all $(MUPEN64PLUS_PARAMS)
endef

define MUPEN64PLUS_RSP_HLE_INSTALL_TARGET_CMDS
	CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
	HOST_CPU="$(MUPEN64PLUS_CPU)" \
	APIDIR="$(STAGING_DIR)/usr/include/mupen64plus" \
	$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" INSTALL_STRIP_FLAG="" \
	LDCONFIG="true" PREFIX="/usr" \
	-C $(@D)/projects/unix DESTDIR=$(TARGET_DIR) install $(MUPEN64PLUS_PARAMS)
endef
	
$(eval $(generic-package))
