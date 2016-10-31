//
//  Teacher.h
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "UniversityStudent.h"

@interface Teacher : UniversityStudent

@property NSInteger workYears;
@property NSString *subject;

- (id)teach:(Student *)student at:(NSString *)location;

@end
