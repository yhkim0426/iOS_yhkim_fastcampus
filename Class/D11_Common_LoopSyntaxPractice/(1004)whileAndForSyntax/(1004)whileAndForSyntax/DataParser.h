//
//  DataParser.h
//  (1004)whileAndForSyntax
//
//  Created by Nexus_MYT on 2016. 10. 4..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataParser : NSObject

@property NSDictionary *data;

// 앨범 이름 가져오기
- (NSString *)titleWithData:(NSDictionary *)data;
// song의 제목들
- (NSArray *)songTitles:(NSDictionary *)data;
// song data 리스트 만들기
- (NSArray *)songDatas:(NSDictionary *)data;
// 제목 입력시 가사 출력
- (NSString *)lyricsWithTitle:(NSString *)title;
// 제목 입력시 재생 시간 출력
- (NSString *)playTimeWithTitle:(NSString *)title;

@end
