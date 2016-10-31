//
//  Stack.h
//  (1006)DataStructure
//
//  Created by Nexus_MYT on 2016. 10. 6..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Stack : NSObject

@property Node *header;
@property NSInteger totalDataNumber;
@property Node *searchingHeader;
@property BOOL errorFlag;

- (void)push:(NSString *)value;
- (NSString *)pop;
- (BOOL)isEmpty;
- (NSString *)printTop;

- (NSString *)printDataAtIndex:(NSInteger)number;
- (void)printAll;
- (void)checkingFormula:(NSString *)formula;

- (BOOL)isThisContainsParanthesis:(NSString *)singleCharacter;
- (void)formulaChecker:(NSString *)singleCharacter;

@end
