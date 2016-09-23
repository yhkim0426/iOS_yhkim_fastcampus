//
//  Assassin.m
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Assassin.h"

@interface Assassin()

@property NSString *codeName;
@property Person *target;

@end

@implementation Assassin

- (instancetype)initWithTarget:(Person *)targetName initialCodeName:(NSString *)codeName {
    self = [super init];
    
    self.target = targetName;
    self.codeName = codeName;
    return self;
}

- (id)getTargetName {
    NSLog(@"My target name is %@, I'm codeNmae %@", _target.name, self.codeName);
    return nil;
}

@end
