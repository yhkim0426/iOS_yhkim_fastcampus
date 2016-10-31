//
//  Warrior.m
//  DataType0921
//
//  Created by Nexus_MYT on 2016. 9. 21..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"

@implementation Warrior

/// 전사의 물리 공격력 만큼 마법사의 체력을 감소시킵니다
- (id)physicalAttackTo:(Wizard *)target{

    // 마법사의 이전 체력
    NSUInteger originHealth = target.health;
    // 공격! (물리공격력 : self.physicalPower - 마법사 방어력: target.protection)
    NSUInteger damage = (self.physicalPower - target.protection);
    target.health = originHealth - damage;
    // 마법사의 이후 체력
    NSUInteger afterHealth = target.health;
    
    // 로그: 전사가 마법사에게 물리공격을 가하여 xx 만큼의 데미지를 입혔습니다.
    // 마법사의 체력이 XX에서 XX으로 변경되었습니다.
    
    NSLog(@"%@ (이)가 %@ 에게 물리공격을 가하여 %ld 만큼의 데미지를 입혔습니다.",
          self.name, target.name, damage);
    NSLog(@"%@ 의 체력이 %ld 에서 %ld 으로 변경되었습니다.",
          target.name, originHealth, afterHealth);
    
    [self characterStatus];
    
    return nil;
}

/// 캐릭터의 상태를 나타냅니다. 독에 중독되면 매 동작마다 체력이 10씩 감소. 체력이 0 이하로 떨어지면 죽은 상태로 변경
- (BOOL)characterStatus {
    
    if (self.isPoisoned) {
        self.health -= 10;
        NSLog(@"%@ (이)가 독에 중독되었습니다", self.name);
        NSLog(@"10 만큼의 데미지를 입었습니다");
    }
    
    if (self.health <= 0) {
        NSLog(@"%@ (은)는 죽었습니다.", self.name);
        self.isDead = YES;
        return NO;
    }
    
    return YES;
}


@end
