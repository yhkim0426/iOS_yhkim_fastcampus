//
//  Chicken.h
//  ClassMakingPractice
//
//  Created by Nexus_MYT on 2016. 9. 19..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

// 치킨 클래스
@interface Chicken : NSObject

// 치킨의 국적
@property id nationality;

// 치킨의 종
@property id species;
@property id weight;
@property id age;

// 치킨의 지방함량
@property id fatAmount;

// 부리로 쪼는 메소드
- (id)attack;

// 해가 뜨는 플래그 발동시
// 하울링 시작
- (id)hawling;
- (id)run;

// 프라이드 치킨으로 변환되는 메소드
- (id)transformIntoFriedChicken;

// 치킨의 생사를 변환하는 메소드
- (id)born;
- (id)dead;

@end
