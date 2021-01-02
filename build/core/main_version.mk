# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.canned.version=$(CANNED_VERSION) \
    ro.canned.releasetype=$(CANNED_BUILDTYPE) \
    ro.canned.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(CANNED_VERSION) \
    ro.cannedlegal.url=https://lineageos.org/legal

# LineageOS Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.canned.display.version=$(CANNED_DISPLAY_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.canned.build.version.plat.sdk=$(CANNED_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.canned.build.version.plat.rev=$(CANNED_PLATFORM_REV)
