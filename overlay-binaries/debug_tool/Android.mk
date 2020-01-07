LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=   \
        debug_tool.c

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -Wno-missing-field-initializers

LOCAL_PROPRIETARY_MODULE := true

LOCAL_MODULE:= debug_tool

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

include $(BUILD_EXECUTABLE)
