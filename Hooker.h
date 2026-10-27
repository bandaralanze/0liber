#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Hooker : NSObject
+ (void)swizzleClass:(Class)cls selectorToHook:(SEL)sel factoryBlock:(id)factoryBlock;
+ (NSMutableDictionary *)swizzledClassesDictionary;
+ (id)swizzledClassesForKey:(NSString *)key;
+ (void)hookInstanceMethod:(SEL)sel inClass:(Class)cls newImpFactory:(id)newImpFactory hookMode:(int)mode hookKey:(NSString *)key;
+ (void)hookClassMethod:(SEL)sel inClass:(Class)cls newImpFactory:(id)newImpFactory;
@end
