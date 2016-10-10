//
//  SelectionSort.m
//  (1007)SortingAlgorithm
//
//  Created by Nexus_MYT on 2016. 10. 7..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort

- (NSArray *)selectionSort:(NSArray *)list {
    self.totalCompareCount = 0;
    self.totalSwitchCount = 0;
    
    // NSMutableArray 로 다시 바꿔주는 이유는, 들어온 데이터가 NSArray, NSMutableArray 둘 다인 경우를 커버하기 위함
    NSMutableArray *unSortedList = [[NSMutableArray alloc] initWithArray:list];
    
    // 리스트의 시작부터 끝까지 확인
    for (NSInteger i = 0; i < unSortedList.count; i++) {
        // 최소값 구하기
        NSInteger minValue = [unSortedList[i] integerValue];
        NSInteger minIndex = i;
        // i 다음번째의 숫자 중 가장 작은 수 찾아내기
        for (NSInteger j = i; j < unSortedList.count; j++) {
            NSInteger compareValue = [unSortedList[j] integerValue];
            self.totalCompareCount++;
            // 비교구문 시작
            if (minValue > compareValue) {
                minValue = compareValue;
                minIndex = j;
            }
        }
        // 리스트의 데이터 교환
        // i 번째는 minIndex로, minIndex 는 i 번째로
        if (i != minIndex) {
            [unSortedList exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
            self.totalSwitchCount++;
        }
    }
    NSLog(@"총 바꿈횟수: %ld", self.totalSwitchCount);
    NSLog(@"총 비교횟수: %ld", self.totalCompareCount);
    return unSortedList;
}

@end
