//
//  SelectionSort.h
//  (1007)SortingAlgorithm
//
//  Created by Nexus_MYT on 2016. 10. 7..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectionSort : NSObject

@property NSArray *sortedArray;
@property NSInteger totalCompareCount;
@property NSInteger totalSwitchCount;

- (NSArray *)selectionSort:(NSArray *)list;

@end
