# Inherit full common canned stuff
$(call inherit-product, vendor/canned/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include canned LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/canned/overlay/dictionaries

$(call inherit-product, vendor/canned/config/telephony.mk)
