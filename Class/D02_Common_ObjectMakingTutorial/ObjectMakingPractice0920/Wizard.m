//
//  Warrior.m
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard

- (id)doAttack:(id)weapon {
    NSLog(@"do attack with %@", weapon);
    return nil;
}

- (id)doDefend:(id)weapon {
    NSLog(@"do Defend with %@", weapon);
    return nil;
}

- (id)doPK:(id)target {
    NSLog(@"do PK with %@", target);
    return nil;
}

- (id)spellFireball:(id)target {
    NSLog(@"spell Fireball to %@ with %@ magicalPower", target, self.magicalPower);
    return nil;
}

- (id)spellTeleport:(id)target {
    NSLog(@"spell Teleport to %@ with %@ magicalPower", target, self.magicalPower);
    return nil;
}

@end
