# Versioning System
CANNED_BUILD_VERSION = RAVIOLI
CANNED_FLAVOUR = RAVIOLI
CANNED_BUILD_TYPE ?= UNOFFICIAL
CANNED_VARIANT ?= VANILLA
CANNED_BUILD_MAINTAINER ?= Unofficial maintainer
CANNED_BUILD_DONATE_URL ?= https://www.paypal.me/dartdental
CANNED_BUILD_SUPPORT_URL ?= https://t.me/CannedOS_chat

# Canned Release
ifeq ($(CANNED_BUILD_TYPE), OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat vendor/canned/canned.devices)
  FOUND_DEVICE =  $(filter $(CANNED_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(CANNED_BUILD))
      CANNED_BUILD_TYPE := OFFICIAL
    else
      CANNED_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(CANNED_BUILD)")
    endif
endif

# System version
TARGET_PRODUCT_SHORT := $(subst canned_,,$(CANNED_BUILD_TYPE))

CANNED_DATE_YEAR := $(shell date -u +%Y)
CANNED_DATE_MONTH := $(shell date -u +%m)
CANNED_DATE_DAY := $(shell date -u +%d)
CANNED_DATE_HOUR := $(shell date -u +%H)
CANNED_DATE_MINUTE := $(shell date -u +%M)


ifeq ($(CANNED_BUILD_TYPE), OFFICIAL)
    WITH_GMS := true
    TARGET_INCLUDE_LIVE_WALLPAPERS=true
    TARGET_INCLUDE_STOCK_GAPPS=true
endif
ifeq ($(WITH_GMS), true)
    CANNED_VARIANT := GAPPS
endif

CANNED_BUILD_DATE := $(CANNED_DATE_YEAR)$(CANNED_DATE_MONTH)$(CANNED_DATE_DAY)-$(CANNED_DATE_HOUR)$(CANNED_DATE_MINUTE)
CANNED_BUILD_FINGERPRINT := CannedOS/$(CANNED_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CANNED_BUILD_DATE)
CANNED_VERSION := CannedOS-$(CANNED_BUILD_VERSION)-$(CANNED_BUILD_TYPE)-$(CANNED_BUILD)-$(CANNED_BUILD_DATE)-$(CANNED_VARIANT)

PRODUCT_GENERIC_PROPERTIES += \
  ro.canned.device=$(CANNED_BUILD) \
  ro.canned.version=$(CANNED_VERSION) \
  ro.canned.build.version=$(CANNED_BUILD_VERSION) \
  ro.canned.build.type=$(CANNED_BUILD_TYPE) \
  ro.canned.build.date=$(CANNED_BUILD_DATE) \
  ro.canned.build.fingerprint=$(CANNED_BUILD_FINGERPRINT) \
  ro.canned.build.maintainer=$(CANNED_BUILD_MAINTAINER) \
  ro.canned.build.donate_url=$(CANNED_BUILD_DONATE_URL) \
  ro.canned.build.support_url=$(CANNED_BUILD_SUPPORT_URL)
