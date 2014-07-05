//
//  KVCTrampoline.m
//  KVCTrampoline
//
//  Created by Nicolas @ bou.io on 24/05/13.
//  Copyright (c) 2013 bou.io. All rights reserved.
//

#import "KVCTrampoline.h"
#import <objc/runtime.h>

@interface KVCTrampoline ()
@property (weak)id object;
@end

@implementation KVCTrampoline
- (id)objectForKeyedSubscript:(id)key
{
    return [self.object valueForKeyPath:key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    [self.object setValue:obj forKeyPath:(NSString*)key];
}
@end

@implementation NSObject (KVCTrampoline)

@dynamic kvc;
@dynamic onceToken;

- (void)setKvc:(KVCTrampoline*)object {
    objc_setAssociatedObject(self, @selector(kvc), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (KVCTrampoline*) kvc
{
    dispatch_once_t onceToken = [((NSNumber*)objc_getAssociatedObject(self, @selector(onceToken))) longValue];
    dispatch_once(&onceToken, ^{
        self.kvc = [KVCTrampoline new];
        objc_setAssociatedObject(self, @selector(onceToken), @(-1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });
    
    return objc_getAssociatedObject(self, @selector(kvc));
}
@end
