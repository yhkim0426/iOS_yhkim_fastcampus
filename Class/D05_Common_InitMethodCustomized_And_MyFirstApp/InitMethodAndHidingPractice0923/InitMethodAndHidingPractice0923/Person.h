//
//  Person.h
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSInteger age;
@property NSString *mobileNumber;
@property NSString *city;
@property BOOL isHandsome;

// 이름, 잘생겼는지를 초기화할때 받을 것임
// 초기화 메소드를 결정할때는 instancetype 을 쓴다
- (instancetype)initWithName:(NSString *)name isHandsome:(BOOL)isHandsome;
- (instancetype)initWithName:(NSString *)name city:(NSString *)city;


@end
