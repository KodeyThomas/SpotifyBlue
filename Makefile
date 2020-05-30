INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_DEVICE_IP = 192.168.1.152

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpotifyBlue

$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORK = UIKit
$(TWEAK_NAME)_PRIVATE_FRAMEWORK = BluetoothManager

include $(THEOS_MAKE_PATH)/tweak.mk
