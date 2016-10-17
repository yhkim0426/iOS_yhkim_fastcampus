//
//  ViewController.m
//  (1011)UITextFieldForLoginPage
//
//  Created by Nexus_MYT on 2016. 10. 11..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate,UIScrollViewDelegate>

@property UILabel *resultLabel;
@property NSString *inputText;
@property UITextField *myTextField;

@property CGFloat presentXOffset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. textField 예제 -> 입력된 텍스트를 버튼 눌렀을 때, 하단의 text에 띄우는 예제
//    UIView *myLoginTest = [[UIView alloc] initWithFrame:CGRectMake(20, 30, self.view.frame.size.width-40, (self.view.frame.size.height-60)/4)];
//    myLoginTest.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:myLoginTest];
//    
//    UITextField *myTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, myLoginTest.frame.size.height/2-35, 200, 35)];
//    self.myTextField = myTextField;
//    myTextField.font = [UIFont systemFontOfSize:15];
//    myTextField.textColor = [UIColor whiteColor];
//    myTextField.textAlignment = NSTextAlignmentCenter;
//    myTextField.borderStyle = UITextBorderStyleLine;
//    myTextField.placeholder = @"inputText";
//    
//    myTextField.delegate = self;
//    [myLoginTest addSubview:myTextField];
//    
//    
//    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, myLoginTest.frame.size.height/2+35, 200, 35)];
//    self.resultLabel = myLabel;
//    self.inputText = @"empty";
//    myLabel.text = [NSString stringWithFormat:@"결과: %@", self.inputText];
//    [myLoginTest addSubview:myLabel];
//    
//    UIButton *myButton = [[UIButton alloc] initWithFrame:CGRectMake(20+200, myLoginTest.frame.size.height/2-70, 100, 100)];
//    [myButton setTitle:@"확인" forState:UIControlStateNormal];
//    [myButton addTarget:self action:@selector(touchUpInsideButton:) forControlEvents:UIControlEventTouchUpInside];
//    [myLoginTest addSubview:myButton];
    
    // 2. 스크롤뷰 예제 3색 컨텐츠 위를 움직이는 스크롤 뷰
    NSInteger vWidth = 320;
    NSInteger vHeight = 460;
    NSInteger nContents = 3;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 30, vWidth, vHeight)];
    // 컨텐츠 사이즈 조정
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width*nContents, vHeight)];
    // 델리게이트 설정
    // bounces 는 YES 가 기본임
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    
    // 추가뷰 1
    UIView *newView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, vWidth, vHeight)];
    newView1.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:newView1];
    
    // 추가뷰 2
    UIView *newView2 = [[UIView alloc] initWithFrame:CGRectMake(vWidth, 0, vWidth, vHeight)];
    newView2.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:newView2];
    
    // 추가뷰 3
    UIView *newView3 = [[UIView alloc] initWithFrame:CGRectMake(vWidth*2, 0, vWidth, vHeight)];
    newView3.backgroundColor = [UIColor redColor];
    [scrollView addSubview:newView3];
    
    // 상단에 페이지 표시바 추가
    UILabel *pageStatusLB = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 200, 35)];
    self.resultLabel = pageStatusLB;
    pageStatusLB.text = @"page: 1";
    [self.view addSubview:pageStatusLB];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.presentXOffset = scrollView.contentOffset.x;
    self.resultLabel.text = [NSString stringWithFormat:@"page: %.lf", (self.presentXOffset/(scrollView.contentSize.width/3)+1)];
}

//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    self.inputText = textField.text;
//}
//
    // return 값을 YES 로 놓으면 수정 후 확인 버튼 눌렀을 때 키보드가 사라짐. NO는 사라지지 않음.
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
//    self.inputText = textField.text;
//    return YES;
//}

- (void)touchUpInsideButton:(UIButton *)sender {
    
    // 굳이 델리게이트 쓰지 않고도 self.myTextField.text 하면 그 텍스트 데이터 가져올 수 있음
//    [self textFieldShouldEndEditing:self.myTextField];
//    [self.view isFirstResponder];
//    self.myTextField.text
    
    self.resultLabel.text = [NSString stringWithFormat:@"결과: %@", self.myTextField.text];
    
    // 입력 버튼 눌렀을 때 창 초기화
    if (self.myTextField.text != nil) {
        self.myTextField.text = @"";
    }
    
    
    
    // 이거 안해도 레이블은 업데이트 됨
//    [self.myLoginTest addSubview:self.resultLabel];
    [self.myTextField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
