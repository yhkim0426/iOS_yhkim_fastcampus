//
//  Wizard.h
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "GameCharacter.h"

@interface Wizard : GameCharacter

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

// 마법사의 행동을 메소드로 나타냄
- (id)magicalAttackTo:(GameCharacter *)someone;
- (id)teleportTo:(NSString *)location;
- (id)windstormTo:(GameCharacter *)someone;

@end
