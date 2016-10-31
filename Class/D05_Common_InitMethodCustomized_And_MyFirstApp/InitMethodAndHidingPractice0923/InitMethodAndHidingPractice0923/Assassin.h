//
//  Assassin.h
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

@interface Assassin : Person

- (instancetype)initWithTarget:(Person *)targetName initialCodeName:(NSString *)codeName;
- (id)getTargetName;

@end
