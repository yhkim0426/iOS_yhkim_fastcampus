//
//  mergeSort.m
//  (1007)SortingAlgorithm
//
//  Created by Nexus_MYT on 2016. 10. 7..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "mergeSort.h"

@implementation mergeSort

// 나누기

- (NSArray *)mergeSortDivide:(NSArray *)list {
    if (list.count < 2) {
        return list;
    }
    // 중앙지정
    NSInteger centerIndex = list.count/2;
    
    // left
    NSRange leftRange = NSMakeRange(0, centerIndex);
    NSArray *leftList = [list subarrayWithRange:leftRange];
    // right
    NSRange rightRange = NSMakeRange(centerIndex, list.count-centerIndex);
    NSArray *rightList = [list subarrayWithRange:rightRange];
    
    return [self mergeLeftList:[self mergeSortDivide:leftList] rightList:[self mergeSortDivide:rightList]];
}

// 합치기
- (NSArray *)mergeLeftList:(NSArray *)leftList rightList:(NSArray *)rightList {
    NSMutableArray *leftUnSorted = [NSMutableArray arrayWithArray:leftList];
    NSMutableArray *rightUnSorted = [NSMutableArray arrayWithArray:rightList];
    
    NSMutableArray *mergedList = [NSMutableArray arrayWithCapacity:leftList.count + rightList.count];
    
    // 왼쪽에 있는 첫 번째 값과, 오른쪽에 있는 첫 번째 값을 비교해서 작은 값을 첫 번째에 넣는다.
    while (leftUnSorted.count != 0 || rightUnSorted.count != 0) {
        if (leftUnSorted.count == 0) {
            // 오른쪽 리스트에만 값이 있다.
            [mergedList addObject:rightUnSorted[0]];
            [rightUnSorted removeObjectAtIndex:0];
        } else if (rightUnSorted.count == 0) {
            // 왼쪽 리스트에만 값이 있다.
            [mergedList addObject:leftUnSorted[0]];
            [leftUnSorted removeObjectAtIndex:0];
        } else {
            // 아직 두 리스트에 값이 있다.
            NSInteger leftValue = [leftUnSorted[0] integerValue];
            NSInteger rightValue = [rightUnSorted[0] integerValue];
            
            if (leftValue < rightValue) {
                // 왼쪽 리스트의 값이 작은 경우
                [mergedList addObject:leftUnSorted[0]];
                [leftUnSorted removeObjectAtIndex:0];
            } else if (leftValue > rightValue) {
                // 오른쪽 리스트의 값이 작은 경우
                [mergedList addObject:rightUnSorted[0]];
                [rightUnSorted removeObjectAtIndex:0];
            } else {
                // 두 값이 같은 경우
                [mergedList addObject:leftUnSorted[0]];
                [leftUnSorted removeObjectAtIndex:0];
                [mergedList addObject:rightUnSorted[0]];
                [rightUnSorted removeObjectAtIndex:0];
            }
        }
    }
    
    return mergedList;
}


@end
