//
//  Wizard.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard

- (id)magicalAttackTo:(GameCharacter *)someone {
    NSLog(@"%@ 가 %@ 에게 마법공격을 했습니다.", self.getName, someone.getName);
    return nil;
}

- (id)teleportTo:(NSString *)location {
    NSLog(@"%@ 가 %@ 로 순간이동 했습니다.", self.getName, location);
    return nil;
}

- (id)windstormTo:(GameCharacter *)someone {
    NSLog(@"%@ 가 %@ 에게 윈드스톰을 날렸습니다.", self.getName, someone.getName);
    return nil;
}

@end
