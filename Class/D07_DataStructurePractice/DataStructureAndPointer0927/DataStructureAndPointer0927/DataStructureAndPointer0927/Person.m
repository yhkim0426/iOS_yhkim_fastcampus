//
//  Person.m
//  DataStructureAndPointer0927
//
//  Created by Nexus_MYT on 2016. 9. 27..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void)setHeight:(CGFloat)height width:(CGFloat)width
{
    // 구조체와 메소드를 헷갈린 결과
    // self.info.height = height;
    // self.info.width = width;
    
    // 변수 호출
//    _info.height = height;
//    _info.width = width;
    
    // 다른 버전; 구조체 초기화
    character tempInfo = {height,width};
    // setter 호출
    self.info = tempInfo;
}

- (void)setInfo:(character)data
{
    
}

- (character)personInfo
{
    return self.info;
}

@end
