//
//  ViewController.m
//  (1010)View
//
//  Created by Nexus_MYT on 2016. 10. 10..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSInteger btnNumber;
@property UIButton *beforeSelectedBtn;
@property UIView *myView;
@property UILabel *resultLabel;
@property UILabel *sliderLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // 1. UIView 예제
//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 320, 240)];
//    
//    // 배경 색변경
//    [myView setBackgroundColor:[UIColor redColor]];
//    // 뷰 투명도 50%
//    [myView setAlpha:0.5];
//    // 뷰 추가
//    [self.view addSubview:myView];
//
//    // UILabel 예제
//    // 객체 생성
//    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 35)];
//    // 레이블 텍스트 설정
//    [myLabel setText:@"첫번째 테이블"];
//    // 텍스트 컬러 설정
//    [myLabel setTextColor:[UIColor blueColor]];
//    // 텍스트 정렬
//    [myLabel setTextAlignment:NSTextAlignmentCenter];
//    // 뷰 추가
//    [myView addSubview:myLabel];
//    
//    // UIImageView 예제
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
//    // 이미지 설정
//    [imgView setImage:[UIImage imageNamed:@"mountain.jpg"]];
//    // 컨텐츠 모드 설정
//    [imgView setContentMode:UIViewContentModeScaleAspectFill];
//    // 뷰 추가
//    [myView addSubview:imgView];
    
    
    // 2. UIButton 예제
    
//    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    okBtn.frame = CGRectMake(30, 50, 200, 35);
//    [okBtn setTitle:@"ok" forState:UIControlStateNormal];
//    [okBtn setTitle:@"touchDown" forState:UIControlStateHighlighted];
//    [okBtn setTitle:@"selected" forState:UIControlStateSelected];
//    [okBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    [okBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
//    
//    okBtn.titleLabel.font = [UIFont systemFontOfSize:30];
//    // 어떤 버튼이 눌렸는지 알기 위한 장치 -> 태그
//    okBtn.tag = 10;
//    [okBtn addTarget:self action:@selector(touchUpInsideOKBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:okBtn];
    
    
    // 3. 버튼 4개짜리 만들기 예제
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width-40, self.view.frame.size.height/4-20)];
    _myView = myView;
    [self.view addSubview:myView];
    
    NSInteger nBtn = 6;
    NSInteger betWeenButtons = 10;
    
    for (NSInteger i = 0; i < nBtn; i++) {
        NSInteger column = i%2;
        NSInteger row = i/2;
        NSInteger heightDivide = nBtn/2;
        NSInteger buttonWidth = (myView.frame.size.width-10)/2;
        NSInteger buttonHeight = (myView.frame.size.height-10)/heightDivide;
        UIButton *myButton = [[UIButton alloc]initWithFrame:CGRectMake((buttonWidth+betWeenButtons)*column, (buttonHeight+betWeenButtons)*row, buttonWidth, buttonHeight)];
        myButton.tag = i;
        
        [myButton setBackgroundColor:[UIColor redColor]];
        [myButton addTarget:self action:@selector(touchUPInsideNumberBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        // 버튼이 눌렸을때 글자색깔 바뀜
        [myButton setTitle:[NSString stringWithFormat:@"%ld번 버튼", i+1] forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        [myButton setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        
        // 버튼 모서리를 둥글게 처리함
        myButton.layer.cornerRadius = 10.f;
        [myView addSubview:myButton];
    }
    
    // 버튼을 선택한 결과를 보여준다
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20+myView.frame.size.height, myView.frame.size.width, 35)];
    _resultLabel = resultLabel;
    _resultLabel.text = @"버튼 클릭 전입니다.";
    _resultLabel.textAlignment = NSTextAlignmentCenter;
    [myView addSubview:_resultLabel];
    
    UISlider *testSlider = [[UISlider alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 100, 100)];
    testSlider.maximumTrackTintColor = [UIColor redColor];
    testSlider.minimumTrackTintColor = [UIColor greenColor];
    testSlider.thumbTintColor = [UIColor blueColor];
    [testSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:testSlider];
    
    CGFloat value = testSlider.value;
    UILabel *sliderValue = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2+100, 100, 100)];
    self.sliderLabel = sliderValue;
    sliderValue.text = [NSString stringWithFormat:@"%.2lf", value];
    [self.view addSubview:sliderValue];
    
    // 4. 프로토콜 개념 + 예제
//    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 300, 160, 35)];
//    tf.borderStyle = UITextBorderStyleLine;
//    // 키보드 사라지게하는 델리게이트 호출
//    tf.delegate = self;
//    [self.view addSubview:tf];
//    
//    [self.delegate testMethod];
    
}

// 5글자 이상 넘어가면 키보드 얼리기(델리게이트)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField.text.length < 5) {
        // 5글자 이상 넘어가면 키보드 얼리기
        return YES;
    }
    
    return NO;
}

// 앱 내의 키보드 엔터를 누르면 키보드를 사라지게 하는 메소드(델리게이트)
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

// 슬라이드를 움직일때마다 현재 슬라이드 값을 출력
- (void)sliderAction:(UISlider *)sender {
    self.sliderLabel.text = [NSString stringWithFormat:@"%.2lf", sender.value];
}

- (void)touchUPInsideNumberBtn:(UIButton *)sender {
    // switch-case 문 쓰는 것보다 훨씬 간단하게 짤 수 있다.
    _btnNumber = sender.tag + 1;
    
//     선택된 버튼의 tagValue가 새로운 것이라면,
    if (_beforeSelectedBtn != sender) {
        _beforeSelectedBtn.selected = NO;
        sender.selected = YES;
        _beforeSelectedBtn = sender;
        _resultLabel.text = [NSString stringWithFormat:@"선택된 버튼은 : %ld번 버튼", _btnNumber];
    } else {
        _beforeSelectedBtn.selected = !_beforeSelectedBtn.selected;
        _resultLabel.text = @"버튼 클릭 전입니다.";
    }
}

- (void)touchUpInsideOKBtn:(UIButton *)sender {
    
    // tag 를 이용하면 다이얼패드 같이 버튼이 많은 경우 구별할 수 있게 된다
    NSInteger tagValue = sender.tag;
    
    if (sender.selected) {
        sender.selected = NO;
    } else {
        sender.selected = YES;
    }
    
    NSLog(@"%ld 버튼 클릭 완료", tagValue);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
