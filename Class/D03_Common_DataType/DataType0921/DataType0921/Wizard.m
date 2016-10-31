//
//  Wizard.m
//  DataType0921
//
//  Created by Nexus_MYT on 2016. 9. 21..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Wizard.h"
#import "Warrior.h"

@implementation Wizard

/// 상대에게 독 공격을 시도하는 메소드. 시도시 상대에게 10 데미지를 주고, 상태를 중독으로 변경함
- (id)poisonAttack:(Warrior *)target {
    NSUInteger originHealth = target.health;
    target.health = target.health - 10;
    NSUInteger afterHealth = target.health;
    target.isPoisoned = YES;
    
    NSLog(@"%@ (이)가 %@ 에게 독 공격을 시도했습니다.", self.name, target.name);
    NSLog(@"%@ 의 체력이 %ld 에서 %ld로 변경되었습니다.", target.name, originHealth, afterHealth);
    
    [self characterStatus];
    return nil;
}

- (id)magicalAttackTo:(Warrior *)target {
    NSUInteger originHealth = target.health;
    NSUInteger damage = target.health - self.magicalPower;
    target.health = damage;
    NSUInteger afterHealth = target.health;
    
    NSLog(@"%@ (이)가 %@ 에게 마법공격을 가하여 %ld 만큼의 데미지를 입혔습니다.",
          self.name, target.name, damage);
    NSLog(@"%@ 의 체력이 %ld 에서 %ld 으로 변경되었습니다.", target.name, originHealth, afterHealth);
    
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
