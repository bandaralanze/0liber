#import <Foundation/Foundation.h>

@interface Log : NSObject
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, assign) BOOL recorded;
+ (void)load;
+ (void)redirectLog;
- (instancetype)initWithFileName:(NSString *)fileName forClassName:(NSString *)className;
+ (void)addFileName:(NSString *)fileName className:(NSString *)className;
- (NSString *)indention;
- (void)start:(NSString *)methodId parameters:(NSArray *)parameters;
- (void)end:(NSString *)methodId parameters:(NSArray *)parameters returnValue:(id)returnValue;
@end
