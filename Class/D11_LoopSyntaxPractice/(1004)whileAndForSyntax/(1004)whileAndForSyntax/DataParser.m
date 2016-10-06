//
//  DataParser.m
//  (1004)whileAndForSyntax
//
//  Created by Nexus_MYT on 2016. 10. 4..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "DataParser.h"

@interface DataParser ()

// @"song_list" array 데이터 저장
@property NSMutableArray *songData;

@end

@implementation DataParser

//NSDictionary *aoaAlbum = @{@"album_info":@{@"title": @"Heart Attack",@"artist" : @"AOA",},
//  @"song_list" : @[@{
//  @"name":@"심쿵해", @"artist":@"AOA", @"total_play_time": @223, @"song_info":@{
//                                                                                                                        @"writer":@"용감한 형제들",@"composer":@"Mr.강",@"lyrics":@"완전 반해 반해 버렸어요\n부드러운 목소리에\n반해 반해 버렸어요\n난 떨려\n(AOA Let's Go!)"}},@{@"name":@"Luv Me", @"artist":@"AOA", @"total_play_time": @252,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"JS",@"lyrics":@"Do it this do it this girl\nDo it this do it this hey\nDo it this do it this girl\n "}},@{@"name":@"한개", @"artist":@"AOA", @"total_play_time": @238,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"별들의 전쟁",@"lyrics":@"딱 하루만 더 내게 시간을 줘\n우리 내일 다시 헤어지자고\n너와 끼던 반지 한 개 아무 의미 없이 남아\n우린 아니라는 말에 세상이 끝나버릴 것만 같아\n "}}],
//  @"producer":@"FNC엔터테인먼트",
//  @"album_story":@"AOA 3rd Mini Album [Heart Attack] Information\n\nAOA, 이번엔 ‘섹시 스포티’다! 세 번째 미니 앨범 ‘Heart Attack’ 전격 발매\n\nAOA, 무더위 날려 버릴 상큼발랄 서머송 ‘심쿵해’로 7개월 만의 컴백\n\n"};

- (NSString *)titleWithData:(NSDictionary *)data {
    if (data != nil) {
        NSDictionary *album_info = [data objectForKey:@"album_info"];
        NSString *title = [album_info objectForKey:@"title"];
        return title;
    }
    return nil;
}

- (NSArray *)songTitles:(NSDictionary *)data {
    if (data != nil) {
        NSDictionary *tag_song_list = [data objectForKey:@"song_list"];
        NSMutableArray *eachSongName = [[NSMutableArray alloc] init];
        // 노래마다 데이터 출력, 태그명이 name 인 값들만 가변 array 에 추가
        for (NSDictionary *listName in tag_song_list) {
            [eachSongName addObject:[listName objectForKey:@"name"]];
        }
        return eachSongName;
    }
    return nil;
}

// data 로 부터 song data 를 받아서 _songData 에 저장 후, NSArray 형태로 출력
- (NSArray *)songDatas:(NSDictionary *)data {
    if (data != nil) {
        NSDictionary *tag_song_list = [data objectForKey:@"song_list"];
        NSMutableArray *songDataList = [[NSMutableArray alloc] init];
        // 각 노래별 정보 Array 를 songDataList에 저장.
        for (NSArray *songInfo in tag_song_list) {
            [songDataList addObject:songInfo];
        }
        _songData = songDataList;
        return songDataList;
    }
    return nil;
}

- (NSString *)lyricsWithTitle:(NSString *)title {
    NSString *result;
    for (NSInteger i=0; i<_songData.count; i++) {
        if ([title isEqualToString:_songData[i][@"name"]])
            result = _songData[i][@"song_info"][@"lyrics"];
    }

    return result;
}

- (NSString *)playTimeWithTitle:(NSString *)title {
    NSString *result=@"";
    for (NSInteger i=0; i<_songData.count; i++) {
//        NSLog(@"lyrics: %c", [@"test" characterAtIndex:i]);
        if ([title isEqualToString:_songData[i][@"name"]]) {
            NSString *min= [NSString stringWithFormat:@"%ld",
                            [_songData[i][@"total_play_time"] integerValue]/100];
            NSString *sec= [NSString stringWithFormat:@"%ld",
                        [_songData[i][@"total_play_time"] integerValue]%100];
            
            result = [result stringByAppendingFormat:@"%@ : %@", min, sec];
        }
        
    }
    
    return result;
}

@end
