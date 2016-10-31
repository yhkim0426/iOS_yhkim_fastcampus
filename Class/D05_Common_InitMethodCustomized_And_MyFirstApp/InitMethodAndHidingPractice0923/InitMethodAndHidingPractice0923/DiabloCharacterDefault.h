//
//  DiabloCharacterDefault.h
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiabloCharacterDefault : NSObject

- (id)defaultSetting;
- (instancetype)initWithCharacterSetting:(NSString *)name jobType:(NSString *)jobType;
- (id)physicalAttackTo:(DiabloCharacterDefault *)target manaUsed:(NSInteger)manaUsed;
- (id)magicalAttackTo:(DiabloCharacterDefault *)target manaUsed:(NSInteger)manaUsed;

@end

@interface CharacterSelector : DiabloCharacterDefault

@end

@interface Barbarian : DiabloCharacterDefault

@end

@interface Sorceress : DiabloCharacterDefault

@end
