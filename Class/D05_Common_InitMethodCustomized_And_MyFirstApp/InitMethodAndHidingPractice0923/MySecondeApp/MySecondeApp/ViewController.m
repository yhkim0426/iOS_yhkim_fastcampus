//
//  ViewController.m
//  MySecondeApp
//
//  Created by Nexus_MYT on 2016. 9. 23..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>

@property AVAudioPlayer *player;
@property UIButton *playButton;
@property UILabel *timeLabel;
@property NSTimer *timer;

// !edited 버튼과 플레이어 추가
@property AVAudioPlayer *player2;
@property UIButton *playButton2;

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
    
    // !edited player 1 배속 기능 활성화. 반드시 처음 생성한 직후에 활성화시켜야 함
    self.player.enableRate = YES;
    
    // !edited 장난기가 발동한 부분 (듀얼버튼)
    CGRect buttonFrame2 = CGRectMake(30.f, 220.f, 100.f, 50.f);
    self.playButton2 = [[UIButton alloc] initWithFrame:buttonFrame2];
    [self.playButton2 setTitle:@"Play2" forState:UIControlStateNormal];
    [self.playButton2 setTitle:@"Pause2" forState:UIControlStateSelected];
    [self.playButton2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.playButton2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.playButton2 setBackgroundColor:[UIColor grayColor]];
    [self.playButton2 addTarget:self action:@selector(clickPlayButton2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playButton2];
    
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    [self.player2 setDelegate:self];
    
    // !edited player2 배속 기능 활성화. 반드시 처음 생성한 직후에 활성화시켜야 함
    self.player2.enableRate = YES;
    
    self.player.numberOfLoops = 10;
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

// !edited 버튼추가
- (void)clickPlayButton2:(UIButton *)sender {
    // selected 앞의 !는 반전시켜준다는 의미임
    // BOOL currentSelectedState = !sender.selected; 는 아래와 같은 의미
    [sender setSelected:!sender.selected];
    
    // 버튼이 눌려졌을 때
    if (sender.isSelected == YES) {
        // 음악 재생
        [self.player2 play];
        
        // 맥 오른쪽 스피커로 사운드 출력
        [self.player2 setPan:1.0f];
    } // 버튼이 눌려지지 않을 때
    else {
        // 플레이어2 멈춤
        [self.player2 pause];
    }
    return;
}

- (void)checkTime {
    // 총 재생시간과 현재시간이 0 이상일때 타이머 레이블에 값 출력
    if (self.player.duration > 0 && self.player.currentTime > 0) {
        [self displayTime:self.player.currentTime
                 duration:self.player.duration];
    
//        // !edited 시간이 지남에 따라 점점 빨라짐 2배(시작) -> 3배속(최종)
//        self.player.rate = (2+self.player.currentTime/self.player.duration);
//        
//        // !edited 시간이 지남에 따라 점점 느려짐 2배(시작) -> 1배속(최종)
//        self.player2.rate = (2-self.player.currentTime/self.player.duration);

//        [self.player playAtTime:6.0];
//        AVAudio3DMixingRenderingAlgorithm algorithm
//        [self AVAudio3DMixingRenderingAlgorithm:2];
        
        // !edited 재생시간이 지날수록 두 음원 위치가 서서히 바뀜 (입체사운드?)
        [self.player setPan:(-1 + 2*(self.player.currentTime/self.player.duration))];
        [self.player2 setPan:(1 - 2*(self.player2.currentTime/self.player2.duration))];
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
    
    // !edited 버튼 2 추가
    [self.playButton2 setSelected:NO];
}

@end
