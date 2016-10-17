//
//  ViewController.m
//  (1017)2LoginActivity
//
//  Created by Nexus_MYT on 2016. 10. 17..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *idTF;
@property (weak, nonatomic) IBOutlet UITextField *pwTF;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *autoLoginButton;

@property NSArray *userInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userInfo = @[@{@"id":@"test", @"pw":@"1234"}];
    
    [self.loginBtn addTarget:self action:@selector(loginTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerBtn addTarget:self action:@selector(registerTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.autoLoginButton addTarget:self action:@selector(clickAutoLoginButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)clickAutoLoginButton:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *autoLoginButton = (UIButton *)sender;
        
        // 누를 떄마다 체크 상태가 반전됨
        [autoLoginButton setSelected:!autoLoginButton.isSelected];
    }
}

- (void)loginTouchUpInside:(id)sender {
    NSLog(@"로그인 버튼 눌림 %@ %@", self.idTF, self.pwTF);
    if ([sender isKindOfClass:[UIButton class]]) {
        
        if ([self.idTF isEqual:self.userInfo[0][@"id"]] && [self.pwTF isEqual:self.userInfo[0][@"pw"]]) {
            NSLog(@"로그인 성공");
        } else {
            NSLog(@"로그인 실패");
        }
    }
}

- (void)registerTouchUpInside:(id)sender {
    NSLog(@"로그인 버튼 눌림");
    NSLog(@"회원가입");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 텍스트 필드가 수정되기 직전에 Textfield 가 ViewController 에게 물어본다
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    // 물어본 tf 가 비밀번호 입력받는 곳이라면,
    if ([textField isSecureTextEntry]) {
        // 수정 불가
        return NO;
    }
    // 아니면 수정 가능
    return YES;
}

// 리턴 키 눌렀을 때, 호출되는 델리게이트 메서드
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    
    return YES;
}

@end
