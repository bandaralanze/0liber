#import <Foundation/Foundation.h>
#import "Log.h"

// 1. Bypass IPAwind Token Expiration & Licensing Checks completely
%hook GACAppCheckToken
- (instancetype)initWithToken:(NSString *)token expirationDate:(NSDate *)expirationDate receivedAtDate:(NSDate *)receivedAtDate {
    // Force distant future expiration date so it never expires permanently
    return %orig(@"PERMANENT_UNBOUND_TOKEN", [NSDate distantFuture], [NSDate date]);
}
%end

// 2. Intercept and redirect remote server checks to prevent locking/revocation
%hook NSURL
+ (NSURL *)URLWithString:(NSString *)URLString {
    if ([URLString containsString:@"ipawind.com"]) {
        // Redirect API calls away from validation server
        return %orig(@"https://httpbin.org/json");
    }
    return %orig(URLString);
}
%end

// 3. Remove chat and group restrictions
%hook _TtC8Palringo23ChatInputBarWrapperView
- (void)setUserCannotTalkInConversation:(BOOL)arg1 {
    %orig(NO);
}
%end

%hook SBChatInputResponderTableView
- (void)setUserCannotTalkInThisGroup:(BOOL)arg1 {
    // Handling signature flexibility safely
    %orig(NO);
}
%end

%ctor {
    @autoreleasepool {
        [Log load];
    }
}
