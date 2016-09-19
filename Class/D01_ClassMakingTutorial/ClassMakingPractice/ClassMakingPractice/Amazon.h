//
//  Amazon.h
//  ClassMakingPractice
//
//  Created by Nexus_MYT on 2016. 9. 19..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

// (디아블로2) 아마존 클래스
@interface Amazon : Person

@property id name;
@property id hp;
@property id mp;
@property id level;

// 캐시 아이템 적용 여부
@property Boolean cashEnabled;

// 헬카우 잡는 메소드
- (id)killHellcow;

// 마법 사용 메소드
- (id)spellMultiShot;
- (id)spellValkyrie;
- (id)spellMagicArrow;
- (id)spellZap;

// PK(Player Kill) 모드 전환 메소드
- (id)doPK;

@end
