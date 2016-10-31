//
//  Warrior.h
//  DataType0921
//
//  Created by Nexus_MYT on 2016. 9. 21..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Wizard;

@interface Warrior : NSObject

@property NSString *name;
@property NSUInteger health;
@property NSUInteger mana;
@property NSInteger physicalPower;
@property NSInteger protection;
@property NSInteger magicalPower;
@property BOOL isPoisoned;
@property BOOL isDead;

- (id)physicalAttackTo:(Wizard *)target;
- (id)magicalAttackTo:(Wizard *)target;
- (BOOL)characterStatus;

@end
