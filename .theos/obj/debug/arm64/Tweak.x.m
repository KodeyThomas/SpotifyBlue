#line 1 "Tweak.x"



#import <tweak.h>
#import <UIKit/UIKit.h>



@interface UIApplication (bruh)


+(id)sharedApplication;


-(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;

@end



BOOL runBefore = NO;




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBBluetoothController; @class BluetoothDevice; 
static BOOL (*_logos_orig$_ungrouped$BluetoothDevice$connected)(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$BluetoothDevice$connected(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBBluetoothController$removeDeviceNotification$)(_LOGOS_SELF_TYPE_NORMAL SBBluetoothController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBBluetoothController$removeDeviceNotification$(_LOGOS_SELF_TYPE_NORMAL SBBluetoothController* _LOGOS_SELF_CONST, SEL, id); 

#line 25 "Tweak.x"




static BOOL _logos_method$_ungrouped$BluetoothDevice$connected(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 
 
	
	BOOL isDeviceConnected = _logos_orig$_ungrouped$BluetoothDevice$connected(self, _cmd); 

	
	if (isDeviceConnected == YES && runBefore == NO)

		
		[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.spotify.client" suspended:FALSE];

		
		runBefore = YES; 

		
		return isDeviceConnected;

}
	







static void _logos_method$_ungrouped$SBBluetoothController$removeDeviceNotification$(_LOGOS_SELF_TYPE_NORMAL SBBluetoothController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) { 
	
	
	runBefore = NO;

	
	_logos_orig$_ungrouped$SBBluetoothController$removeDeviceNotification$(self, _cmd, arg1); 
	
	}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BluetoothDevice = objc_getClass("BluetoothDevice"); MSHookMessageEx(_logos_class$_ungrouped$BluetoothDevice, @selector(connected), (IMP)&_logos_method$_ungrouped$BluetoothDevice$connected, (IMP*)&_logos_orig$_ungrouped$BluetoothDevice$connected);Class _logos_class$_ungrouped$SBBluetoothController = objc_getClass("SBBluetoothController"); MSHookMessageEx(_logos_class$_ungrouped$SBBluetoothController, @selector(removeDeviceNotification:), (IMP)&_logos_method$_ungrouped$SBBluetoothController$removeDeviceNotification$, (IMP*)&_logos_orig$_ungrouped$SBBluetoothController$removeDeviceNotification$);} }
#line 66 "Tweak.x"
