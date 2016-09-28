//
//  main.m
//  (0928)LinkedListPractice
//
//  Created by Nexus_MYT on 2016. 9. 28..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoubleLinkedList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

    // 1. (Double) LinkedList 만들어보기 실습
        DoubleLinkedList *dll = [[DoubleLinkedList alloc] init];
        [dll addLastValue:10];
        [dll addLastValue:50];
        [dll addLastValue:43];
        [dll printAllNode];
//        [dll deleteLastNode];
        [dll removeLast];
        [dll printAllNode];
        
    // 2. Dictionary 앨범 데이터 구조 만들기
//        NSDictionary *musicList = @{
//                                    @"album_info":{
//                                        @"title" : @"Page Two"(NSString),
//                                        @"rating" : @8.0(NSInteger),
//                                        @"artist" : @"TWICE"([NSString]),
//                                        @"genre" : @"댄스"([NSString]),
//                                        @"released" : @"2016.04.25"(NSString),
//                                        @"publisher" : @"KT 뮤직"(NSString)
//                                    },
//                                    @"song_list":[
//                                        @"CHEERUP",
//                                        @"소중한 사랑",
//                                        @"..."]
//                                    };
    }
    return 0;
}
