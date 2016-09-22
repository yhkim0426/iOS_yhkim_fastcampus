//
//  GameCharacter.h
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacter : NSObject {
}

//// 캐릭터의 속성을 프로퍼티로 나타냄
//@property NSInteger health;
//@property NSInteger mana;
//@property NSInteger physicalPower;
//@property NSInteger magicalPower;
//@property BOOL isDead;
//@property NSString *name;
//@property NSString *weapon;

// 캐릭터의 행동을 메소드로 나타냄
- (id)physicalAttackTo:(GameCharacter *)someone;
- (id)damagedAs:(NSInteger)damage;
- (NSString *)getName;
- (void)setName:(NSString *)newName;
- (NSInteger)getHealth;
- (void)setHealth:(NSInteger)newHealth;
- (NSInteger)getMana;
- (void)setMana:(NSInteger)newMana;

@end
