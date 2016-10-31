//
//  Archer.m
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Archer.h"

@implementation Archer

- (id)run {
    NSLog(@"run");
    return nil;
}

- (id)runTo:(id)location bySpeed:(id)speed with:(id)someone {
    NSLog(@"run to %@ by %@ speed with %@", location, speed, someone);
    return nil;
}

@end
