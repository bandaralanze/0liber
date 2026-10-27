TARGET = iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Liber

Liber_FILES = Tweak.xm Log.m Hooker.m HookInfo.m
Liber_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
