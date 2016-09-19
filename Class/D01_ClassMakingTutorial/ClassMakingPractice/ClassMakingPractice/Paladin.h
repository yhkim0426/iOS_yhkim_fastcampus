//
//  Paladin.h
//  ClassMakingPractice
//
//  Created by Nexus_MYT on 2016. 9. 19..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Person.h"

// (디아블로2) 팔라딘 클래스
@interface Paladin : Person

// 설정된 캐릭터 이름
@property id name;

// 캐릭터의 Health Point
@property id hp;

// 캐릭터의 Mind Point
@property id mp;

// 캐릭터의 레벨
@property id level;

// 캐시 아이템 적용 여부
@property Boolean cashEnabled;

// 헬카우 잡는 메소드
- (id)killHellcow;

// 마법 사용 메소드
- (id)spellHammering;
- (id)spellMite;
- (id)spellCharge;
- (id)spellAura;

// PK(Player Kill) 모드 전환 메소드
- (id)doPK;

@end
