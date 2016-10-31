//
//  Student.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)eat {
    [super eat:@"급식"];
    return nil;
}

- (id)study:(NSString *)subject {
    NSLog(@"student do study %@" ,subject);
    return nil;
}

- (id)adopt:(Animal *)animal {
    NSLog(@"학생 %@ 가 %@ 입양에 실패했습니다, 아버지의 반대 때문에...", self.name , animal.name);
    return nil;
}

@end
