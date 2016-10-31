//
//  main.m
//  (1020)ObjectLifeCycle
//
//  Created by Nexus_MYT on 2016. 10. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

// 메모리 관리를 위해 어플리케이션의 라이프사이클을 알고 있어야 한다.
int main(int argc, const char * argv[]) {
    @autoreleasepool {
    MyClass *instance = [[MyClass alloc] init];
    NSLog(@"%@", instance);
    instance = nil;
    
    NSLog(@"END");
    }
    return 0;
}
