//
//  Person.m
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name isHandsome:(BOOL)isHandsome {
    
    self = [super init];
    
    self.name = name;
    self.isHandsome = isHandsome;
    
    return self;
}

- (instancetype)initWithName:(NSString *)name city:(NSString *)city {
    
    self.name = name;
    self.city = city;
    
    return self;
}

//- (instancetype)initWithConnection:(Person *)targetName {
//    
//    self = [super init];
//    
//    self.target = targetName;
//    
//    return self;
//}
//
//- (id)getTargetName {
//    NSLog(@"TargetName : %@", self.target.name);
//    return nil;
//}

@end
