//
//  GameCharacter.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "GameCharacter.h"

@interface GameCharacter ()

// 캐릭터의 속성을 프로퍼티를 나타냄 (은닉화)
@property (nonatomic)NSInteger health;
@property (nonatomic)NSInteger mana;
@property NSInteger physicalPower;
@property NSInteger magicalPower;
@property BOOL isDead;
@property (nonatomic)NSString *name;
@property NSString *weapon;

@end

@implementation GameCharacter
//@synthesize name = _name;

- (id)physicalAttackTo:(GameCharacter *)someone {
//    NSLog(@"%@ 가 %@ 에게 물리공격을 가합니다.", self.name ,someone.name);
    
    // 정보 노출을 최소화 하면서 상대의 체력을 깎는 방법 (은닉화)
    [someone damagedAs:self.physicalPower];
    return nil;
}

/// 외부에서 들어오는 데미지 정보에 대해 내가 나의 체력을 깎음 (은닉화)
- (id)damagedAs:(NSInteger)damage {
    self.health = self.health - damage;
    return nil;
}

- (NSString *)getName { // getter 이름값을 가져온다.
    return self.name;
}

- (void)setName:(NSString *)newName { // setter 이름값을 새로운 값으로 변경가능
    self.name = newName;
}

- (NSInteger)getHealth { // getter 체력값을 가져온다.
    return self.health;
}

- (void)setHealth:(NSInteger)newHealth { // setter 체력값을 새로운 값으로 변경가능
    self.health = newHealth;
}

- (NSInteger)getMana { // getter 마나값을 가져온다.
    return self.mana;
}

- (void)setMana:(NSInteger)newMana { // setter 마나값을 새로운 값으로 변경가능
    self.mana = newMana;
}


@end
