//
//  main.m
//  DataStructureAndPointer0927
//
//  Created by Nexus_MYT on 2016. 9. 27..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /* 
         1. 값 복사와 레퍼런스 복사의 차이
         Person *p1 = [[Person alloc] init];
         p1.name = @"joo";
         Person *p2 = p1;
         NSLog(@"%@", p2.name); -> "joo"
         p2.name = @"change";
         NSLog(@"%@", p1.name); -> "change"
         */
        
        // 2. objective C의 메모리 관리법 : 레퍼런스 카운터를 이용
        // + Ownership 개념 -> 만든 사람(소유권 가진 사람)이 참조하면 레퍼런스 카운터 1 증가
        // 참조권 가진 사람이 참조하면 레퍼런스 카운터에는 변화 없음. 다만 값 수정은 가능
        
        // 프로퍼티 옵션 -> Strong : 소유권을 가질 수 있는 변수(디폴트) | Weak : 참조권만 가질 수 있는 변수
        // 메모리 관리를 위해서 씀 | 앱은 보통 메모리 100메가 넘어가면 뻗음
        
        // 3. 구조체(값 타입) vs 클래스(참조 타입)
        
        
        
    }
    return 0;
}
