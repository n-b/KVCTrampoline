//
//  KVCTrampoline.m
//  KVCTrampoline
//
//  Created by Nicolas @ bou.io on 24/05/13.
//  Copyright (c) 2013 bou.io. All rights reserved.
//

#import "KVCTrampoline.h"

@interface KVCTrampoline ()
@property id object;
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
- (KVCTrampoline*) kvc
{
    KVCTrampoline * kvc = [KVCTrampoline new];
    kvc.object = self;
    return kvc;
}
@end