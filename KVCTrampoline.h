//
//  KVCTrampoline.h
//  KVCTrampoline
//
//  Created by Nicolas @ bou.io on 24/05/13.
//  Copyright (c) 2013 bou.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCTrampoline : NSObject
- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;
@end

@interface NSObject (KVCTrampoline)
@property (readonly) KVCTrampoline* kvc;
@end
