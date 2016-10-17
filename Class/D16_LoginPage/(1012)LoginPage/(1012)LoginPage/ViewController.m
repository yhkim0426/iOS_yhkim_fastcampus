//
//  ViewController.m
//  (innerPadding12)LoginPage
//
//  Created by Nexus_MYT on 2016. innerPadding. 12..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property CGFloat loginViewCenterPointX;
@property CGFloat loginViewCenterPointY;

@property UITextField *idTF;
@property UITextField *pwTF;

@property UIView *loginView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat titleWidth = 200;
    CGFloat titleHeight = 35;
    
    UILabel *loginPageTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-titleWidth/2, 80, titleWidth, titleHeight)];
    loginPageTitle.text = @"My Login Page";
    loginPageTitle.font = [UIFont systemFontOfSize:15];
    loginPageTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:loginPageTitle];
    
    CGFloat loginViewWidth = 250;
    CGFloat loginViewHeight = 150;
    self.loginViewCenterPointX = self.view.frame.size.width/2;
    self.loginViewCenterPointY = self.view.frame.size.height/2;
    CGFloat loginViewOriginPointX = self.loginViewCenterPointX-loginViewWidth/2;
    CGFloat loginViewOriginPointY = self.loginViewCenterPointY-loginViewHeight/2;
    
    UIView *loginView = [[UIView alloc] initWithFrame:CGRectMake(loginViewOriginPointX,
                                                                 loginViewOriginPointY,
                                                                 loginViewWidth,
                                                                 loginViewHeight)];
    self.loginView = loginView;
//    loginView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:loginView];
    
    
    CGFloat textFieldWidth = 150;
    CGFloat textFieldHeight = 40;
    CGFloat innerPadding = 10;
    
    UITextField *idTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, textFieldWidth, textFieldHeight)];
    self.idTF = idTF;
    idTF.borderStyle = UITextBorderStyleNone;
    idTF.placeholder = @" insert ID";
    idTF.delegate = self;
    idTF.layer.borderWidth = 2.0f;
    idTF.layer.borderColor = [[UIColor grayColor] CGColor];
    [loginView addSubview:idTF];

    UITextField *pwTF = [[UITextField alloc] initWithFrame:CGRectMake(0, textFieldHeight+innerPadding, textFieldWidth, textFieldHeight)];
    self.pwTF = pwTF;
    pwTF.borderStyle = UITextBorderStyleNone;
    pwTF.placeholder = @" insert PW";
    pwTF.delegate = self;
    pwTF.layer.borderWidth = 2.0f;
    pwTF.layer.borderColor = [[UIColor grayColor] CGColor];
    pwTF.secureTextEntry = YES;
    [loginView addSubview:pwTF];
    
    CGFloat sendBtnWidth = (loginViewWidth-textFieldWidth-innerPadding);
    CGFloat sendBtnHeight = 2*textFieldHeight+innerPadding;
    
    // 로그인창 끝을 기준으로 버튼 크기를 잡았기 때문에 버튼 길이는 (-) 임
    UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(loginView.frame.size.width, 0, -sendBtnWidth, sendBtnHeight)];
    [sendBtn setTitle:@"로그인" forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(touchUpInsideButton:) forControlEvents:UIControlEventTouchUpInside];
    sendBtn.layer.borderWidth = 2.0f;
    sendBtn.layer.borderColor = [[UIColor grayColor] CGColor];
    [sendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginView addSubview:sendBtn];
    
    CGFloat registerBtnWidth = loginViewWidth;
    CGFloat registerBtnHeight = loginViewHeight-sendBtnHeight-innerPadding;
    
    // 로그인창 끝을 기준으로 버튼 크기를 잡았기 때문에 버튼 길이는 (-) 임
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, loginViewHeight, registerBtnWidth, -registerBtnHeight)];
    [registerBtn setTitle:@"회원가입" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(touchUpInsideButton:) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.layer.borderWidth = 2.0f;
    registerBtn.layer.borderColor = [[UIColor grayColor] CGColor];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginView addSubview:registerBtn];
    
    
    // 키보드가 올라왔을 때 자동으로 시행되는 메소드
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

/// 키보드가 올라왔을 때 자동으로 그 높이를 계산해주는 메소드
- (void)keyboardWillShow:(NSNotification *)notification {
    NSLog(@"keyboard: %f", [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height);
    self.loginViewCenterPointY += [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
}


- (void)touchUpInsideButton:(UIButton *)sender {
    [self.idTF resignFirstResponder];
    [self.pwTF resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
