//
//  RedWarrior.h
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 공격력이 보통 Warrior 클래스 보다 2배인 클래스
@interface RedWarrior : NSObject

@property id name;
@property id health;
@property id mana;
@property id physicalPower;
@property id magicalPower;

/**
 * 공격을 표현하는 메소드
 * @param to 타겟 이름
 * @param damage 공격 결과 발생하는 데미지
 */
- (id)doAttack:(id)to with:(id)damage;

/**
 * 공격스킬 Bash를 표현하는 메소드
 * @param to 타겟 이름
 * @param damage 공격 결과 발생하는 데미지
 */
- (id)doBash:(id)to with:(id)damage;

/** 
 * 공격스킬 Whirlwind를 표현하는 메소드
 * @param to 타겟 이름
 * @param damage 공격 결과 발생하는 데미지
 */
- (id)doWhirlwind:(id)to with:(id)damage;

/**
 * 회복스킬 FirstAid를 표현하는 메소드
 * @param healAmount 회복량
 */
- (id)doFirstAid:(id)healAmount;

@end
