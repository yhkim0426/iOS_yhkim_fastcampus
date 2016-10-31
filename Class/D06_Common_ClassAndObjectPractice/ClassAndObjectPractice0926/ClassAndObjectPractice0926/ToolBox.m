//
//  ToolBox.m
//  ClassAndObjectPractice0926
//
//  Created by Nexus_MYT on 2016. 9. 26..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox

/// inch -> cm 변환기
+ (CGFloat)inchToCm:(CGFloat)inch {
    CGFloat cm = inch * 2.54;
    return cm;
}

/// cm -> inch 변환기
+ (CGFloat)cmToInch:(CGFloat)cm {
    CGFloat inch = cm / 2.54;
    return inch;
}

/// m2 -> 평 변환기
+ (CGFloat)m2ToPyoung:(CGFloat)pyoung {
    CGFloat m2 = pyoung * 0.3025;
    return m2;
}

/// 평 -> m2 변환기
+ (CGFloat)pyoungToM2:(CGFloat)m2 {
    CGFloat pyoung = m2 / 0.3025;
    return pyoung;
}

/// 화씨 -> 섭씨 변환기
+ (CGFloat)fahrenheitToCelsius:(CGFloat)celsius {
    CGFloat fahrenheit = celsius * 9/5 + 32;
    return fahrenheit;
}

/// 섭씨 -> 화씨 변환기
+ (CGFloat)celsiusToFahrenheit:(CGFloat)fahrenheit {
    CGFloat celsius = (fahrenheit - 32)*5/9;
    return celsius;
}

/// 데이터량 KB -> MB
+ (CGFloat)kiloToMega:(CGFloat) kilobytes {
    CGFloat megabytes = kilobytes / 1000;
    return megabytes;
}

/// 데이터량 MB -> GB
+ (CGFloat)megaToGiga:(CGFloat)megabytes {
    CGFloat gigabytes = megabytes / 1000;
    return gigabytes;
}

/// 시간 변환기 시간(hhmmss) -> 초
+ (NSInteger)timeToSecond:(NSInteger)time {
    NSInteger hour = time / 10000;
    NSInteger minute = (time - hour*10000) / 100;
    NSInteger second = (time - hour*10000) % 100;
    return hour*3600 + minute*60 + second;
}

/// 물리 단위 변환기 뉴턴(Newton) -> kgf
+ (CGFloat)newtonToKgf:(CGFloat)newton {
    CGFloat kgf = newton / 9.80665;
    return kgf;
}

/// 물리 단위 변환기 kgf -> 뉴턴(Newton)
+ (CGFloat)kgfToNewton:(CGFloat)kgf {
    CGFloat newton = kgf * 9.80665;
    return newton;
}

/// 짝수, 홀수 판별기 1 (이 방법이 좀 더 안전하다)
+ (BOOL)isEvenNumber:(NSInteger)input {
    BOOL isEven = NO;
    
    if (input %2 == 0) {
        NSLog(@"%ld is even number", input);
        isEven = YES;
    } else {
        NSLog(@"%ld is odd number", input);
        isEven = NO;
    }
    return isEven;
}

/// 짝수, 홀수 판별기 2 (간결하지만, else로 끝나는게 아닐경우 에러가 난다)
+ (BOOL)isEvenNumber2:(NSInteger)input {
    
    if (input %2 == 0) {
        NSLog(@"%ld is even number", input);
        return YES;
    } else {
        NSLog(@"%ld is odd number", input);
        return NO;
    }
}

- (NSInteger)lastDayOfMonth:(NSInteger)month {
    NSInteger day = 0;
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day = 31;
            break;
        case 2:
            day = 28;
            break;
        default:
            day = 30;
            break;
    }
    return day;
}

- (NSInteger)absoluteNum:(NSInteger)number {
    if (number < 0) number = number * (-1);
    return number;
}

- (CGFloat)roundGenerator:(CGFloat)randomNumber orderNumbers:(NSInteger)orderNumbers {
    CGFloat randomNumberTmp = randomNumber;
    NSInteger count = 0;
    NSInteger fractal = 0;
    
    // 특정 조건이 될 때까지 10을 곱함 -> 다음 자릿수로 넘어감
    while (YES) {
        randomNumberTmp *=10;
        count++;
        if (((NSInteger)randomNumberTmp %10) == 0) {
//        if (randomNumberTmp)
            fractal = (CGFloat)((NSInteger)randomNumberTmp %10);
            NSLog(@"fractal: %ld",fractal);
            break;
        }
        NSLog(@"%ld %lf", count, randomNumberTmp);
    }
    NSLog(@"fractal: %ld",fractal);
    
    CGFloat plusFractal = 5;
    for (NSInteger i = count; i > 1; i--) {
        plusFractal /= 10;
        NSLog(@"%.19lf", plusFractal);
    }
    NSLog(@"%.15lf", randomNumber+plusFractal);
    return randomNumber+plusFractal;
}

- (void)checkLeapYear:(NSInteger)year {
    if ((year%4==0) && ((year%100 != 0) || (year%400 == 0))) {
//    if ((year%4==0) && (year%400 == 0)) {
        NSLog(@"%ld 는 윤년입니다.", year);
    } else {
        NSLog(@"%ld 는 윤년이 아닙니다.", year);
    }
}

@end
