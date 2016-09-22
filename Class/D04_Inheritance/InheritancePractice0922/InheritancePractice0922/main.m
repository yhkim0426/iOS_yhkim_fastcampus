//
//  main.m
//  InheritancePractice0922
//
//  Created by Nexus_MYT on 2016. 9. 22..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"
#import "Teacher.h"
#import "Student.h"
#import "Cat.h"
#import "Dog.h"
#import "PersianCat.h"

int main(int argc, const char * argv[]) {
    
    // 1. 상속 예제
    // 마법사가 전사를 포함한 다른 모든 캐릭터를 때리게 하려면?
    // = (id) -> (GameCharacter *)
    // 상위 개념인 GameCharacter 이기만 하면 때릴(메소드 적용할) 수 있다
    Warrior *jason = [[Warrior alloc] init];
    jason.name = @"jason";
    
    Wizard *rose = [[Wizard alloc] init];
    rose.name = @"rose";
    
    [rose physicalAttackTo:jason];
    [jason physicalAttackTo:rose];
    
    [rose windstormTo:jason];
    [jason smashTo:rose];

    [rose teleportTo:@"부산"];
    [jason jumpTo:@"서울"];
    

    // 2. 상속 받은 클래스로 프로퍼티와 메소드 컨트롤
    Teacher *computerTeacher = [[Teacher alloc] init];
    computerTeacher.name = @"Yagom";
    computerTeacher.subject = @"Computer";
    
    Student *justStudent = [[Student alloc] init];
    justStudent.name = @"Younghwan";
    
    [computerTeacher teach:justStudent at:@"classromm"];
    
    // 3. 다형성 예제
    // 메소드에서 (Student *) 인데 UniversityStudent 도 가르칠 수 있는 이유?
    // Student 의 클래스가 UniversityStudent 보다 크기 때문에 가능하다.
    UniversityStudent *uniStudent = [[UniversityStudent alloc] init];
    uniStudent.name = @"Kwanghee";
    [computerTeacher teach:uniStudent at:@"classroom"];

    // 대학생은 학생인척 할 수 있지만, 학생은 대학생인 척 할 수 없다. (상위 클래스라서)
    // Student *fakeStudent = [[UniversityStudent alloc] init];
    // 또한 아래의 메소드 역시 사용할 수 없다.
    // [fakeStudent goMTTo:@"부산" with:uniStudent];

    Person *yagom = [[Person alloc] init];
    Cat *kitty = [[Cat alloc] init];
    Dog *doggy = [[Dog alloc] init];
    yagom.name = @"yagom";
    kitty.name = @"야옹이";
    doggy.name = @"누렁이";
 
    [yagom adopt:kitty];
    [yagom adopt:doggy];
    
    // 만약 학생과 대학생은 입양을 못하게 하고 싶다면? -> 오버라이딩을 쓰면 된다
    // 4. 오버라이드(재정의) 예제
    [justStudent adopt:doggy];
    [uniStudent adopt:kitty];
    
    // Animal 클래스의 theirOwnVoice 프로퍼티를 상속받아서
    // Cat 클래스 내부 init 메소드를 Overriding 해서
    // 고양이 울음소리를 @"미야옹" 으로 초기화 함
    Cat *cat = [[Cat alloc] init];
    [cat cryWith];
    
//    [PersianCat new];
//    PersianCat *persianCat = [[PersianCat alloc] init];
    
    // 재정의 연습 : 재정의를 이용해서 Person는 집밥, Student는 급식,
    // UniversityStudent는 학식을 먹도록 수정
    
    [yagom eat];
    [justStudent eat];
    [uniStudent eat];
    
    // 5. self 와 super 에 대해서
    // self 는 자기자신, super 는 (상속받은) 바로 상위의 클래스
    
    // 6. 은닉화와 캡슐화에 대해서
    // 헤더에서는 모든 정보를 구현할 필요 없음 -> 단순히 어떤 일을 할 수 있다만을 정의
    // 일종의 설명서가 됨, 자동차 설명서에도 내부 구조에 대한 이야기가 다 나오지는 않음
    // 함부러 내부 구조를 바꾸지 못하도록 함(은닉화)
    // 어제 전사-마법사 대전시에도 전사가 마법사의 체력을 마구 변환시킬 수 있었음
    // 이걸 특정한 메소드를 통해서만 수정할 수 있도록 하면 훨씬 안전할 것임
    // 카테고리 기능 활용! 아래는 예제 코드

// =====================================================================
//    #import "GameCharacter.h"
//
//    @interface GameCharacter ()
//    
//    // 캐릭터의 속성을 프로퍼티를 나타냄 (은닉화)
//    @property NSInteger health;
//    @property NSInteger mana;
//    @property NSInteger physicalPower;
//    @property NSInteger magicalPower;
//    @property BOOL isDead;
//    @property NSString *name;
//    @property NSString *weapon;
//    
//    @end
//    
//    @implementation GameCharacter
//    
//    - (id)physicalAttackTo:(GameCharacter *)someone {
//        NSLog(@"%@ 가 %@ 에게 물리공격을 가합니다.", self.name ,someone.name);
//        
//        // 정보 노출을 최소화 하면서 상대의 체력을 깎는 방법 (은닉화)
//        [someone damagedAs:self.physicalPower];
//        return nil;
//    }
//    
//    /// 외부에서 들어오는 데미지 정보에 대해 내가 나의 체력을 깎음 (은닉화)
//    - (id)damagedAs:(NSInteger)damage {
//        self.health = self.health - damage;
//        return nil;
//    }
//    
//    @end
// =====================================================================
    
    return 0;
}
