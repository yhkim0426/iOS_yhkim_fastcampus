
``` Objective-C

#import "ViewController.h"

@interface ViewController ()

@property NSArray *itemImgList;

@end

@implementation ViewController

// 구분

//! = 수정한 내용 
// = 주석

- (void)viewDidLoad {
    [super viewDidLoad];

    //! CGFloat statusBar = 20;
    CGFloat statusBarHeight = 20;
    
    //! CGFloat padding = 20;
    CGFloat spacingBetweenViewAndMainFrame = 20;
    
    //! CGFloat innerPadding = 10;
    CGFloat spacingBetweenPictureBlocks = 10;

    // 작업공간 기준뷰 크기 설정
    //! CGFloat viewWidth = self.view.frame.size.width-2*padding;
    CGFloat viewWidth = self.view.frame.size.width-2*spacingBetweenViewAndMainFrame;
    //! CGFloat viewHeight = self.view.frame.size.height-2*padding;
    CGFloat viewHeight = self.view.frame.size.height-2*spacingBetweenViewAndMainFrame;
    
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
            productImage.image = [UIImage imageNamed:[self.itemImgList objectAtIndex:(arc4random()%9)]];
            [upperButtonModuleView addSubview:productImage];
            
            // 위에서 생성된 이미지뷰에 각각 투명한 버튼 할당
            UIButton *productButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonLength, buttonHeight)];
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

```
