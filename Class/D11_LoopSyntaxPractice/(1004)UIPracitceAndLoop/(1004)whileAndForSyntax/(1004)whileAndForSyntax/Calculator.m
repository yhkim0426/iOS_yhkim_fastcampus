//
//  Calculator.m
//  (1004)whileAndForSyntax
//
//  Created by Nexus_MYT on 2016. 10. 4..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (void)getMultiplicationTable:(NSInteger)dan {
    NSInteger result = 0;
    NSInteger i = 0;
    while(i++ < 9) {
        result = dan * i;
        NSLog(@"%ld * %ld = %ld", dan, i, result);
    }
    
//    for (NSInteger i =1; i <=9; i++) {
//        result = dan * i;
//        NSLog(@"%ld * %ld = %ld", dan, i, result);
//    }
}

- (void)factorial:(NSInteger)number {
    CGFloat result = 1;
    
    
    for (NSInteger i=1; i <= number; i++) {
        result *= i;
    }
    NSLog(@"factorial of %ld is %.lf", number, result);
    
    // 숫자를 세자리마라 ',' 찍어서 표현함
//    NSNumberFormatter *numberResult = [[NSNumberFormatter alloc] init];
//    numberResult.numberStyle = NSNumberFormatterDecimalStyle;
//    NSLog(@"%@",[numberResult stringFromNumber:[NSNumber numberWithFloat:result]]);
}

- (void)triangularNumber:(NSInteger)number {
    NSInteger result = 0;
    NSInteger internalNumber = number;
    if (internalNumber > 0)
    while (internalNumber > 0) {
        result += internalNumber;
        internalNumber--;
    }
    NSLog(@"%ld 의 삼각수는 %ld 입니다.", number, result);
}

- (void)addAllNumber:(NSInteger)number {
    NSInteger result = 0;
    NSInteger internalNumber = number;
    while (internalNumber > 0) {
        result += internalNumber % 10;
        internalNumber /= 10;
    }
    NSLog(@"%ld 의 자릿수 합은 %ld 입니다.", number, result);
}

- (void)game369:(NSInteger)number {
    NSInteger result = 0;
    for (NSInteger i=1; i <= number; i++) {
        
        NSInteger innerI = i;
        while (innerI > 0) {
            result = innerI % 10;

        if ((result == 3) || (result == 6) || (result == 9)) {
            printf("*, ");
            break;
        }
            innerI /= 10;
            
            if(innerI == 0)
                printf("%ld, ", i);
        }
        

    }
    printf("\n");
    
    // 코드 from 이봉원
//- (void)game369:(NSInteger)num{
//    for(NSInteger i = 1; i <= num; i++){
//        BOOL is369 = NO;
//        for(NSInteger j = i; j != 0 ; j /= 10){
//            if(j%10 == 3 || j%10 == 6 || j%10 == 9)
//                is369 = YES;
//        }
//        
//        if(is369) printf("*,");
//        else      printf("%ld,", i);
//    }
//}
    
}

- (void)dataFormatConverter {
    NSString *str = @"130";
    
    // string >> integer
    NSInteger num = str.integerValue;
    CGFloat fnum = str.floatValue;
    
    NSNumber *number = [NSNumber numberWithInteger:num];
    //integer >> string
    NSString *str2 = [NSString stringWithFormat:@"%ld",num];
    
    NSRange range = NSMakeRange(0, 2);
    
    // 인덱스 0에서부터 2 글자 받아와서 출력
    NSLog(@"%@", [str substringWithRange:range]);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm:ss"];
//    [formatter dateFromString:@"13:20"];
    
    // string을 날짜 포멧으로 변경
    NSDate *date = [formatter dateFromString:@"13:20"];
    NSLog(@"%@", date);
    
    NSString *dateStr = [formatter stringFromDate:date];
    NSLog(@"%@", dateStr);
}

@end
