#import "Hooker.h"

@implementation Hooker
+ (NSMutableDictionary *)swizzledClassesDictionary {
    static NSMutableDictionary *dict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = [NSMutableDictionary dictionary];
    });
    return dict;
}
+ (id)swizzledClassesForKey:(NSString *)key {
    return [[self swizzledClassesDictionary] objectForKey:key];
}
+ (void)swizzleClass:(Class)cls selectorToHook:(SEL)sel factoryBlock:(id)factoryBlock {
    if (!cls || !sel) return;
    Method method = class_getInstanceMethod(cls, sel);
    if (!method) return;
    IMP newImp = imp_implementationWithBlock(factoryBlock);
    method_setImplementation(method, newImp);
}
+ (void)hookInstanceMethod:(SEL)sel inClass:(Class)cls newImpFactory:(id)newImpFactory hookMode:(int)mode hookKey:(NSString *)key {
    [self swizzleClass:cls selectorToHook:sel factoryBlock:newImpFactory];
}
+ (void)hookClassMethod:(SEL)sel inClass:(Class)cls newImpFactory:(id)newImpFactory {
    Class metaClass = object_getClass(cls);
    [self swizzleClass:metaClass selectorToHook:sel factoryBlock:newImpFactory];
}
@end
