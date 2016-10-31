//
//  mergeSort.h
//  (1007)SortingAlgorithm
//
//  Created by Nexus_MYT on 2016. 10. 7..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mergeSort : NSObject

- (NSArray *)mergeSortDivide:(NSArray *)list;
- (NSArray *)mergeLeftList:(NSArray *)leftList rightList:(NSArray *)rightList;

@end
