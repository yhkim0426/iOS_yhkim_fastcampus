//
//  Dog.m
//  DataType0921
//
//  Created by Nexus_MYT on 2016. 9. 21..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (id)cry {
    self.theirOwn = @"멍멍";
    [super cry];
    return nil;
}

@end
