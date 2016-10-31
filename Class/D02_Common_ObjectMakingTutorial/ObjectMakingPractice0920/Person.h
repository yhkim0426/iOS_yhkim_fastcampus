//
//  Person.h
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 사람을 나타내는 클래스입니다.
 * author yhkim
 * version 0.1
 */

// Person Class
@interface Person : NSObject

/// 사람이름
@property id name;
@property id age;
@property id gender;
@property id height;
@property id weight;

/**
 * 사람이 뛰어가는 것을 메소드로 표현한 것
 */
- (id)run;

/**
 * 사람이 하는 행동들을 메소드로 표현한 것
 * @param location 뛰어서 가려는 목적지 이름
 * @param velocity 목적지로 가는 속도
 */
- (id)runTo:(id)location bySpeed:(id)velocity;

/**
 * 사람이 말하는 행동을 메소드로 표현한 것
 */
- (id)talk;

/**
 * 사람이 생각하는 행동을 메소드로 표현한 것
 */
- (id)think;

/**
 * 사람이 먹는 행동을 메소드로 표현한 것
 */
- (id)eat;

/**
 * 사람이 잠자는 행동을 메소드로 표현한 것
 * @return sleep 메소드의 주소값(self)을 반환
 */
- (Person *)sleep;

@end
