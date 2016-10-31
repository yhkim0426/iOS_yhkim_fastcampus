//
//  ViewController.m
//  MyFirstMusicPlayer
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>

//! 플레이 해야 하는지에 대한 플래그 설정
@property BOOL shouldContinuePlay;
@property NSObject *object;
@property NSNotification *userInfo;

@property AVAudioPlayer *player;
@property UIButton *playButton;
@property UILabel *timeLabel;
@property NSTimer *timer;


- (void)displayTime:(NSTimeInterval)currentTime
           duration:(NSTimeInterval)duration;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 레이블 위치 및 크기, 버튼 위치 및 크기 설정
    CGRect labelFrame = CGRectMake(30.0f, 30.0f, 250.f, 30.0f);
    CGRect buttonFrame = CGRectMake(30.f, 150.f, 100.f, 50.f);
    
    // 버튼 컨트롤 하는 부분
    self.playButton = [[UIButton alloc] initWithFrame:buttonFrame];
    
    // 평상시 (Normal) 버튼 텍스트에서는 Play 출력
    [self.playButton setTitle:@"Play"
                     forState:UIControlStateNormal];
    // 눌렸을 때(Selected) 버튼 텍스트에서는 Pause 출력
    [self.playButton setTitle:@"Pause"
                     forState:UIControlStateSelected];
    
    // 평상시 때 텍스트 색깔
    [self.playButton setTitleColor:[UIColor blueColor]
                          forState:UIControlStateNormal];
    // 눌렸을 때 텍스트 색깔
    [self.playButton setTitleColor:[UIColor redColor]
                          forState:UIControlStateSelected];
    // 버튼의 배경색 설정
    [self.playButton setBackgroundColor:[UIColor grayColor]];
    
    // 버튼에 음악을 시행하는 플레이어 메소드(playButton) 추가
    [self.playButton addTarget:self action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
    // 버튼 객체를 전체 뷰에 추가
    [self.view addSubview:self.playButton];
    
    // 타임 레이블 나타내는 부분
    self.timeLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [self.timeLabel setTextColor:[UIColor brownColor]];
    // 타임 레이블 객체를 전체 뷰에 추가
    [self.view addSubview:self.timeLabel];
    
    // 현재 재생중인 타이머 / 전체 재생시간
    [self displayTime:0
             duration:0];
    
    // 파일 위치 가리키는 URL(컴퓨터 내부에도 URL은 쓰인다!) + 파일명(@"sound").확장자명(@"mp3") 기입
    NSURL *soundFileURL = [[NSBundle mainBundle] URLForResource:@"sound"
                                                  withExtension:@"mp3"];
    
    // 음악을 직접적으로 재생해 줄 재생기
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    
    [self.player setDelegate:self];
    

    //! 노티를 하나로 합쳐보자
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didReceiveWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didReceiveDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification
//                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveApplicationStateChangedNotification:) name:UIApplicationWillResignActiveNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveApplicationStateChangedNotification:) name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)didReceiveApplicationStateChangedNotification:(NSNotification *)noti {
    //! 어떤 이름의 노티가 왔는지 로그로 출력 
    NSLog(@"%@", noti.name);
}

- (void)didReceiveWillResignActiveNotification:(NSNotification *)noti {
    NSLog(@"___ will resign active");
    if ([[self player] isPlaying]) {
        [self setShouldContinuePlay:YES];
        [self.player pause];
    }
}

- (void)didReceiveDidBecomeActiveNotification:(NSNotification *)noti {
    NSLog(@"___ did resign active");
    if ([self shouldContinuePlay]) {
        [self.player play];
        self.shouldContinuePlay = NO;
    }
}

#pragma mark - Display Something

/// 재생시간을 나타내는 메소드
- (void)displayTime:(NSTimeInterval)currentTime duration:(NSTimeInterval)duration {
    
    // 현재 재생시각 보여줌
    NSInteger currentMin = (NSInteger)(currentTime / 60.0);
    NSInteger currentSec = ((NSInteger)currentTime % 60);
    
    // 파일 전체시간 보여줌
    NSInteger durationtMin = (NSInteger)(duration / 60.0);
    NSInteger durationSec = ((NSInteger)duration % 60);
    
    // 타이머를 format 형태로 불러오고, 이걸 텍스트 레이블에 지정함
    NSString *timeString = [[NSString alloc] initWithFormat:@"%02ld:%02ld / %02ld:%02ld",
                            currentMin, currentSec, durationtMin, durationSec];
    [self.timeLabel setText:timeString];
}

#pragma mark - Button Methods

- (void)clickPlayButton:(UIButton *)sender {
    // selected 앞의 !는 반전시켜준다는 의미임
    // BOOL currentSelectedState = !sender.selected; 는 아래와 같은 의미
    [sender setSelected:!sender.selected];
    
    // 버튼이 눌려졌을 때
    if (sender.isSelected == YES) {
        // 음악 재생
        [self.player play];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                      target:self
                                                    selector:@selector(checkTime)
                                                    userInfo:nil
                                                     repeats:YES];
        [self.timer fire];
    } // 버튼이 눌려지지 않을 때
    else {
        // 플레이어 멈춤
        [self.player pause];
        // 타이머 정지
        [self.timer invalidate];
        // TODO: 이건 뭐지?
        self.timer = nil;
    }
    return;
}

- (void)checkTime {
    // 총 재생시간과 현재시간이 0 이상일때 타이머 레이블에 값 출력
    if (self.player.duration > 0 && self.player.currentTime > 0) {
        [self displayTime:self.player.currentTime
                 duration:self.player.duration];
    }
    return;
}

#pragma mark - AVAudioPlayerDelegate Methods

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    // 예외처리 하는 부분인듯
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"알림"
                                                                   message:@"음원파일을 찾는데 문제가 발생했습니다." preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"확인"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    
    [self presentViewController:alert animated:YES completion:^{
        NSLog(@"decode error occured : %@", error.localizedDescription);
    }];
}

/// 음악 재생이 끝났을 때 실행되는 메소드
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"음악 재생이 종료됨");
    // 재생 종료 후 시간 0, 음악파일 길이로 set
    [self displayTime:0
              duration:self.player.duration];
    // 버튼이 선택되지 않음으로 변경
    [self.playButton setSelected:NO];
}

@end
