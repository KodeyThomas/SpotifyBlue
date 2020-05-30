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
 
	BOOL r = %orig; 

	// if the boolan is TRUE open spotify
	if (r == YES)

		// opens spotify (if it hasnt been opened before by the tweak)
		// we do this by checking if it has been runBefore if no we open spotify
		if (runBefore == NO)

			// we call UIApplication and launch the method 'launchApplicationWithIdentifier'
			// it takes two arguments, the BundleID of the app we want to open and want to launch the app not suspended
			[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.spotify.client" suspended:FALSE];
			runBefore = YES;

		// exec orignal code
		return r;
	
	// if the boolan is FALSE do nothing
	if (r == NO)

		// exec orginal code
		return r;

}
	
%end

// we now want too hook into the class SBBluetoothController to detect when we disconnect our bluetooth speaker or we change our output
%hook SBBluetoothController

// looking through SBBluetoothController.h there is a method that notes when devices are changed, such as connecting or disconnecting
-(void)noteDevicesChanged { 
	
	// set out runBefore variable to false so the method can launch spotify when we reconnect our bluetooth speaker
	runBefore = NO;

	// execute original code
	%orig; 
	
	}

%end