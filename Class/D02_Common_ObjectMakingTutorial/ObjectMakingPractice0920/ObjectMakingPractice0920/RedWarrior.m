//
//  RedWarrior.m
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "RedWarrior.h"

@implementation RedWarrior

- (id)doAttack:(id)to with:(id)damage {
    NSLog(@"%@ do Attack to %@ with %@ damage", self.name, to, damage);
    return damage;
}

- (id)doBash:(id)to with:(id)damage {
    NSLog(@"%@ do Bash to %@ with %@ damage", self.name, to, damage);
    return damage;
}

- (id)doWhirlwind:(id)to with:(id)damage {
    NSLog(@"%@ do whirlwind to %@ with %@ damage", self.name, to, damage);
    return damage;
}

- (id)doFirstAid:(id)healAmount {
    NSLog(@"%@ do First aid and recover %@ hp", self.name, healAmount);
    return nil;
}

@end
