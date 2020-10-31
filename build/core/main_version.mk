# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.canned.buildtype=$(CANNED_BUILD_TYPE) \
    ro.canned.build.date=$(CANNED_BUILD_DATE) \
    ro.canned.display.version=$(CANNED_DISPLAY_VERSION) \
    ro.canned.android_version=$(ANDROID_VERSION) \
    ro.canned.releasetype=$(CANNED_BUILD_TYPE) \
    ro.cannedversion=$(CANNEDVERSION) \
    ro.canned.version=$(CANNED_VERSION) \
    ro.modversion=$(CANNED_MOD_VERSION) \
    ro.canned.ziptype=$(CANNED_VARIANT) \
    org.canned.fingerprint=$(CANNED_FINGERPRINT)
