#import <Foundation/Foundation.h>

@interface HookInfo : NSObject
@property (nonatomic, assign) SEL originalSelector;
@property (nonatomic, copy) id impProviderBlock;
- (IMP)getOriginalImplementation;
@end
