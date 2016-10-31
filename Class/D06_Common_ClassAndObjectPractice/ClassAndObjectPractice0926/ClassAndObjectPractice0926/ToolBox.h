//
//  ToolBox.h
//  ClassAndObjectPractice0926
//
//  Created by Nexus_MYT on 2016. 9. 26..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 각 치수 전환 class 메소드 만들기
 1. inch to cm, cm to inch (2개)
 2. m2 to 평, 평 to m2 (2개)
 3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)
 4. 데이터량 (KB to MB, MB to GB) (2개)
 5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로 변경
    ex) 11320 >> 4400 초 (1시간 13분 20초)
 */

@interface ToolBox : NSObject

+ (CGFloat)inchToCm:(CGFloat)inch;
+ (CGFloat)cmToInch:(CGFloat)cm;

+ (NSInteger)timeToSecond:(NSInteger)time;
+ (BOOL)isEvenNumber:(NSInteger)input;
- (NSInteger)lastDayOfMonth:(NSInteger)month;
- (NSInteger)absoluteNum:(NSInteger)number;
- (CGFloat)roundGenerator:(CGFloat)randomNumber orderNumbers:(NSInteger)orderNumbers;
- (void)checkLeapYear:(NSInteger)year;
@end
