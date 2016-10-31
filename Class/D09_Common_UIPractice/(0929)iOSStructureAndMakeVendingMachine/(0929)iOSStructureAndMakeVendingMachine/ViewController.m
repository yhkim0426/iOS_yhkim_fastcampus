//
//  ViewController.m
//  (0929)iOSStructureAndMakeVendingMachine
//
//  Created by Nexus_MYT on 2016. 9. 29..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 뷰 만들기 예제
//    self.view.backgroundColor = [UIColor blackColor];
//    // 객체 생성
//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
////    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myView.bounds.size.width-100, myView.bounds.size.height-100)];
//    NSLog(@"%ld", (NSInteger) myView.bounds.size.width-100);
//    
//    UIView *mySecondView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 320, 240)];
//
//    // 배경색 변경
//    myView.backgroundColor = [UIColor redColor];
//    mySecondView.backgroundColor = [[UIColor alloc] initWithRed:100.0/255.0 green:100.0/255.0 blue:0 alpha:0.5];
//    
//    // 뷰 투명도 50%
//    myView.alpha = 0.8;
//    
//    // 뷰 추가
//    [self.view addSubview:myView];
//    [myView addSubview:mySecondView];
    
    // 2. 뷰 만들기 예제2 - 프레임의 좌표를 가져와서 사용하기
//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(15, 15+20, 345, 100)];
//    myView.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:0.5];
//    [self.view addSubview:myView];
//    
////    UIView *mySecondView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-15, self.view.bounds.size.height-15, -345, -100)]; bounds 는 x, y 좌표를 가져올 수 없으므로 frame 을 쓰길 권장
//    UIView *mySecondView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width-15, self.view.frame.size.height-15, -345, -100)];
//    mySecondView.backgroundColor = [[UIColor alloc] initWithRed:0 green:1 blue:1 alpha:0.4];
//    [self.view addSubview:mySecondView];
    
    
//    // 3. 뷰 만들기 예제3 - 부모뷰를 기준으로 자식뷰의 상대좌표계 이용하기
//    
//    // 스테이터스 바 만큼 20포인트 내림
//    NSInteger statusBarPadding = 20;
//    // 테두리에서 패팅 15포인트 줌
//    NSInteger boundaryPadding = 15;
//    // 투명도(알파값)
//    CGFloat alpha = 0.80;
//    
//    // 첫 번째 뷰 생성 - 스테이터스 바 만큼 내리고, 상하좌우 15포인트 만큼 패딩 줌
//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(boundaryPadding, boundaryPadding+statusBarPadding, self.view.frame.size.width-2*boundaryPadding, self.view.frame.size.height-2*boundaryPadding-statusBarPadding)];
//    // 첫 번째 뷰 색깔 줌 - 파란색, 투명도 alpha 만큼 줌
//    myView.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:alpha];
//    // 전체 뷰에 첫 번째 뷰를 추가함
//    [self.view addSubview:myView];
//    
//    // 두 번째 뷰 생성 - 첫 번째 뷰 기준으로 상하좌우 15포인트 만큼 패딩 줌 - 빨간색
//    UIView *mySecondView = [[UIView alloc] initWithFrame:CGRectMake(boundaryPadding, boundaryPadding, myView.frame.size.width-2*boundaryPadding, myView.frame.size.height-2*boundaryPadding)];
//    mySecondView.backgroundColor = [[UIColor alloc] initWithRed:1 green:0 blue:0 alpha:alpha];
//    [myView addSubview:mySecondView];
//    
//    // 세 번째 뷰 생성 - 두 번째 뷰 기준으로 상하좌우 15포인트 만큼 패딩 줌 - 초록색
//    UIView *myThirdView = [[UIView alloc] initWithFrame:CGRectMake(boundaryPadding, boundaryPadding, mySecondView.frame.size.width-2*boundaryPadding, mySecondView.frame.size.height-2*boundaryPadding)];
//    myThirdView.backgroundColor = [[UIColor alloc] initWithRed:0 green:1 blue:0 alpha:alpha];
//    [mySecondView addSubview:myThirdView];

    // 경합 1
//    NSInteger horizontalPadding = 50;
//    NSInteger lineWidth = 20;
//    NSInteger height = 200;
//    NSInteger lineLength = self.view.frame.size.width-2*horizontalPadding;
//    
//    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-(lineLength/2), self.view.frame.size.height/2-(height/2+lineWidth/2), lineLength, lineWidth)];
//    topLine.backgroundColor = [UIColor blueColor];
//    topLine.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:1];
//    [self.view addSubview:topLine];
//    
//    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-(lineLength/2), self.view.frame.size.height/2+(height/2+lineWidth/2), lineLength, lineWidth)];
//    bottomLine.backgroundColor = [[UIColor alloc] initWithRed:0 green:1 blue:0 alpha:1];
//    [self.view addSubview:bottomLine];
//    
//    UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-(lineLength/2), self.view.frame.size.height/2-(height/2+lineWidth/2), lineWidth, height+2*lineWidth)];
//    leftLine.backgroundColor = [[UIColor alloc] initWithRed:1 green:0 blue:0 alpha:1];
//    [self.view addSubview:leftLine];
//    
//    UIView *rightLine = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2+(lineLength/2), self.view.frame.size.height/2-(height/2+lineWidth/2), lineWidth, height+2*lineWidth)];
//    rightLine.backgroundColor = [[UIColor alloc] initWithRed:1 green:1 blue:0 alpha:1];
//    [self.view addSubview:rightLine];
    
    // 경합2
    
    NSInteger horizontalPadding = 50;
    NSInteger height = 200;
    NSInteger lineWidth = 20;
    
    UIView *blue = [[UIView alloc] initWithFrame:CGRectMake(horizontalPadding, self.view.frame.size.height/2-height/2, self.view.frame.size.width/1-horizontalPadding*2, height)];
    blue.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blue];
    
    UIView *green = [[UIView alloc] initWithFrame:CGRectMake(horizontalPadding, self.view.frame.size.height/2-height/2+lineWidth, self.view.frame.size.width/1-horizontalPadding*2, height-lineWidth)];
    green.backgroundColor = [UIColor greenColor];
    [self.view addSubview:green];
    
    UIView *red = [[UIView alloc] initWithFrame:CGRectMake(0, 0, blue.frame.size.width, blue.frame.size.height-lineWidth*2)];
    red.backgroundColor = [UIColor redColor];
    [green addSubview:red];
    
    UIView *yellow = [[UIView alloc] initWithFrame:CGRectMake(lineWidth, 0, blue.frame.size.width-lineWidth, blue.frame.size.height-lineWidth*2)];
    yellow.backgroundColor = [UIColor yellowColor];
    [red addSubview:yellow];
    
    UIView *white = [[UIView alloc] initWithFrame:CGRectMake(lineWidth, 0, blue.frame.size.width-2*lineWidth, blue.frame.size.height-lineWidth*2)];
    white.backgroundColor = [UIColor grayColor];
    [red addSubview:white];
    
    self.view.backgroundColor = [UIColor grayColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"memory warning");
    // Dispose of any resources that can be recreated.
}


@end
