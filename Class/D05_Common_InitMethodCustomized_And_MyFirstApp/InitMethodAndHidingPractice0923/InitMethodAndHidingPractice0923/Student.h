//
//  Student.h
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property NSString *school;
@property NSInteger grade;
@property NSString *credit;

// 이름, 도시, 학교, 학년 정보를 받아서 init
- (instancetype)initWithName:(NSString *)name city:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade;
- (instancetype)initWithName:(NSString *)name city:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade isHandsome:(BOOL)isHandsome;

@end
