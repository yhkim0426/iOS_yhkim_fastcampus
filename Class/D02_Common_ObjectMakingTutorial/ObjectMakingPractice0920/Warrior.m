//
//  Wizard.m
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Warrior.h"

@implementation Warrior

- (id)doAttak: (id)weapon {
    NSLog(@"do attack with %@", weapon);
    return nil;
}

- (id)doDefend {
    NSLog(@"do Defend");
    return nil;
}

- (id)doPK {
    NSLog(@"do PK");
    return nil;
}

- (id)spellBash {
    NSLog(@"spell Bash with %@ physicalPower", self.physicalPower);
    return nil;
}

- (id)spellWhirlwind {
    NSLog(@"spell Whirlwind with %@ physicalPower", self.physicalPower);
    return nil;
}

@end
