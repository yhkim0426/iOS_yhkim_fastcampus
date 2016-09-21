//
//  Wizard.h
//  DataType0921
//
//  Created by Nexus_MYT on 2016. 9. 21..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Warrior;

@interface Wizard : NSObject

@property NSString *name;
@property NSUInteger health;
@property NSUInteger mana;
@property NSInteger physicalPower;
@property NSUInteger protection;
@property NSInteger magicalPower;
@property BOOL isPoisoned;
@property BOOL isDead;

- (id)physicalAttackTo:(Warrior *)target;
- (id)magicalAttackTo:(Warrior *)target;
- (id)poisonAttack:(Warrior *)target;
- (BOOL)characterStatus;

@end
