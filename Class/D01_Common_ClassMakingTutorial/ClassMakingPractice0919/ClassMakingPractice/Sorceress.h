//
//  Sorceress.h
//  ClassMakingPractice
//
//  Created by Nexus_MYT on 2016. 9. 19..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

// (디아블로2) 소서리스 클래스
@interface Sorceress : Person

@property id name;
@property id hp;
@property id mp;
@property id level;

// 죽인 몬스터 수
@property id numberOfKilled;

// 캐시템 적용 여부
@property Boolean cashEnabled;

// 헬카우 잡는 메소드
- (id)killHellcow;

// 마법 스킬 사용
- (id)spellChainLightning;
- (id)spellTeleport;
- (id)spellBlizzard;
- (id)spellFrozenOrb;
- (id)spellFireWall;

// PK(Player Kill) 모드 전환
- (id)doPK;

@end
