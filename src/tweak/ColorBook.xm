#import "headers/_UIBarBackground.h"
#import "headers/_UINavigationBarContentView.h"
#import "headers/_UIStatusBarForegroundView.h"


#define _PLIST @"/var/mobile/Library/Preferences/me.pr0crustes.colorbook_prefs.plist"
#define MACRO_prefValue(key) [[NSDictionary dictionaryWithContentsOfFile:_PLIST] valueForKey:key]
#define MACRO_prefBool(key) [MACRO_prefValue(key) boolValue]
#define MACRO_RANDOM_VALUE (arc4random() / ((double) (((long long) 2<<31) - 1)))


bool global_random = false;
CGFloat global_red = 1.0;
CGFloat global_green = 1.0;
CGFloat global_blue = 1.0;


static float getFloatPref(NSString* name) {
    if (global_random) {
        return MACRO_RANDOM_VALUE;
    }

    CGFloat asFloat = [MACRO_prefValue(name) floatValue];

    if (asFloat <= 0.0) {
        return 0.0;
    } else if (asFloat >= 1.0) {
        return 1.0;
    } else {
        return asFloat;
    }
}

static void loadPrefs() {
    global_random = MACRO_prefBool(@"pref_random"); // Needs to be the first
    global_red = getFloatPref(@"pref_red");
    global_blue = getFloatPref(@"pref_blue");
    global_green = getFloatPref(@"pref_green");
}

static void applyColor(UIView *view) {
    UIColor *color = [UIColor colorWithRed:global_red green:global_green blue:global_blue alpha:1.0];
    [view setBackgroundColor:color];
}



%group GROUP_COLOR

    %hook _UINavigationBarContentView

        -(void)layoutSubviews {
            %orig;
            applyColor(self);
        }

    %end


    %hook _UIBarBackground

        -(void)layoutSubviews {
            %orig;
            applyColor(self);
        }

    %end


    %hook _UIStatusBarForegroundView

        -(void)layoutSubviews {
            %orig;
            applyColor(self);
        }

    %end

%end



%ctor {

    loadPrefs();

    if (MACRO_prefBool(@"pref_enable")) {
        %init(GROUP_COLOR);
    }

}
