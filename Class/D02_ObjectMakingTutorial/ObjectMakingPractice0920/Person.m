//
//  Person.m
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

// 선언부 @interface Person -> 구현부 @implementation Person
#import "Person.h"

@implementation Person

- (id)run {
    NSLog(@"do run");
    return nil;
}

- (id)runTo:(id)location bySpeed:(id)velocity {
    NSLog(@"do run to %@ with %@", location, velocity);
    return nil;
}

- (Person *)sleep {
    NSLog(@"do sleep");
    return self;
}

- (id)talk {
    NSLog(@"do talk");
    return nil;
}

- (id)think {
    NSLog(@"do think about %@", self);
    return nil;
}

- (id)eat {
    NSLog(@"do eat %@", self);
    return nil;
}

@end
