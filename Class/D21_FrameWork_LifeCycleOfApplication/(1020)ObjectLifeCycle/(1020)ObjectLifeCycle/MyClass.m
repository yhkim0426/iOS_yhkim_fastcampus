//
//  MyClass.m
//  (1020)ObjectLifeCycle
//
//  Created by Nexus_MYT on 2016. 10. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

+ (instancetype)alloc {
    NSLog(@"My class instance alloc");
    return [super alloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"My class instance init");
    }
    return self;
}

// arc 가 dealloc override 는 super dealloc 을 금지하고 있음.
- (void)dealloc {
    NSLog(@"My class instance dealloc");
}

@end
