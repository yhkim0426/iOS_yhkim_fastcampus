//
//  DimensionalShapes.h
//  ClassAndObjectPractice0926
//
//  Created by Nexus_MYT on 2016. 9. 26..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DimensionalShapes : NSObject

- (void)squareLength:(CGFloat)length;
- (void)rectangleLength:(CGFloat)length width:(CGFloat)width;
- (void)circleRadius:(CGFloat)radius;
- (void)triangleBottom:(CGFloat)bottom height:(CGFloat)height;
- (void)trapezoidBottom:(CGFloat)bottom top:(CGFloat)top height:(CGFloat)height;
- (void)cubeLength:(CGFloat)length;
- (void)rectangularSolidLength:(CGFloat)length height:(CGFloat)height width:(CGFloat)width;
- (void)circularCylinderRadius:(CGFloat)radius height:(CGFloat)height;
- (void)sphereRadius:(CGFloat)radius;
- (void)coneRadius:(CGFloat)radius height:(CGFloat)height;

@end
