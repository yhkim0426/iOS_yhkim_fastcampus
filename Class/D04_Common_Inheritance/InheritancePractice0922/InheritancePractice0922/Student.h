//
//  Student.h
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property NSInteger grade;

- (id)study:(NSString *)subject;
- (id)adopt:(Animal *)animal;

@end
