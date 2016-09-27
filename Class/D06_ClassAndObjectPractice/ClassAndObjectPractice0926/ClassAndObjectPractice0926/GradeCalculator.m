//
//  GradeCalculator.m
//  ClassAndObjectPractice0926
//
//  Created by Nexus_MYT on 2016. 9. 26..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "GradeCalculator.h"

@implementation GradeCalculator

// 점수를 받아서 토탈 변수에 더함
// 더해진 점수마다 과목 카운트를 하나씩 늘린다.
- (void)addScore:(NSInteger)score {
    self.totalScore = self.totalScore + score;
    self.subjectCount = self.subjectCount + 1;
}

// 과목 평균 점수를 출력
- (CGFloat)averageScore {
    // 이렇게 하면 소수점 아래가 하나도 안나온다. -> 형변환 필요
    // return self.totalScore / self.subjectCount;
    if (self.subjectCount < 0) {
        return 0;
    }
    return (CGFloat)self.totalScore / (CGFloat)self.subjectCount;
}

// 변수 초기화가 필요하다!
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.totalScore = 0;
        self.subjectCount = 0;
    }
    return self;
}

/// 점수를 받아서 성적을 결정하는 메소드
- (NSString *)determineGrade:(CGFloat)score {
    NSString *grade;
    
    if (score<=100 && score >=90) {
        grade = @"A+";
    } else if (score <=90 && score >=80) {
        grade = @"A";
    } else if (score <=80 && score >=70) {
        grade = @"B+";
    } else if (score <=70 && score >=60) {
        grade = @"B";
    } else if (score <=60 && score >=50) {
        grade = @"B+";
    } else if (score <=50 && score >=40) {
        grade = @"C+";
    } else if (score <=40 && score >=30) {
        grade = @"C";
    } else {
        grade = @"F";
    }
    
    return grade;
}

/// 성적 받아서 Point 로 변환하는 메소드
- (CGFloat)gradeToPoint:(NSString *)grade {
    CGFloat point = 0;
    
    if ([grade  isEqual:@"A+"]) {
        point = 4.5;
    } else if ([grade isEqual:@"A"]) {
        point = 4.0;
    } else if ([grade isEqual:@"B+"]) {
        point = 3.5;
    } else if ([grade isEqual:@"B"]) {
        point = 3.0;
    } else {
        point = 2.5;
    }
    
    return point;
}

@end
