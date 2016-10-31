//
//  Warrior.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Warrior.h"

@implementation Warrior

//- (id)init {
//    self = [super init];
//    self.health = 1000;
//    self.mana = 100;
//    self.physicalPower = 100;
//    return self;
//}

- (id)whirlwindTo:(GameCharacter *)someone {
    NSLog(@"%@ 가 %@ 에게 whirlwind 를 시전했습니다.", self.getName, someone.getName);
    return nil;
}

- (id)smashTo:(GameCharacter *)someone {
    NSLog(@"%@ 가 %@ 에게 강한공격을 시전했습니다.", self.getName, someone.getName);
    return nil;
}

- (id)jumpTo:(NSString *)location {
    NSLog(@"%@ 가 %@ 로 점프를 시전했습니다.", self.getName, location);
    return nil;
}

@end
