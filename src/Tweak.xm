// Macros that will be used for loading prefs
#define _PLIST "/var/mobile/Library/Preferences/me.pr0crustes.colorbook_prefs.plist"
#define pref_getValue(key) [[NSDictionary dictionaryWithContentsOfFile:@(_PLIST)] valueForKey:key]
#define pref_getBool(key) [pref_getValue(key) boolValue]

// Globals vars
bool global_enabled = false;
CGFloat global_red = 1.0;
CGFloat global_green = 1.0;
CGFloat global_blue = 1.0;

@interface _UINavigationBarContentView : UIView
@end

@interface _UIBarBackground : UIView
@end

@interface _UIStatusBarForegroundView : UIView
@end

static float getFloatPref(NSString *name) {
    CGFloat asFloat = [pref_getValue(name) floatValue] ?: nil;

    if (asFloat < 0) {
        return 0.0;
    } else if (asFloat > 1) {
        return 1.0;
    } else {
        return asFloat;
    }
}

static void loadPrefs() {
    global_enabled = pref_getBool(@"pref_enable");
    global_red = getFloatPref(@"pref_red");
    global_blue = getFloatPref(@"pref_blue");
    global_green = getFloatPref(@"pref_green");
}

static void applyColor(UIView *view) {
    UIColor *color = [UIColor colorWithRed:global_red green:global_green blue:global_blue alpha:1.0];
    [view setBackgroundColor:color];
}

%group COLOR_FACE

    %hook _UINavigationBarContentView

        -(void)layoutSubviews {
            applyColor(self);
        }

    %end

    %hook _UIBarBackground

        -(void)layoutSubviews {
            applyColor(self);
        }

    %end

    %hook _UIStatusBarForegroundView

        -(void)layoutSubviews {
            applyColor(self);
        }

    %end

%end


%ctor {

    loadPrefs();

    if (global_enabled) {
        %init(COLOR_FACE);
    }

}
