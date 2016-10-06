//
//  main.m
//  (1004)whileAndForSyntax
//
//  Created by Nexus_MYT on 2016. 10. 4..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import "DataParser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 1. 반복문 예제
        Calculator *calculator = [[Calculator alloc] init];
//        [calculator getMultiplicationTable:3];
        
//        [calculator factorial:170];
        
//        [calculator triangularNumber:10];
//        [calculator addAllNumber:123];
//        [calculator game369:300];
        
        // 데이터 포멧 변환 예제
        [calculator dataFormatConverter];
        
        
        // 2. for-in 구문으로 데이터 가져오기
        
        
//        NSDictionary *aoaAlbum = @{@"album_info":@{@"title": @"Heart Attack",@"artist" : @"AOA",},
//                                   @"song_list" : @[@{
//                                                                                                                        @"name":@"심쿵해", @"artist":@"AOA", @"total_play_time": @223,@"song_info":@{
//                                                                                                                                @"writer":@"용감한 형제들",@"composer":@"Mr.강",@"lyrics":@"완전 반해 반해 버렸어요\n부드러운 목소리에\n반해 반해 버렸어요\n난 떨려\n(AOA Let's Go!)"}},@{@"name":@"Luv Me", @"artist":@"AOA", @"total_play_time": @252,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"JS",@"lyrics":@"Do it this do it this girl\nDo it this do it this hey\nDo it this do it this girl\n "}},@{@"name":@"한개", @"artist":@"AOA", @"total_play_time": @238,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"별들의 전쟁",@"lyrics":@"딱 하루만 더 내게 시간을 줘\n우리 내일 다시 헤어지자고\n너와 끼던 반지 한 개 아무 의미 없이 남아\n우린 아니라는 말에 세상이 끝나버릴 것만 같아\n "}}],
//                                   @"producer":@"FNC엔터테인먼트",
//                                   @"album_story":@"AOA 3rd Mini Album [Heart Attack] Information\n\nAOA, 이번엔 ‘섹시 스포티’다! 세 번째 미니 앨범 ‘Heart Attack’ 전격 발매\n\nAOA, 무더위 날려 버릴 상큼발랄 서머송 ‘심쿵해’로 7개월 만의 컴백\n\n"};
//        
//        
//        DataParser *songParser = [[DataParser alloc] init];
//        songParser.data = aoaAlbum;
//        // 2-1. 앨범 제목을 가져오는 메소드
//        NSString *songTitle = [songParser titleWithData:aoaAlbum];
//        NSLog(@"Album Name: %@", songTitle);
//        // 2-2. song 의 제목들을 가져오는 메소드
//        for (NSString *songListName in [songParser songTitles:aoaAlbum])
//            NSLog(@"Song Titles: %@", songListName);
//        // 2-3. song data 를 담고 있는 array 를 만드는 메소드
//        NSArray *songData = [songParser songDatas:aoaAlbum];
//        NSLog(@"Song Data: %@", songData);
//        // 2-4. song 제목을 입력하면 가사를 알려주는 메소드
//        NSString *lyrics = [songParser lyricsWithTitle:@"심쿵해"];
//        NSLog(@"%@", lyrics);
//        // 2-5. song 제목 입력하면 재생시간을 알려주는 메소드
//        NSString *playTime = [songParser playTimeWithTitle:@"Luv Me"];
//        NSLog(@"%@", playTime);
    }

    // 코드 from 이봉원
//    *main.m*
//    -------------------
//    test *test1 = [[test alloc] init];
//    [test1 printAlbumName];
//    [test1 printSongLists];
//    NSMutableArray *songDataArr = [test1 makeSongArray];
//    [test1 printSongRange:@"심쿵해"];
//    [test1 printSongLyrics:@"심쿵해"];
//    NSLog(@"%@",songDataArr);
//    
//    
//    *test.m*
//    -----------------------
//    - (void)printAlbumName{
//        NSLog(@"앨범 타이틀 : %@", self.aoaAlbum[@"album_info"][@"title"]);
//    }
//    
//    - (void)printSongLists{
//        for (NSInteger i = 0; i < [self.aoaAlbum[@"song_list"] count]; i++)
//            NSLog(@"곡리스트 : %@", self.aoaAlbum[@"song_list"][i][@"name"]);
//    }
//    
//    - (NSMutableArray *)makeSongArray{
//        NSMutableArray *songDataArr = [NSMutableArray array];
//        for (NSInteger i = 0; i < [self.aoaAlbum[@"song_list"] count]; i++)
//            songDataArr[i] = self.aoaAlbum[@"song_list"];
//        return songDataArr;
//    }
//    
//    - (void)printSongLyrics:(NSString *)songTitle{
//        for (NSInteger i = 0; i < [self.aoaAlbum[@"song_list"] count]; i++)
//            if ([self.aoaAlbum[@"song_list"][i][@"name"] isEqualToString:songTitle])
//                NSLog(@"%@ 가사\n%@", songTitle, self.aoaAlbum[@"song_list"][i][@"song_info"][@"lyrics"]);
//    }
//    
//    - (void)printSongRange:(NSString *)songTitle{
//        for (NSInteger i = 0; i < [self.aoaAlbum[@"song_list"] count]; i++)
//            if ([self.aoaAlbum[@"song_list"][i][@"name"] isEqualToString:songTitle])
//                NSLog(@"곡 길이 : %@", self.aoaAlbum[@"song_list"][i][@"total_play_time"]);
//    }
    
    return 0;
}
