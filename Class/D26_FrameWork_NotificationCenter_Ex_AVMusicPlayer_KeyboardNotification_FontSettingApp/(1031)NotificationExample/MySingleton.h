//
//  MySingleton.h
//  (1031)NotificationExample
//
//  Created by Nexus_MYT on 2016. 10. 31..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

+(instancetype)sharedInstance;
-(void)justMethod;

@end
