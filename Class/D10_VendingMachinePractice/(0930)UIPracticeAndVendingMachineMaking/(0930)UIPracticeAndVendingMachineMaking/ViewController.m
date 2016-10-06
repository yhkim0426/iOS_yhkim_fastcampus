//
//  ViewController.m
//  (0930)UIPracticeAndVendingMachineMaking
//
//  Created by Nexus_MYT on 2016. 9. 30..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *itemImgList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UILabel, UIImageView은 isUserInteractionEnabled 프로퍼티가 기본 NO 로 되어있다
    // UIView 는 이게 YES 로 되어 있음
    
    // 1. 레이블 예제 시도
//    CGFloat padding = 20;
//    
//    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(padding, padding+20, self.view.frame.size.width-padding, self.view.frame.size.height/2)];
//    [self.view addSubview:myView];
//    
//    CGFloat labelHeight = 35;
//    CGFloat labelWidth = self.view.frame.size.width-2*padding;
//    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
//    myLabel.text = @"예제 화면 입니다.";
//    [myView addSubview:myLabel];
//    
//    UILabel *mySecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeight, labelWidth, labelHeight)];
//    mySecondLabel.text = @"예쁜 레이블 입니다.";
//    mySecondLabel.textColor = [UIColor redColor];
//    mySecondLabel.textAlignment = NSTextAlignmentRight;
//    [myView addSubview:mySecondLabel];
//    
//    CGFloat viewWidth = 300;
//    CGFloat viewHeight = 100;
//    UIView *myColorView = [[UIView alloc]initWithFrame:CGRectMake(0, 2*labelHeight, viewWidth, viewHeight)];
//    myColorView.backgroundColor = [UIColor blackColor];
//    [myView addSubview:myColorView];
//    
//    UILabel *myThirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2*labelHeight+viewHeight-labelHeight, viewWidth, labelHeight)];
//    myThirdLabel.text = @"View 위에 레이블입니다.";
//    myThirdLabel.textColor = [UIColor whiteColor];
//    myThirdLabel.textAlignment = NSTextAlignmentRight;
//    [myView addSubview:myThirdLabel];
//    
//    UILabel *myFourthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2*labelHeight+viewHeight+10, labelWidth, labelHeight)];
//    myFourthLabel.text = @"중앙에 있는 레이블 입니다.";
//    myFourthLabel.textAlignment = NSTextAlignmentCenter;
//    [myView addSubview:myFourthLabel];
//    
//    UILabel *myFifthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2*labelHeight+viewHeight+10+labelHeight, labelWidth, labelHeight)];
//    myFifthLabel.text = @"폰트는 20입니다.";
//    myFifthLabel.font = [UIFont systemFontOfSize:20];
//    myFifthLabel.textAlignment = NSTextAlignmentCenter;
//    [myView addSubview:myFifthLabel];
//
//    CGFloat borderWidth = 2.0f;
//    
//    self.view.layer.borderColor = [UIColor blackColor].CGColor;
//    self.view.layer.borderWidth = borderWidth;
    
    
    // 2. 자판기 만들기
    
    // 상단 스테이터스 바 만큼 아래로 옵셋
    CGFloat statusBar = 20;
    // 상하좌우 여백
    CGFloat padding = 20;
    // 작업공간 버튼간 내부 패딩 설정
    CGFloat innerPadding = 10;

    // 작업공간 기준뷰 크기 설정
    CGFloat viewWidth = self.view.frame.size.width-2*padding;
    CGFloat viewHeight = self.view.frame.size.height-2*padding;
    
    // 작업공간 기준뷰 생성
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(padding, padding+statusBar, viewWidth, viewHeight-statusBar)];
    mainView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:mainView];
    
    // 금액표시 레이블 크기 설정
    CGFloat priceLabelHeight = 50;
    CGFloat priceLabelWidth = mainView.frame.size.width;
    
    // 상품버튼 모듈 크기 설정
    CGFloat upperButtonModuleHeight = 530;
    CGFloat upperButtonModuleWidth = priceLabelWidth;
    
    // 금액버튼 모듈 크기 설정
    CGFloat lowerButtonModuleViewHeight = mainView.frame.size.height-3*innerPadding-upperButtonModuleHeight-priceLabelHeight;
    CGFloat lowerButtonModuleViewWidth = priceLabelWidth;
    
    // 상품버튼 모듈 크기 설정 및 생성
    UIView *upperButtonModuleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, upperButtonModuleWidth, upperButtonModuleHeight)];
    upperButtonModuleView.backgroundColor = [UIColor blueColor];
    [mainView addSubview:upperButtonModuleView];
    
    // 상단에 생성되는 상품버튼 갯수 (row: 가로, column: 세로)
    NSInteger rowNumberOfButtons = 3;
    NSInteger columnNumberOfButtons = 6;
    
    // 버튼 하나당 가로길이 - inner 패딩은 (버튼갯수-1)개 존재한다
    CGFloat buttonLength = (upperButtonModuleWidth - (rowNumberOfButtons-1)*innerPadding)/rowNumberOfButtons;
    CGFloat buttonHeight = (upperButtonModuleHeight - (columnNumberOfButtons-1)*innerPadding)/columnNumberOfButtons;
    
    self.itemImgList = @[@"1라자냐.jpg", @"2팟타이.jpg", @"3라면.jpg", @"4연어.jpg", @"5캐비어.jpg", @"6국밥.jpg", @"7호밀빵.jpg", @"8그리스식정찬.jpg", @"9바나나.jpg"];
    
    // 가로(i), 세로(j) 갯수만큼 버튼 객체 생성 후 메인 뷰에 추가
    for (int i=0; i<rowNumberOfButtons; i++) {
        for (int j=0; j<columnNumberOfButtons; j++) {
            UIImageView *productImage = [[UIImageView alloc] init];
            productImage.frame = CGRectMake(i*(buttonLength+innerPadding), j*(buttonHeight+innerPadding), buttonLength, buttonHeight);
//            productImage.image = [UIImage imageNamed:[self.itemImgList objectAtIndex:((columnNumberOfButtons)*i+j)]];
            productImage.image = [UIImage imageNamed:[self.itemImgList objectAtIndex:(arc4random()%9)]];
            [upperButtonModuleView addSubview:productImage];
            
            // 위에서 생성된 이미지뷰에 각각 투명한 버튼 할당
            UIButton *productButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonLength, buttonHeight)];
            
//            UIButton *productButton = [[UIButton alloc] initWithFrame:CGRectMake(i*(buttonLength+innerPadding), j*(buttonHeight+innerPadding), buttonLength, buttonHeight)];
//            productButton.backgroundColor = [UIColor greenColor];
//            productButton.imageView setImage:[UIImage imageNamed:self.itemImg]
            [productImage addSubview:productButton];
        }
    }
    
    // 금액표시 레이블 생성
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, upperButtonModuleView.frame.size.height+innerPadding, priceLabelWidth, priceLabelHeight)];
    priceLabel.backgroundColor = [UIColor grayColor];
    priceLabel.text = @"가격: XXXXX";
    priceLabel.textAlignment = NSTextAlignmentRight;
    [mainView addSubview:priceLabel];
    
    // 금액버튼 모듈 생성
    UIView *lowerButtonModuleView = [[UIView alloc] initWithFrame:CGRectMake(0, upperButtonModuleView.frame.size.height+priceLabelHeight+2*innerPadding, lowerButtonModuleViewWidth, lowerButtonModuleViewHeight)];
    lowerButtonModuleView.backgroundColor = [UIColor redColor];
    [mainView addSubview:lowerButtonModuleView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
