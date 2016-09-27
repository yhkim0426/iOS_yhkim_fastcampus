//
//  DimensionalShapes.m
//  ClassAndObjectPractice0926
//
//  Created by Nexus_MYT on 2016. 9. 26..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "DimensionalShapes.h"

@interface DimensionalShapes()

@property CGFloat pi;

@end

@implementation DimensionalShapes

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pi = 3.14;
    }
    return self;
}

/// 정사각형 넓이 A와 둘레 P를 구하는 메소드
- (void)squareLength:(CGFloat)length {
    NSString *shapeName = @"정사각형";
    CGFloat A = length*length;
    CGFloat P = 4*length;
    NSLog(@"%@| s=%lf 일 때, A=%lf, P=%lf 입니다.", shapeName, length, A, P);
}

/// 직사각형의 넓이 A와 둘레 P를 구하는 메소드
- (void)rectangleLength:(CGFloat)length width:(CGFloat)width {
    NSString *shapeName = @"직사각형";
    CGFloat A = length * width;
    CGFloat P = 2*length + 2*width;
    NSLog(@"%@| l=%lf, w=%lf 일 때, A=%lf, P=%lf 입니다.", shapeName, length, width, A, P);
}

/// 원의 넓이 A와 둘레 P를 구하는 메소드
- (void)circleRadius:(CGFloat)radius {
    NSString *shapeName = @"원";
    CGFloat A = self.pi * radius * radius;
    CGFloat P = 2 * self.pi * radius;
    NSLog(@"%@| r=%lf 일 때, A=%lf, P=%lf 입니다.", shapeName, radius, A, P);
}

/// 삼각형의 넓이 A를 구하는 메소드
- (void)triangleBottom:(CGFloat)bottom height:(CGFloat)height {
    NSString *shapeName = @"삼각형";
    CGFloat A = (bottom * height)/2;
    NSLog(@"%@| b=%lf, h=%lf 일 때, A=%lf 입니다.", shapeName, bottom, height, A);
}

/// 사다리꼴 넓이 A를 구하는 메소드
- (void)trapezoidBottom:(CGFloat)bottom top:(CGFloat)top height:(CGFloat)height {
    NSString *shapeName = @"사다리꼴";
    CGFloat A = height * (bottom + top) / 2;
    NSLog(@"%@| a=%lf, b=%lf, h=%lf 일 때, A=%lf 입니다.", shapeName, bottom, top, height, A);
}

/// 정육면체 부피 V를 구하는 메소드
- (void)cubeLength:(CGFloat)length {
    NSString *shapeName = @"정육면체";
    CGFloat V = length * length * length;
    NSLog(@"%@| s=%lf 일 때, V=%lf 입니다.", shapeName, length, V);
}

/// 육면체 부피 V를 구하는 메소드
- (void)rectangularSolidLength:(CGFloat)length height:(CGFloat)height width:(CGFloat)width {
    NSString *shapeName = @"육면체";
    CGFloat V = length * width * height;
    NSLog(@"%@| l=%lf, h=%lf, w=%lf 일 때, V=%lf 입니다.", shapeName, length, height, width, V);
}

/// 원기둥 부피 V를 구하는 메소드
- (void)circularCylinderRadius:(CGFloat)radius height:(CGFloat)height {
    NSString *shapeName = @"원기둥";
    CGFloat V = self.pi * radius * radius * height;
    NSLog(@"%@| r=%lf, h=%lf 일 때, V=%lf 입니다.", shapeName, radius, height, V);
}

/// 구 부피 V를 구하는 메소드
- (void)sphereRadius:(CGFloat)radius {
    NSString *shapeName = @"구";
    CGFloat V = self.pi * radius * radius * radius * 3 / 4;
    NSLog(@"%@| r=%lf 일 때, V=%lf 입니다.", shapeName, radius, V);
}

/// 원뿔 부피 V를 구하는 메소드
- (void)coneRadius:(CGFloat)radius height:(CGFloat)height {
    NSString *shapeName = @"원뿔";
    CGFloat V = self.pi * radius * radius * height / 3;
    NSLog(@"%@| r=%lf, h=%lf 일 때, V=%lf 입니다.", shapeName, radius, height, V);
}

@end
