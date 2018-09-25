TARGET = iphone:11.2:10.0

THEOS_DEVICE_IP = 192.168.1.6

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ColorBook
ColorBook_FILES = $(wildcard tweak/*.mm tweak/*.xm)

include $(THEOS_MAKE_PATH)/tweak.mk

# Subprojects (pref)
SUBPROJECTS += colorbook_prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
# end subprojects

