//
//  DiabloCharacterDefault.m
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "DiabloCharacterDefault.h"

@interface DiabloCharacterDefault()

@property NSString *name;
@property NSString *jobType;
@property NSInteger health;
@property NSInteger mana;
@property NSInteger physicalPower;
@property NSInteger magicalPower;
@property NSInteger level;
@property BOOL isPoisoned;
@property BOOL isDead;

@end

@implementation DiabloCharacterDefault

- (instancetype)initWithCharacterSetting:(NSString *)name jobType:(NSString *)jobType {
    self = [super init];
    
    self.name = name;
    self.jobType = jobType;
    
    [self defaultSetting];
    
    return self;
}

- (id)defaultSetting{
    if ([self.jobType isEqualToString:@"Barbarian"]) {
        self.health = 100;
        self.mana = 20;
        self.physicalPower = 60;
        self.magicalPower = 20;
    } else if ([self.jobType isEqualToString:@"Sorceress"]) {
        self.health = 70;
        self.mana = 100;
        self.physicalPower = 30;
        self.magicalPower = 60;
    } else {
        NSLog(@"캐릭터 생성에 실패했습니다.");
        return nil;
    }
    NSLog(@"%@ 가 생성되었습니다. health: %ld mana: %ld physicalPower: %ld magicalPower: %ld",
          self.jobType, self.health, self.mana, self.physicalPower, self.magicalPower);
    return nil;
}

// 기본 물리공격
- (id)physicalAttackTo:(DiabloCharacterDefault *)target manaUsed:(NSInteger)manaUsed {
    [self checkStatus];
    if (self.isDead == NO) {
        NSLog(@"%@ (이)가 %@ 에게 물리공격을 가했습니다.", self.name, target.name);
    
        // 상대의 체력을 깎는 메소드 (내 물리공격력 만큼)
        NSInteger damage = [target damageAs:self.physicalPower];
        
        // 기술 사용 전 마나
        NSInteger originMana = self.mana;
        // 기술 양만큼 마나를 깎음
        [self reduceMana:manaUsed];
        // 기술 사용 후 마나
        NSInteger afterMana = self.mana;
        // 마나를 사용한 경우에만 아래의 메시지 표시
        if (manaUsed > 0) {
            NSLog(@"%@ 의 마나가 %ld 에서 %ld 로 감소했습니다.", self.name, originMana, afterMana);
        }
        NSLog(@"%@ 은 %ld 만큼 데미지를 입었습니다.", self.name, damage);
    } else {
        NSLog(@"%@ 는 죽었습니다. 공격할 수 없습니다.", self.name);
    }
    return nil;
}

// 기본 마법공격
- (id)magicalAttackTo:(DiabloCharacterDefault *)target manaUsed:(NSInteger)manaUsed {
    [self checkStatus];
    if (self.isDead == NO && self.mana > 0) {
        NSLog(@"%@ (이)가 %@ 에게 물리공격을 가했습니다.", self.name, target.name);
    
        // 상대의 체력을 깎는 메소드 (내 마법공격력 만큼)
        NSInteger damage = [target damageAs:self.physicalPower];
        
        // 기술 사용 전 마나
        NSInteger originMana = [self getMana];
        // 기술 양만큼 마나를 깎음
        [self reduceMana:manaUsed];
        // 기술 사용 후 마나
        NSInteger afterMana = [self getMana];
        // 마나를 사용한 경우에만 아래의 메시지 표시
        if (manaUsed > 0) {
            NSLog(@"%@ 의 마나가 %ld 에서 %ld 로 감소했습니다.", self.name, originMana, afterMana);
        }
        NSLog(@"%@ 은 %ld 만큼 데미지를 입었습니다.", self.name, damage);
    } else {
        NSLog(@"%@ 는 죽었습니다. 공격할 수 없습니다.", self.name);
    }
    return nil;
}

// 캐릭터 상태 체크
- (id)checkStatus {
    if (self.health <= 0) {
        NSLog(@"%@ 는 죽었습니다.", self.name);
        self.isDead = YES;
    }
    
    if (self.mana <= 0) {
        NSLog(@"마나가 고갈되었습니다. 기술을 쓸 수 없습니다.");
        
    }
    
    if (self.isPoisoned) {
        NSLog(@"%@ 는 중독되었습니다.", self.name);
        [self damageAs:10];
        self.isPoisoned = YES;
    }
    return nil;
}

// 받은 데미지만큼 내 체력 깎고, 받은 데미지를 리턴함
- (NSInteger)damageAs:(NSInteger)damage {
    [self setHealth:(self.health - damage)];
    return damage;
}

// 받은 사용량만큼 내 마나 깎음
- (id)reduceMana:(NSInteger)manaUsed {
    self.mana = self.mana - manaUsed;
    return nil;
}

//// 레벨에 따른 설정값 변경
//- (id)

// 프로퍼티 값 참조 및 수정
- (NSInteger)getHealth {
    return _health;
}

//- (void)setHealth:(NSInteger)newHealth {
//    _health = newHealth;
//}

- (NSInteger)getMana {
    return _mana;
}

//- (void)setMana:(NSInteger)newMana {
//    _mana = newMana;
//}

@end

//@implementation CharacterSelector
//
//- (id)initWithID:(NSString *)id {
//    if ([super.jobType isEqualToString:@"Barbarian"]) {
//        return [[Barbarian alloc] initWithName:];
//    } else if ([super.jobType isEqualToString:@"Sorceress"]) {
//        return [[Sorceress alloc] init];
//    }
//    
//    NSLog(@"캐릭터 생성에 실패했습니다.");
//    return nil;
//}
//
//@end
//
//@implementation Barbarian
//
//- (instancetype)init {
//    self = [super init];
//    
//    
//}
//
//@end
//
//@implementation Sorceress
//
//- (instancetype)init {
//    self = [super init];
//    
//    
//}
//
//@end
