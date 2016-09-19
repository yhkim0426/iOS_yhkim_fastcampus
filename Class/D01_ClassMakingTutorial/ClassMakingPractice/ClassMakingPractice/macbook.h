//
//  macbook.h
//  ClassMakingPractice
//
//  Created by Nexus_MYT on 2016. 9. 19..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

// 맥북 클래스
@interface macbook : NSObject

// 맥북의 무게
@property id weight;

// 맥북의 가격
@property id price;

// 맥북의 OS 버전이름
@property id osVersion;

// 맥북의 CPU 종류
@property id cpuType;

// 맥북의 연산속도
@property id speedOfCalculating;


// 애플 로고를 화면에 띄우는 메소드
- (id)showAppleLogo;

// 연산을 시행하는 메소드
- (id)doCalculation;

// 업데이트 하는 메소드
- (id)doUpdate;

// 로그인 하는 메소드
- (id)doLogin;

// 와이파이 연결하는 메소드
- (id)connectWIFI;

// 스케줄 보여주는 메소드
- (id)showSchedule;

@end
