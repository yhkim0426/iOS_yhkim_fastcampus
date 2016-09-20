//
//  BlueWizard.m
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "BlueWizard.h"

@implementation BlueWizard

- (id)windstorm:(id)to {
    NSLog(@"spell windstorm to %@ with %@ damage", to, self.magicalPower);
    return nil;
}

- (id)magicalAttack:(id)to {
    NSLog(@"spell magicalAttack to %@ with %@ damage", to, self.magicalPower);
    return nil;
}

- (id)heal:(id)to {
    NSLog(@"do heal to %@", to);
    return nil;
}

- (id)blizzard:(id)to with:(id)level {
    NSLog(@"spell blizzard to %@ with %@ level and %@ damage", to, level, self.magicalPower);
    return nil;
}

- (NSString *)pk:(id)targetName {
    NSLog(@"do pk with %@",targetName);
    return targetName;
}

@end
