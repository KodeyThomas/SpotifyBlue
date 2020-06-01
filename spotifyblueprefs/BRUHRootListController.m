#include "BRUHRootListController.h"

@implementation BRUHRootListController

-(NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
	}

//Add respring method that we call with a PSButtonCell in our root.plist
-(void)respringMethod {
	[HBRespringController respring];
}

//Adds a method to open the github link for the sourcecode
- (void)openGithub {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/KodeyThomas/SpotifyBlue"]];
}

@end
