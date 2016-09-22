//
//  Warrior.h
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "GameCharacter.h"

@interface Warrior : GameCharacter

/*
 // 캐릭터의 속성을 프로퍼티로 나타냄
 @property NSInteger health;
 @property NSInteger mana;
 @property NSInteger physicalPower;
 @property NSInteger magicalPower;
 @property BOOL isDead;
 @property NSString *name;
 @property NSString *weapon;
 
 // 캐릭터의 행동을 메소드로 나타냄
 - (id)physicalAttackTo:(id)someone;
 */

// 전사의 행동을 메소드로 나타냄
- (id)jumpTo:(NSString *)location;
- (id)smashTo:(GameCharacter *)someone;
- (id)whirlwindTo:(GameCharacter *)someone;
//- (id)magicalAttackTo:(id)someone;

@end
