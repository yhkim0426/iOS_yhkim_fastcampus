//
//  DoubleLinkedList.m
//  (0928)LinkedListPractice
//
//  Created by Nexus_MYT on 2016. 9. 28..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "DoubleLinkedList.h"

@implementation DoubleLinkedList

// 초기화
// 1. 헤더가 가리키는 값을 nil로 초기화 한다
// (좀 더 구체적으로 => 헤더 클래스를 선언하고 그 안의 앞, 뒤 포인터를 초기화 한다)
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header = [[Node alloc] init];
        self.header.next = nil;
        self.header.previous = nil;
        self.lastIndex = 0;
    }
    return self;
}


// add(마지막에 데이터 추가한다)
// 1. 외부에서 데이터를 입력받아 Node를 선언하고 그 value에 저장한다
// 2. self.count 번째 있는 노드 링크값을 가져와서 nil 에서 노드 주소값을 변경한다
// 3. 노드의 링크값을 self.count 번째 노드를 향한다
- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value
{
    //nowNode의 next가 nil이냐?
    if (nowNode.next == nil) { // 참인 경우
        Node *newNode = [[Node alloc] init];
        newNode.value = value;
        newNode.previous = nowNode;
        newNode.next = nil;
        // 현재 노드의 인덱스 값을 가져온다
        newNode.index = self.lastIndex;
        
        // 현재 노드를 새로운 노드를 가리킨다
        nowNode.next = newNode;
        self.lastIndex = self.lastIndex + 1;
        NSLog(@"노드 값: %ld 이 추가되었습니다.", newNode.value);
        return;
    } else { // 거짓인 경우 | 재귀함수 호출로 반복문처럼 사용(코드를 간결하게 쓸 수 있으나, 메모리 많이 잡아먹음)
        [self addLastIndexNode:nowNode.next newValue:value];
    }
    
}

- (void)addLastValue:(NSInteger)value
{
    [self addLastIndexNode:self.header newValue:value];
}

/// 헤더 다음에 노드 추가하는 메소드
- (void)addFirstIndexValue:(NSInteger)value
{
    Node *newNode = [[Node alloc] init];
    newNode.value = value;
    
    // 헤더가 제일 처음에 있다면 기존의 첫번째 노드 앞에 새로운 노드를 추가한다
    if (self.header.next != nil) {
        newNode.previous = self.header;
        newNode.next = self.header.next;
        
        // 헤더 앞에 있던 원래노드(self.header.next)의 previous 방향 포인터는 새로운 노드를 가리킨다
        self.header.next.previous = newNode;
        // 헤더 다음 노드로 새로 만든 노드를 가리킨다
        self.header.next = newNode;
    } else {
        // [self addLastValue:value];
        self.header.next = newNode;
        newNode.previous = self.header;
        newNode.next = nil;
    }
}

/// printNode(모든 노드의 데이터를 출력한다)
- (void)printAllNode
{
    [self printNode:self.header];
}

- (void)printNode:(Node *)nowNode
{
    if (nowNode.previous != nil)
        NSLog(@"노드 데이터값: %ld", nowNode.value);
    
    if (nowNode.next != nil) {
        [self printNode:nowNode.next];
    }
    
}

//// remove(해당 데이터를 삭제한다)
//- (void)deleteLastNode
//{
//    [self deleteNode:self.header option:@"Last"];
//}
//
//- (void)deleteNode:(Node *)nowNode option:(NSString *)option
//{
//    // option 체크
//    if ([option isEqualToString:@"Last"]) {
//        if (nowNode.next != nil) {
//            [self deleteNode:nowNode.next option:option];
//        }else {
//    
//    if (nowNode.next == nil) { // 마지막 노드인 경우
//        nowNode.previous.next = nil;
//        nowNode.previous = nil;
//        NSLog(@"마지막 노드의 데이터가 삭제되었습니다 : %ld", nowNode.value);
//    } else { // 마지막 노드가 아닌 경우
//        nowNode.next.previous = nowNode.previous;
//        nowNode.previous.next = nowNode.next;
//        
//        nowNode.previous = nil;
//        nowNode.next = nil;
//        // [self deleteLastNode:nowNode.next]; 와 동일함.
//            }
//        }
//    }
//}

// 수업시간에 작성한 삭제 예제 코드
- (void)removeLast
{
    [self removeLastNode:self.header];
}

- (void)removeLastNode:(Node *)nowNode
{
    if (nowNode.next == nil) {
        Node *previousNode = nowNode.previous;
        previousNode.next = nil;
        nowNode.previous = nil;
        NSLog(@"마지막 노드가 삭제되었습니다: %ld", nowNode.value);        
//        nowNode.previous = nil;
//        nowNode.previous.next = nil;
//        NSLog(@"마지막 노드가 삭제되었습니다: %ld", nowNode.value);
    } else {
        [self removeLastNode:nowNode.next];
    }
}

// count(총 노드의 갯수를 구한다)

// printNode(모든 노드의 데이터를 출력한다)

// printIndexedNode(해당 인덱스의 데이터 출력한다)



// searchData(원하는 데이터를 찾는 로직, 중복되는 데이터 모드 찾아서 배열로 리턴)

@end
