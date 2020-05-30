// SpotifyBlue by Kodey Thomas, follow me on Twitter @ThomasKodey

// import headers
#import <tweak.h>
#import <UIKit/UIKit.h>

// because UIApplication isnt hooked and is a seperate class we need to interface it
// the bruh bit basically tells theos to stfu and stop being a bitch about a duplicate interface, it doesnt matter whatever you put here
@interface UIApplication (bruh)

// returns the appinstance
+(id)sharedApplication;

// this method takes two arguments and launches an app
-(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;

@end

// creates a variable called runBefore, we need to do this because otherwise whenever -(BOOL)connected is called
// and a bluetooth device is connected it opens spotify, this happens seemingly randomly.
BOOL runBefore = NO;


// this hooks into the class BluetoothDevice from the BluetoothManager framework
%hook BluetoothDevice

// uses the variable connected, who's type is a boolan. this means it can either be a true or false
// obj-c doesnt use TRUE and FALSE it uses YES and NO
-(BOOL)connected { 
 
	// isDeviceConnected is the same value as our Boolan connected
	BOOL isDeviceConnected = %orig; 

	// if the boolan is TRUE open spotify AND runBefore is false
	if (isDeviceConnected == YES && runBefore == NO)

		//opens spotify
		[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.spotify.client" suspended:FALSE];

		// say that we have run our modified code and too not open spotify again until runBefore is False
		runBefore = YES; 

		// returns the value back to the method
		return isDeviceConnected;

}
	
%end

// we now want too hook into the class SBBluetoothController to detect when we disconnect our bluetooth speaker or we change our output
%hook SBBluetoothController


// looking through SBBluetoothController.h there is a method that when a device disconnects
-(void)removeDeviceNotification:(id)arg1 { 
	
	// set out runBefore variable to false so the method can launch spotify when we reconnect our bluetooth speaker
	runBefore = NO;

	// execute original code
	%orig; 
	
	}

%end