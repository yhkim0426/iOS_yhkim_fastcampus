//
//  main.m
//  (1006)DataStructure
//
//  Created by Nexus_MYT on 2016. 10. 6..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "StackSolutionFromJoo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        // 예제 1. 괄호 체크하기
        NSString *formula = @"{A[(i+1)]=0}";
        Stack *stack = [[Stack alloc] init];
        [stack checkingFormula:formula];
        
//        // 괄호 체크하기 - 주영민 (StackSolutionFromJoo.h)
//        StackSolutionFromJoo *strCh = [[StackSolutionFromJoo alloc] init];
//        BOOL isCheck = [strCh checkBracketString:@"{fdag()fdsagw}"];
//        
//        NSLog(@"%hhd", isCheck);
    }
    return 0;
}
