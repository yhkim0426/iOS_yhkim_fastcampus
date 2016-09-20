//
//  main.m
//  ObjectMakingPractice0920
//
//  Created by Nexus_MYT on 2016. 9. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Warrior.h"
#import "Wizard.h"
#import "Archer.h"
#import "BlueWizard.h"
#import "RedWarrior.h"

// 이름을 잘 지어야 함. 나중의 유지보수를 위해서.
// 프로젝트, 클래스 이름은 대문자로 시작.
// 변수, 메소드 이름은 소문자로 시작.

// 클래스를 말로 풀어서 읽어보는 연습을 해야 함
// @interface Person : NSObject
// @property id name;
// @property id gender;
// - (id)run;
// => "Person 이라는 클래스는 name, gender 를 특성으로 가지고, run 이라는 행동(메소드)을 할 수 있습니다."

int main(int argc, const char * argv[]) {
    
    // [<클래스이름> alloc] : 객체 생성(메모리 할당), alloc 메소드 시행
    // [<클래스이름> init] : 객체 초기화, init 메소드 시행
    // [[<클래스이름> alloc] init] : 객체 생성과 동시에 초기화 => 객체의 주소값을 반환함
    // = [<클래스이름> new] : 동일하나 new 커맨드는 많이 안 쓰게 될 것임
    
    // 메모리상의 Person 객체 주소값을 me 라는 변수에 저장 = 메모리 어디에 저장되어 있는가를 담고 있는 변수
    // <데이터타입> *<변수명> = <객체의 주소>;
    
    Person *me = [[Person alloc] init];
    Warrior *jack = [[Warrior alloc] init];
    Wizard *rose = [[Wizard alloc] init];
    
    // 원시 자료형과 클래스명은 호환 안됨. 아래처럼은 빌드 불가.
    // int *pamella = [[Wizard alloc] init];
    // double *pamella = [[Wizard alloc] init];
    
    // 값 set 하는 방법
    // 포인터명.프로퍼티명 = @데이터 or @"문자열"
    // 프로퍼티 출력 ----------------------------------------------------
    me.name = @"YoungHwan";
    me.gender = @"male";
    me.height = @180;
    
    jack.health = @300;
    jack.mana = @10;
    jack.physicalPower = @30;
    jack.magicalPower = @10;
    jack.weapon = @"AXE";
    
    rose.health = @100;
    rose.mana = @150;
    rose.physicalPower = @10;
    rose.magicalPower = @30;
    
    NSLog(@"My name is %@.", me.name);
    NSLog(@"My name is %@, Gender: %@", me.name, me.gender);
    
    Person *you = [[Person alloc] init];
    you.name = @"태환";
    you.gender = me.gender;
    
    NSLog(@"My name is %@, Gender: %@ same as %@ %@", you.name, you.gender, me.name, you.height);
    
    NSLog(@"Jack health: %@, mana: %@", jack.health, jack.mana);
    NSLog(@"rose health: %@, mana: %@", rose.health, rose.mana);
    
    // 메서드 출력 ------------------------------------------------------
    [me run];
    
    // Q. 아래의 이중메소드는 왜 실행되지 않을까? (메소드의 반환값은 무엇인가? nil)
    // [[me talk] sleep];
    // sleep 메소드의 반환값을 (id) nil 에서 (Person *) self 를 반환해서 해결함
    [[me sleep] talk];
    
    // 단일 매개변수(parameter)를 받을 수 있는 메서드
    [jack doAttak:jack.weapon];
    [jack spellBash];
    
    [rose doAttack:@"staff"];
    [rose doPK:me.name];
    [rose spellTeleport:you.name];
    
    // 다중 매개변수를 받을 수 있는 메서드
    Archer *ellena = [[Archer alloc] init];
    [ellena runTo:@"Busan" bySpeed:@100 with:me.name];
    NSLog(@"\n");
    
    // 커스텀 메소드 예제
    BlueWizard *yhkim = [[BlueWizard alloc] init];
    yhkim.magicalPower = @30;
    [yhkim windstorm:me.name];
    [yhkim magicalAttack:you.name];
    NSLog(@"\n");
    [yhkim magicalAttack:[yhkim pk:you.name]];
    NSLog(@"\n");
    [yhkim heal:me.name];
    [yhkim blizzard:you.name with:@99];
    
    RedWarrior *vanessa = [[RedWarrior alloc] init];
    vanessa.name = @"Vanessa";
    [vanessa doAttack:me.name with:@100];
    
    NSLog(@"%@", [RedWarrior new]);
    NSLog(@"%@", [[RedWarrior alloc] init]);
    
    return 0;
}
