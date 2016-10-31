//
//  Warrior.h
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wizard : NSObject

//heatlth : health point
//mana : mind point
//physicalPower : amount of physical damage
//magicalPower : amount of magical dagame
//weapon : present handled weapon name

@property id health;
@property id mana;
@property id physicalPower;
@property id magicalPower;
@property id weapon;

//doAttack : reduce opponent's health point
//doDefend : reduce oppoenet's damage point
//doPK : change hunting mode into player kill mode
//spellBash : multiple damage of single attack
//spellWhirlwind : short invincible and do damage to near opponents

- (id)doAttack:(id)weapon;
- (id)doDefend:(id)waepon;
- (id)doPK:(id)target;
- (id)spellFireball:(id)target;
- (id)spellTeleport:(id)target;

@end
