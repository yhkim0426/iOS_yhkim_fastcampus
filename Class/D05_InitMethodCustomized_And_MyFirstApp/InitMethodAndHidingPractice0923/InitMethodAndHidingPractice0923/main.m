//
//  main.m
//  InitMethodAndHidingPractice0923
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Assassin.h"
#import "Student.h"
#import "DiabloCharacterDefault.h"

// 객체 생성 후 값을 다 넣어주는게 너무 귀찮다
// -> 객체 초기화때 초기값 다 집어넣을 순 없을까?
// command + shift + o : 빠른 찾기(원하는 클래스로 바로 넘어갈 수 있음 like 'Spotlight'

int main(int argc, const char * argv[]) {

    // 1. init 오버라이딩 예제
    // 사람 jack 을 정의합니다
//    Person *jack = [[Person alloc] initWithName:@"jack" city:@"seoul"];
//    NSLog(@"%@'s name : %@, isHandsome : %d", jack.className, jack.name, jack.isHandsome);
//    
//    // 암살자 rose 가 타겟으로 jack 을 지목합니다
//    Assassin *rose = [[Assassin alloc] initWithTarget:jack initialCodeName:@"rose"];
//    [rose getTargetName];
//    
//    Student *jason = [[Student alloc] initWithName:@"jason" city:@"jeju" schoolName:@"KAIST" grade:3 isHandsome:NO];
//    NSLog(@"%@'s name : %@, city:%@, school name:%@ grade:%ld isHandsome:%d",
//          jason.className, jason.name, jason.city, jason.school, jason.grade, jason.isHandsome);

    // 2. 복습, 이때까지 했었던 것들을 프로젝트 하나에 녹여보라
    // 선택: 심플한 디아블로
    
    DiabloCharacterDefault *jason = [[DiabloCharacterDefault alloc] initWithCharacterSetting:@"jason" jobType:@"Barbarian"];
    DiabloCharacterDefault *rose = [[DiabloCharacterDefault alloc] initWithCharacterSetting:@"rose" jobType:@"Barbarian"];
//
//    [jason defaultSetting:@"Barbarian"];
//    [rose defaultSetting:@"Sorceress"];
//    
    [jason physicalAttackTo:rose manaUsed:0];
    [rose magicalAttackTo:jason manaUsed:10];
    [jason physicalAttackTo:rose manaUsed:0];
    [rose magicalAttackTo:jason manaUsed:10];
    [jason physicalAttackTo:rose manaUsed:0];
    [rose magicalAttackTo:jason manaUsed:10];
    
    return 0;
}
