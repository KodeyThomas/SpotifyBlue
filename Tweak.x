// SpotifyBlue by Kodey Thomas, follow me on Twitter @ThomasKodey

// imports
#import <tweak.h>
#import <UIKit/UIKit.h>

@interface UIApplication (Blah)
+(id)sharedApplication;
-(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end

BOOL runBefore = NO;

// main hook
%hook BluetoothDevice

// uses the connected boolan
-(BOOL)connected { 
	%log; 
	BOOL r = %orig; 

	// if the boolan is TRUE open spotify
	if (r == YES)
		HBLogDebug(@" = %d", r);

		// opens spotify (if it hasnt been auto-opened before)
		if (runBefore == NO)
			[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.spotify.client" suspended:FALSE];
			runBefore = YES;

		// exec orignal code
		return r;
	
	// if the boolan is FALSE do nothing
	if (r == NO)

		// prints boolan in console log
		HBLogDebug(@" = %d", r);

		runBefore = NO;

		// exec orginal code
		return r;
	}

%end