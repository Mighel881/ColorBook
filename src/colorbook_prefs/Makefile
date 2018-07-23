include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = colorbook_prefs
colorbook_prefs_FILES = pr0crustes_cobo_RootListController.m
colorbook_prefs_INSTALL_PATH = /Library/PreferenceBundles
colorbook_prefs_FRAMEWORKS = UIKit
colorbook_prefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/colorbook_prefs.plist$(ECHO_END)
