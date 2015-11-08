LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),z3dual)
    include $(call first-makefiles-under,$(LOCAL_PATH))
endif
