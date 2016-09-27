//
//  main.m
//  ClassAndObjectPractice0926
//
//  Created by Nexus_MYT on 2016. 9. 26..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GradeCalculator.h"
#import "DimensionalShapes.h"
#import "Toolbox.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 1. 평균 구하는 학점 계산기 예제
        GradeCalculator *cal = [[GradeCalculator alloc] init];
        [cal addScore:85];
        [cal addScore:93];
        [cal addScore:71];
        NSLog(@"%lf",[cal averageScore]);
        
        // 2. 도형 치수 구하기
//        DimensionalShapes *shape = [[DimensionalShapes alloc] init];
//        [shape squareLength:3.5];
//        [shape rectangleLength:10 width:7];
//        [shape circleRadius:4];
//        [shape triangleBottom:3 height:4];
//        [shape trapezoidBottom:5 top:3 height:7];
//        [shape cubeLength:4];
//        [shape rectangularSolidLength:3 height:5 width:7];
//        [shape circularCylinderRadius:4 height:5];
//        [shape sphereRadius:4];
//        [shape coneRadius:4 height:3];
        
        // 3. 클래스 메소드 예제
        // NSString 의 리터럴 문법 소개. 클래스 메소드는 이런 식으로도 쓰인다
//        
//        NSString *name = @"joo";
//        NSString *myName = [NSString stringWithFormat:@"my name is %@",name];
//        NSString *myNameInit = [[NSString alloc] initWithFormat:@"my name is %@",name];
//        
//        NSString *str = [[NSString alloc] initWithString:@"hihihi"];
//        NSString *str2 = @"hihihi";
        
        // 4. 툴박스 만들기 (클래스 메소드 연습)
        NSLog(@"%ld",[ToolBox timeToSecond:11320]);
        NSLog(@"%lf",[ToolBox inchToCm:1]);
        NSLog(@"%lf",[ToolBox cmToInch:1]);
        
        [ToolBox isEvenNumber:14];
        
        // 5. 성적 등급 매기기
        NSInteger score = 40;
        NSString *grade = [cal determineGrade:score];
        CGFloat point = [cal gradeToPoint:grade];
        NSLog(@"score:%ld grade:%@", score, grade);
        NSLog(@"grade:%@ point:%.1lf", grade, point);
        
        // 6. 달의 마지막날 구하기 - 달을 입력 받으면 해당 달의 마지막 날을 반환 해준다
        ToolBox *toolBox = [[ToolBox alloc] init];
        for (NSInteger month = 1; month <= 12; month++) {
            NSLog(@"month:%ld lastDay:%ld", month, [toolBox lastDayOfMonth:month]);
        }
        
        // 7. 문제들
        // 7-1. 절대값 구하기
        NSInteger inputNumber = -124;
        NSLog(@"Input number: %ld absolute number: %ld", inputNumber, [toolBox absoluteNum:(inputNumber)]);
        
        // 7-2. 반올림 문제
        // 임의의 소수 생성하기
        CGFloat randomNumber = 0.521323495521500;
//        NSLog(@"origin:%.15lf, result:%.15lf", randomNumber, [toolBox roundGenerator:randomNumber orderNumbers:5]);
        
        // 7-3. 윤년 구하는 문제 : 윤년은 기본적으로 매 4년마다 돌아오나, 100으로 나눠떨어지는 해는 윤년이 아니며 또 그중 400으로 나눠 떨어지는 해는 윤년이다. 2000년은 윤년이고, 1955년은 윤년이 아니다. checkLeapYear(1955), checkLeapYear(2000)
        // if ((year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0)) -> 윤년
        [toolBox checkLeapYear:1995];
        [toolBox checkLeapYear:2000];
        
        
    }
    return 0;
}
