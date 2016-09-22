//
//  UniversityStudent.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "UniversityStudent.h"

@implementation UniversityStudent

// Overloading test
- (id)study {
    NSLog(@"do study %@", self.major);
    return nil;
}

// Overriding(from super, student) test
- (id)study:(NSString *)subject {
    [super study:subject];
    NSLog(@"to get a %ld grade", super.grade);
    return nil;
}

- (id)eat {
    [super eat:@"학식"];
    return nil;
}

- (id)goMTTo:(NSString *)somewhere with:(Student *)someone {
    NSLog(@"go MT to %@ with %@", somewhere, someone.name);
    return nil;
}

- (id)adopt:(Animal *)animal {
    NSLog(@"대학생 %@ 가 %@ 입양에 실패했습니다, 기숙사 규정 때문에...", self.name , animal.name);
    return nil;
}

@end
