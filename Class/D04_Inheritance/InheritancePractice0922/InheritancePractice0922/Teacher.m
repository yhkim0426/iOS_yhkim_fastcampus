
//
//  Teacher.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (id)teach:(Student *)student at:(NSString *)location {
    NSLog(@"%@ teaches %@ to %@ at %@", self.name, self.subject, student.name, location);
    return nil;
}

@end
