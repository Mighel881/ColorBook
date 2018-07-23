#include "pr0crustes_cobo_RootListController.h"

@implementation pr0crustes_cobo_RootListController

	- (NSArray *)specifiers {
		if (!_specifiers) {
			_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
		}

		return _specifiers;
	}

	-(void)onClickSourceCode:(id)arg1 {
		NSURL *url = [NSURL URLWithString:@"https://github.com/pr0crustes/"];
		[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
	}

	-(void)onClickResetPref:(id)arg1 {
		[[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Library/Preferences/me.pr0crustes.colorbook_prefs.plist" error:nil];
		[self reloadSpecifiers];
	}

@end
