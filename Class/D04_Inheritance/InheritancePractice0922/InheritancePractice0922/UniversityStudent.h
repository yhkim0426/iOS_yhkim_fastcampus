//
//  UniversityStudent.h
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Student.h"

@interface UniversityStudent : Student

@property NSString *major;

- (id)study;
- (id)study:(NSString *)subject;
- (id)goMTTo:(NSString *)somewhere with:(Student *)someone;
- (id)adopt:(Animal *)animal;

@end
