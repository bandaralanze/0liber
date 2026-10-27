#import "Log.h"

@implementation Log
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self redirectLog];
    });
}
+ (void)redirectLog {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *logPath = [documentsDirectory stringByAppendingPathComponent:@"Liber_Permanent_Output.log"];
    freopen([logPath UTF8String], "a+", stderr);
}
- (instancetype)initWithFileName:(NSString *)fileName forClassName:(NSString *)className {
    self = [super init];
    if (self) {
        _fileName = fileName;
        _className = className;
        _recorded = YES;
    }
    return self;
}
+ (void)addFileName:(NSString *)fileName className:(NSString *)className {}
- (NSString *)indention { return @"  "; }
- (void)start:(NSString *)methodId parameters:(NSArray *)parameters {}
- (void)end:(NSString *)methodId parameters:(NSArray *)parameters returnValue:(id)returnValue {}
@end
