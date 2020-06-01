include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SpotifyBluePrefs

SpotifyBluePrefs_FILES = BRUHRootListController.m
SpotifyBluePrefs_INSTALL_PATH = /Library/PreferenceBundles
SpotifyBluePrefs_FRAMEWORKS = UIKit
SpotifyBluePrefs_PRIVATE_FRAMEWORKS = Preferences
SpotifyBluePrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
SpotifyBluePrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SpotifyBluePrefs.plist$(ECHO_END)
