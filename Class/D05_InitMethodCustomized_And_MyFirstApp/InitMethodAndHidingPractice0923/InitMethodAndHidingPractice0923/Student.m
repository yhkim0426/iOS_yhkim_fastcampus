//
//  Student.m
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name city:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade {
    self = [super initWithName:name city:city];
    
    self.school = school;
    self.grade = grade;
    
    return self;
}

- (instancetype)initWithName:(NSString *)name city:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade isHandsome:(BOOL)isHandsome {
    self = [self initWithName:name city:city schoolName:(NSString *)school grade:(NSInteger)grade];
    
    self.isHandsome = isHandsome;
    
    return self;
}

@end
