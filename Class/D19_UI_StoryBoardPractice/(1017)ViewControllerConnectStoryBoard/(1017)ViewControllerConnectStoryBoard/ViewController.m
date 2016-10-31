//
//  ViewController.m
//  (1017)ViewControllerConnectStoryBoard
//
//  Created by Nexus_MYT on 2016. 10. 17..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UILabel *nameLabel;

// 1. 스토리보드 실습
// IBOutlet -> Interface builder 와 연결될 프로퍼티를 나타냄
//@property IBOutlet UILabel *outletLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 같은 레이블 클래스를 이용해서 storyboard 위에 여러 개 사용할 수 있다.
    // IBOutlet -> 1:1 연결
    // IBAction -> 1:N 혹은 N:N 연결
    
//    UILabel *myLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
//    myLB.text = @"Test!";
//    [self.view addSubview:myLB];
    
    // 2. MVC 패턴에 대한 이해
    // -> MyViewController 에서 계속.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
