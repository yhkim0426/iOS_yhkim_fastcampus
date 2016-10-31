//
//  GradeCalculator.h
//  ClassAndObjectPractice0926
//
//  Created by Nexus_MYT on 2016. 9. 26..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1. 학점 계산기 클래스 만들기
 2. property 만들기
    - 총점
    - 과목 갯수(더하는 횟수만큼이 과목 갯수가 됨)
 3. method 만들기
    - 과목 점수 더하는 함수
    - 평균 구하는 함수
 */
@interface GradeCalculator : NSObject

// SWIFT : var totalScore:NSInteger
@property NSInteger totalScore;
@property NSInteger subjectCount;

- (void)addScore:(NSInteger)score;
- (CGFloat)averageScore;
- (NSString *)determineGrade:(CGFloat)score;
- (CGFloat)gradeToPoint:(NSString *)grade;

@end
