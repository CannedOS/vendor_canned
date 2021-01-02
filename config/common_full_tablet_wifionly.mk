# Inherit full common Lineage stuff
$(call inherit-product, vendor/canned/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

