//
//  Person.h
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Person : NSObject

@property NSString *name;
@property NSInteger age;

- (id)eat;
- (id)eat:(NSString *)food;
- (id)adopt:(Animal *)animal;

@end
