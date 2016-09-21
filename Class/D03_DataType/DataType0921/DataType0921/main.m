//
//  main.m
//  DataType0921
//
//  Created by Nexus_MYT on 2016. 9. 21..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

// obejctive c 에 맞는 자료형을 쓰는 게 좋음 (c의 자료형도 의도적으로는 사용할 수 있으나 지양함)
// BOOL : YES, NO 가 출력
// NSInteger : int 대신 쓰는 정수 자료형
// NSUInteger : unsigned int 대신 쓰는 정수 자료형
// CGFloat : float 대신 사용

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"
#import "Dog.h"
#import "Cat.h"
#import "AnimalGatherings.h"

int main(int argc, const char * argv[]) {
    
    Warrior *jack = [[Warrior alloc] init];
    jack.name = @"jack"; // jack.name = [[NSString alloc] initWithUTF8String:"jack"];
    jack.health = 300;
    jack.mana = 100;
    jack.physicalPower = 50;
    jack.protection = 30;
    jack.magicalPower = 30;
    jack.isPoisoned = NO;
    jack.isDead = NO;
    
    Wizard *rose = [[Wizard alloc] init];
    rose.name = @"rose";
    rose.health = 150;
    rose.mana = 150;
    rose.physicalPower = 30;
    rose.protection = 10;
    rose.magicalPower = 50;
    jack.isPoisoned = NO;
    rose.isDead = NO;

//    while (jack.characterStatus == NO || rose.characterStatus == NO) {
//    [jack physicalAttackTo:rose];
//    [rose poisonAttack:jack];
//    [jack physicalAttackTo:rose];
//    [rose magicalAttackTo:jack];
//    [jack physicalAttackTo:rose];
//    [rose magicalAttackTo:jack];
//    }
    
    
    // 상속 테스트1 : cry 는 Animal.h 에서 생성하고, 그 안에 들어가는 문구는 각각의 클래스 에서 받아옴
    Dog *dog = [[Dog alloc] init];
    [dog cry];
    Cat *cat = [[Cat alloc] init];
    [cat cry];
    
    // 상속 테스트2 : AnimalGatherings.h 에서 Dog2, Cat2 클래스가 Animal.h 의 cry 메소드를 상속받아 각각 울음소리 임력
    Dog2 *dog2 = [[Dog2 alloc] init];
    [dog2 cry];
    Cat2 *cat2 = [[Cat2 alloc] init];
    [cat2 cry];
    
    
    // II. 형식 지정자 (format specifier) -------------------------------------------------------
    // 정수 타입 - 부호가 있는 32bit 정수타입 -> 10진수 (%d)
    // 정수 타입 - 부호가 있는 64bit 정수타입 -> 10진수 (%ld)
    // NSLog(@"physical power : %d", jack.physicalPower); warning 뜬다
    NSLog(@"physical power : %ld", jack.physicalPower);
    
    // 정수 타입 - 부호가 없는 32bit 정수타입 -> 10진수 (%u)
    // 정수 타입 - 부호가 없는 64bit 정수타입 -> 10진수 (%lu)
    NSLog(@"health : %lu", jack.health);
    
    // 실수 타입 - 32bit 실수 타입 (%f)
    // 실수 타입 - 64bit 실수 타입 (%lf)
    CGFloat someFloatValue = 101.5;
    NSLog(@"float value : %lf", someFloatValue);
    
    // 불리언 (32bit)
    NSLog(@"Boolean value : %d", YES); // =1
    NSLog(@"Boolean value : %d", NO); // =0
    
    // %를 표현하고 싶어요 (%%)
    NSLog(@"공격력이 50%% 증가하였습니다.");
    // 객체의 주소값을 보고 싶어요
    NSLog(@"jack object : %@, memory address : %@", jack, jack);
    // 정수타입 (16진수)
    NSLog(@"physical power(16진수) : %lx", jack.physicalPower);
    // 정수타입 (8진수)
    NSLog(@"physical power(8진수) : %lo", jack.physicalPower);
    // 캐릭터 타입
    NSLog(@"character : %c", 'a');
    // 줄바꿈 \n
    NSLog(@"줄을 바꿔\n봅시다");
    // 탭을 표현하고 싶어요 \t
    NSLog(@"사이에 탭\t을 넣어 봅시다");
    // 응용
    NSLog(@"jack 의 체력은 %lu 마력은 %lu이고, 물리공격력은 %ld, 마법공격력은 %ld입니다.",
          jack.health, jack.mana, jack.physicalPower, jack.magicalPower);
    NSLog(@"%@ 의 체력: %lu, 마력: %lu 물리공격력: %ld, 마법공격력: %ld 입니다",
          rose.name, rose.health, rose.mana, rose.physicalPower, rose.magicalPower);

    // 오늘 스터디 주제 :
    // %-5ld
    // %-04ld
    // %+3;d
    // %5.2f
    // %-10.3f
    // %10.0f
    // %.3f
    
    NSInteger number = 0;
    
    NSLog(@"| %-5ld | %ld | %04ld |", number, number, number);
    
    
    
    
    // I. 변수타입 ----------------------------------------------------------
    
    // 1. 불리언 타입
    BOOL isYagomHandsome = YES;
    BOOL compareResult = NO;
    // 사용자 설정도 BOOL로 표현 가능
    // 진동 YES, 플래시 NO, ...
    // BOOL 의 code naming convention을 잘 살펴볼 것
    
    // 2. 정수타입
    // 부호가 있는 정수타입
    NSInteger signedInteger = -100;
    NSInteger twoHundred = 200;
    
    // 3. (부호가 없는) 정수타입
    NSUInteger unsignedInteger = -100;
    NSUInteger threeHundred = 300;
    
    // 비교 연산자 -> 결과값은 YES or NO
    // 괄호는 필수 아님
    // 데이터 타입이 다르면 원래 비교는 안되지만, 요즘 Xcode는 타입을 변환해서 해줌
    // 원칙적으로는 하지 않아야 하는 행위
    compareResult = (twoHundred < threeHundred);
    
    // 4. 객체형 숫자 타입
    // @가 붙으면 객체 타입이 됨
    // @100 은 그냥 숫자가 아니라 객체형 숫자가 됨 (NSNumber literal 이라 한다)
    // 값 타입 (@ 안붙는 애들, 그냥 값을 지니고 있는 경우) 과
    // 레퍼런스 타입 (@ 붙는 애들, 주소값을 가지고 있는 경우) 의 차이
    NSNumber *someNumberObject = [[NSNumber alloc] initWithInt:100]; // NSNumber *someNumberObject = @100;
    
    // Value Type (두 변수가 서로 독립적)
    NSInteger anotherNumber = twoHundred;
    anotherNumber = 1000;
    // Reference Type (두 변수가 서로 연관됨)
    NSNumber *anotherNumberVariable = someNumberObject;
    
    // 5. 실수형 숫자 타입
    CGFloat height = 200.3;
    CGFloat weight = 100.5;
    
    // 처음에 자료형 id 를 쓴 이유 : 아무 객체나 받을 수 있기 때문
    // id  모든 객체 타입을 의미
    id anyObject = @100;
    // id anyObject = 100; 은 그냥 값이기 때문에 오류 발생
    anyObject = [[NSObject alloc] init];
    
    // 6. 문자 표현
    // char 한 글자 표현 (값 타입)
    // NSString 문자열 표현 (레퍼런스 타입)
    
    return 0;
}
