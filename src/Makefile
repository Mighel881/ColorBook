# For deploy
# TARGET = iphone:clang
TARGET = iphone:11.2:10.0
# end deploy

# For simulator
# TARGET = simulator:clang::7.0
# ARCHS = x86_64
# end simulator

# Needed to 'make package install'
THEOS_DEVICE_IP = 192.168.1.8

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ColorBook
ColorBook_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

# Subprojects (pref)
SUBPROJECTS += colorbook_prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
# end subprojects

