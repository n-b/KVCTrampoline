//
//  Tests.m
//  Tests
//
//  Created by Nicolas @ bou.io on 24/05/13.
//  Copyright (c) 2013 bou.io. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "KVCTrampoline.h"

// Test Class
@interface Person : NSObject
@property NSString * name;
@property Person * partner;
@end
@implementation Person
@end

@interface Tests : SenTestCase
@end
@implementation Tests

- (void)testKVCTrampoline
{
    // Test Getter
    Person * batman = [Person new];
    batman.name = @"Batman";
    STAssertEqualObjects(batman.kvc[@"name"], @"Batman", nil);

    // Test Setter
    batman.kvc[@"name"] = @"Bruce Wayne";
    STAssertEqualObjects(batman.name, @"Bruce Wayne", nil);
    
    // Test Key Path
    Person * robin = [Person new];
    batman.kvc[@"partner"] = robin;
    batman.kvc[@"partner.name"] = @"Dick Grayson";
    STAssertEqualObjects(robin.name, @"Dick Grayson", nil);
}

@end
