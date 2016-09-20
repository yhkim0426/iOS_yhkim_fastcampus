//
//  Wizard.h
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Warrior : NSObject

/**
 heatlth : health point
 mana : mind point
 physicalPower : amount of physical damage
 magicalPower : amount of magical dagame
 weapon : present handled weapon name
*/
@property id health;
@property id mana;
@property id physicalPower;
@property id magicalPower;
@property id weapon;

/**
 * doAttack : reduce opponent's health point
 * @param weapon : name of weapon
 */
- (id)doAttak:(id)weapon;

/**
 * doDefend : reduce oppoenet's damage point
 */
- (id)doDefend;

/**
 * doPK : change hunting mode into player kill mode
 */
- (id)doPK;

/**
 * spellBash : multiple damage of single attack
 */
- (id)spellBash;

/**
 * spellWhirlwind : short invincible and do damage to near opponents
 */
- (id)spellWhirlwind;

@end
