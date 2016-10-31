//
//  MySingleton.m
//  (1031)NotificationExample
//
//  Created by Nexus_MYT on 2016. 10. 31..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

+(instancetype)sharedInstance
{
    
    static MySingleton *instance = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void)justMethod
{
    NSLog(@"method called");
    
}

@end
