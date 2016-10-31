//
//  Node.h
//  (0928)LinkedListPractice
//
//  Created by Nexus_MYT on 2016. 9. 28..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property NSInteger value;
@property NSInteger index;

@property Node *next;
@property Node *previous;

@end
