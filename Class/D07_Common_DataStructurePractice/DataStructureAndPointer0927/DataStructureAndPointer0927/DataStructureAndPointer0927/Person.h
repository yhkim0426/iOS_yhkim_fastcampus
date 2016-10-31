//
//  Person.h
//  DataStructureAndPointer0927
//
//  Created by Nexus_MYT on 2016. 9. 27..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct character
{
    CGFloat height;
    CGFloat width;
}character;

//typedef struct character info;

@interface Person : NSObject

@property NSString *name;
@property NSInteger age;
@property character info;

- (instancetype)initWithName:(NSString *)name;
- (void)setHeight:(CGFloat)height width:(CGFloat)width;
- (void)setInfo:(character)data;
- (character)personInfo;
@end
