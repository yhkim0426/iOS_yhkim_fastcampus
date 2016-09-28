//
//  DoubleLinkedList.h
//  (0928)LinkedListPractice
//
//  Created by Nexus_MYT on 2016. 9. 28..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface DoubleLinkedList : NSObject

@property Node *header;
@property NSInteger lastIndex;


- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value;
- (void)addLastValue:(NSInteger)value;
- (void)addFirstIndexValue:(NSInteger)value;
- (void)printAllNode;
- (void)deleteLastNode;
- (void)deleteNode:(Node *)nowNode;

// 마지막 값을 지우는 노드
- (void)removeLast;

@end
