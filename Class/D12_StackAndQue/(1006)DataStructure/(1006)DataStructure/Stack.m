//
//  Stack.m
//  (1006)DataStructure
//
//  Created by Nexus_MYT on 2016. 10. 6..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header = [[Node alloc] init];
        self.header.next = nil;
        self.header.previous = nil;
        self.totalDataNumber = 0;
    }
    return self;
}

//- (void)addFirstIndexValue:(NSString *)value {
- (void)push:(NSString *)value {
    Node *newNode = [[Node alloc] init];
    newNode.value = value;
    // 헤더가 제일 처음에 있다면 기존의 첫번째 노드 앞에 새로운 노드를 추가한다.
    if (![self isEmpty]) {
        newNode.next = self.header.next;
        // 헤더 다음 노드로 새로 만든 노드를 가리킨다
        self.header.next = newNode;
    } else {
        self.header.next = newNode;
        newNode.next = nil;
    }
    self.totalDataNumber++;
}

//- (void)removeFirstIndexValue {
- (NSString *)pop {
    if (![self isEmpty] && self.totalDataNumber > 0) {
        // 원래 첫 번째 있었던 노드를 따로 저장
        Node *oldNode = self.header.next;
        self.header.next = self.header.next.next;
        
        // 따로 저장했던 첫 번째 노드를 날려버림
        oldNode.next = nil;
        self.totalDataNumber--;
        
        //
        return oldNode.value;
    }
    return nil;
}

// 현재 스택이 비어있는지를 확인하는 메서드
- (BOOL)isEmpty {
    if (self.totalDataNumber > 0)
        return NO;
    else
        return YES;
}

// 스택 꼭대기의 데이터를 출력하는 메서드
- (NSString *)printTop {
    return [self printDataAtIndex:1];
}

// 특정한 인덱스의 데이터를 참조하는 메서드
- (NSString *)printDataAtIndex:(NSInteger)number {
    self.searchingHeader = self.header;
    while (number-- >0) {
        self.searchingHeader = self.searchingHeader.next;
    }
    return self.searchingHeader.value;
}

// 스택의 데이터 전체 출력
- (void)printAll {
    self.searchingHeader = self.header;
    NSInteger totalDataNumberTmp = self.totalDataNumber;
    while (totalDataNumberTmp-- >0) {
        self.searchingHeader = self.searchingHeader.next;
        NSLog(@"All: %@",self.searchingHeader.value);
    }
}

// ==================== 스택 =============================


// 들어온 공식을 한 글자씩(%@) 잘라서 errorFlag 가 NO 인 동안 && 들어온 수식 길이만큼 반복문 돌림.
- (void)checkingFormula:(NSString *)formula {
    NSInteger searchingIndex = 0;
    NSString *searchingCharacter;

    // 에러 플래그, 초기 값은 NO
    self.errorFlag = NO;
    while(searchingIndex++ < formula.length && (self.errorFlag != YES)) {
        
        // 들어온 수식을 한 글자씩 잘라서 하단의 검사 시행
        searchingCharacter = [NSString stringWithFormat:@"%c",[formula characterAtIndex:searchingIndex-1]];

        // 괄호 포함여부를 확인해서 스택에 하나씩 Push
        [self isThisContainsParanthesis:searchingCharacter];
        // 닫는 괄호를 체크해서 조건에 맞으면 Pop
        [self formulaChecker:searchingCharacter];
    }
    // 에러가 없을 때 no error 출력
    if (!self.errorFlag)
        NSLog(@"no error");
}

// 괄호를 포함하고 있으면 스택에 push 후 YES 리턴, 없으면 NO 리턴
- (BOOL)isThisContainsParanthesis:(NSString *)singleCharacter {
    if ([singleCharacter isEqualToString:@"{"] || [singleCharacter isEqualToString:@"["] || [singleCharacter isEqualToString:@"("]) {
        [self push:singleCharacter];
        return YES;
    }
    return NO;
}

// 스택의 top이 괄호이고, 들어온 글자가 반대되는 괄호일 때, pop 실행
- (void)formulaChecker:(NSString *)singleCharacter {
    // 닫는 괄호가 들어왔을 때, 아래의 조건을 만족하면 스택 pop
    if (([[self printTop] isEqualToString:@"("] && [singleCharacter isEqualToString:@")"]) || ([[self printTop] isEqualToString:@"["] && [singleCharacter isEqualToString:@"]"]) || ([[self printTop] isEqualToString:@"{"] && [singleCharacter isEqualToString:@"}"])) {
        [self pop];
    } else if ([singleCharacter isEqualToString:@")"] || [singleCharacter isEqualToString:@"]"] || [singleCharacter isEqualToString:@"}"]) {
        // 닫는 괄호가 들어왔을 때, 위의 조건을 만족하지 못하면 에러 플래그 날림
        NSLog(@"error %@", singleCharacter);
        self.errorFlag = YES;
    }
    
    // 괄호가 아닌 경우 아무것도 출력하지 않음
}

@end
