# Inherit common Canned stuff
$(call inherit-product, vendor/canned/config/common_mobile.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
