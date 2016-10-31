//
//  SelectionSortPractice.m
//  (1007)SortingAlgorithm
//
//  Created by Nexus_MYT on 2016. 10. 7..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "SelectionSortPractice.h"

@implementation SelectionSortPractice

- (NSArray *)selectionSort:(NSArray *)list {
    NSMutableArray *unSortedList = [[NSMutableArray alloc] initWithArray:list];
    
    for (NSInteger i = 0; i < unSortedList.count; i++) {
        NSInteger minValue = [unSortedList[i] integerValue];
        NSInteger minIndex = i;
        
        for (NSInteger j = i; j < unSortedList.count; j++) {
            NSInteger compareValue = [unSortedList[j] integerValue];
            if (minValue > compareValue) {
                minValue = compareValue;
                minIndex = j;
            }
        }
        
        if (i != minIndex) {
            [unSortedList exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
        }
    }
    
    return unSortedList;
}

@end
