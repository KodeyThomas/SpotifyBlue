// SpotifyBlue by Kodey Thomas, follow me on Twitter @ThomasKodey

// import headers
#import <tweak.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>

// because UIApplication isnt hooked and is a seperate class we need to interface it
// the bruh bit basically tells theos to stfu and stop being a bitch about a duplicate interface, it doesnt matter whatever you put here
@interface UIApplication (bruh)

// returns the appinstance
+(id)sharedApplication;

// this method takes two arguments and launches an app
-(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;

@end

// we are accessing Cephei from a tweak and it likes to throw hands if we do this so we
// set this boolean to true and it stops it. this is from the offical cephei docs
%hook HBForceCepheiPrefs

+ (BOOL)forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear {
    return YES;
}

%end
#

// initalize variables

// creates a variable called runBefore, we need to do this because otherwise whenever -(BOOL)connected is called
// and a bluetooth device is connected it opens spotify, this happens seemingly randomly.
// also create some more booleans we need for our tweak settings
BOOL runBefore = NO;
BOOL isEnabled;
BOOL spotifyEnabled;
BOOL appleEnabled;

// this hooks into the class BluetoothDevice from the BluetoothManager framework
%hook BluetoothDevice

// uses the variable connected, who's type is a boolan. this means it can either be a true or false
// obj-c doesnt use TRUE and FALSE it uses YES and NO
-(BOOL)connected {

	// isDeviceConnected is the same value as our Boolan connected
	BOOL isDeviceConnected = %orig;

	// if the boolan is TRUE open spotify AND runBefore is false
	if (isDeviceConnected == YES && runBefore == NO) {

    if(isEnabled) {

      if(spotifyEnabled) {

        //opens spotify
        [[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.spotify.client" suspended:FALSE];

        // say that we have run our modified code and too not open spotify again until runBefore is False
        runBefore = YES;

        // returns the value back to the method
        return isDeviceConnected;

      }

      if(appleEnabled) {

        //opens apple music
        [[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.Music" suspended:FALSE];

        // say that we have run our modified code and too not open apple music again until runBefore is False
        runBefore = YES;

        // returns the value back to the method
        return isDeviceConnected;

      }
    }
  }

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


// gather user defined settings from the tweak settings
// this section of code gets the values from our PreferenceBundle to check if the tweak is enabled and other settings.
%ctor {
  //create HBPreferences instance
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"tech.kodeycodesstuff.spotifyblueprefs"];


  //registers preference variables, naming the preference key and variable the same thing reduces confusion for me.

  // checks if our tweak is enabled and assigns our variable 'isEnabled' to the value of that.
  [preferences registerBool:&isEnabled default:YES forKey:@"isEnabled"];

  // checks to see if the user wants to open spotify instead of apple music
  [preferences registerBool:&spotifyEnabled default:YES forKey:@"spotifyEnabled"];

  // checks to see if the user wants to open apple music instead of spotify
  [preferences registerBool:&appleEnabled default:YES forKey:@"appleEnabled"];

}
