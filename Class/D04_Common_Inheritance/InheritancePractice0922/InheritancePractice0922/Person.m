//
//  Person.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)eat:(NSString *)food {
    NSLog(@"%@ do eat %@", self.name, food);
    return nil;
}

- (id)eat {
    NSLog(@"%@ do eat %@", self.name, @"집밥");
    return nil;
}

- (id)adopt:(Animal *)animal {
    NSLog(@"%@ 가 %@ 을 입양했습니다.", self.name, animal.name);
    return nil;
}

@end
