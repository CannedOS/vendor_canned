# Copyright (C) 2021 CannedOS Project 2021
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ANDROID_VERSION := 11.0
CANNED_VERSION := v1.0

CANNED_BUILD_TYPE ?= UNOFFICIAL
CANNED_BUILD_DATE := $(shell date +%Y%m%d-%H%M)
TARGET_PRODUCT_SHORT := $(subst canned_,,$(CANNED_BUILD))

# ZIP TYPE
ifeq ($(WITH_GAPPS), true)
CANNED_BUILD_VARIANT := GAPPS
include vendor/google/gms/config.mk
else
CANNED_BUILD_VARIANT := VANILLA
endif

# OFFICIAL_DEVICES
ifeq ($(CANNED_BUILD_TYPE), OFFICIAL)
   LIST = $(shell cat vendor/canned/canned.devices)
   ifeq ($(filter $(CANNED_BUILD), $(LIST)), $(CANNED_BUILD))
    IS_OFFICIAL=true
      CANNED_BUILD_TYPE := OFFICIAL

endif

ifneq ($(IS_OFFICIAL), true)
CANNED_BUILD_TYPE := UNOFFICIAL
$(error Device is not official "$(CANNED_BUILD)")
endif
endif

# MAIN
CANNED_VERSION := CannedOS-$(CANNEDVERSION)-$(CANNED_BUILD)-$(CANNED_BUILD_DATE)-$(CANNED_BUILD_TYPE)-$(CANNED_BUILD_VARIANT)

CANNED_MOD_VERSION :=$(ANDROID_VERSION)-$(CANNED_VERSION)

CANNED_DISPLAY_VERSION := CannedOS-$(CANNED_VERSION)-$(CANNED_BUILD_TYPE)

CANNED_FINGERPRINT := Canned_OS/$(CANNED_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)
