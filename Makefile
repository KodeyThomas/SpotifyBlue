INSTALL_TARGET_PROCESSES = SpringBoard
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpotifyBlue

SpotifyBlue_FILES = Tweak.x
SpotifyBlue_CFLAGS = -fobjc-arc
SpotifyBlue_FRAMEWORK = UIKit
SpotifyBlue_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
SpotifyBlue_PRIVATE_FRAMEWORK = BluetoothManager

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += spotifyblueprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
