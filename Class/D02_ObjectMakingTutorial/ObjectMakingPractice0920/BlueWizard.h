//
//  BlueWizard.h
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlueWizard : NSObject

@property id health;
@property id mana;
@property id physicalPower;
@property id magicalPower;

- (id)windstorm:(id)to;
- (id)magicalAttack:(id)to;
- (id)heal:(id)to;
- (id)blizzard:(id)to with:(id)level;
- (NSString *)pk:(id)targetName;

@end
