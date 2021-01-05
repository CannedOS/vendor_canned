include vendor/canned/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/canned/config/BoardConfigQcom.mk
endif

include vendor/canned/config/BoardConfigSoong.mk
