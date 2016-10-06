//
//  StackSolutionFromJoo.m
//  (1006)DataStructure
//
//  Created by Nexus_MYT on 2016. 10. 6..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "StackSolutionFromJoo.h"

@implementation StackSolutionFromJoo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stack = [[Stack alloc] init];
    }
    return self;
}

- (BOOL)checkBracketString:(NSString *)str {
    // 스트링 분해 하기
    NSMutableArray *chList = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < str.length; i++) {
        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
        [chList addObject:ch];
    }
    
    for (NSString *ch in chList) {
        // 문자 타입 검사
        NSInteger checkBraketType = [self checkBracket:ch];
        
        switch (checkBraketType) {
            case 1: { // 열리는 괄호일 때
                [self.stack push:ch];
                break;
            }
            case 2: { // 닫히는 괄호일 때
                NSString *popStr = [self.stack pop];
                // 한쌍인지 검사
                if (![self checkPairOpenBracket:popStr closeBracket:ch]) {
                    return NO;
                }
                break;
            }
            default:
                break;
        }
    }
    
    if ([self.stack isEmpty]) {
        return YES;
    } else {
        return NO;
    }
}

// 1 == 여는괄호, 2 == 닫는 활호, 3 == 문자
- (BOOL)checkBracket:(NSString *)bracket {
    if ([bracket isEqualToString:@"("] || [bracket isEqualToString:@"["] || [bracket isEqualToString:@"{"]) {
        return 1;
    } else if ([bracket isEqualToString:@")"] || [bracket isEqualToString:@"]"] || [bracket isEqualToString:@"}"]) {
        return 2;
    } else {
        return 3;
    }
}

- (BOOL)checkPairOpenBracket:(NSString *)openBracket closeBracket:(NSString *)closeBracket {
    NSString *preCloseBracket;
    if ([openBracket isEqualToString:@"("]) {
        preCloseBracket = @")";
    } else if ([openBracket isEqualToString:@"{"]) {
        preCloseBracket = @"}";
    } else if ([openBracket isEqualToString:@"["]) {
        preCloseBracket = @"]";
    }
    
    if ([preCloseBracket isEqualToString:closeBracket]) {
        return YES;
    } else {
        return NO;
    }
}

@end
