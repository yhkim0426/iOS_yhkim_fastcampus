//
//  Person.h
//  ClassMakingPractice
//
//  Created by Nexus_MYT on 2016. 9. 19..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// @property 자료형 변수명;
@property id age;
@property id height;
@property id gender;
@property id bloodType;
@property id skinColor;

// - (반환타입)메소드명 : (입력타입)입력인자명;
- (id)run;
- (id)talk;
- (id)think;
- (id)eat;
- (id)sayFakeHeight: (id)height;
- (id)hear;

@end
