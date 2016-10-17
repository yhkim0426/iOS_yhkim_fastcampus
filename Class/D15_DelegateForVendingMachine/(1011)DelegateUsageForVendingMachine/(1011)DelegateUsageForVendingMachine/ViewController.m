//
//  ViewController.m
//  (1011)DelegateUsageForVendingMachine
//
//  Created by Nexus_MYT on 2016. 10. 11..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"
#import "ItemView.h"

@interface ViewController ()
<ItemViewDelegate>

@property (nonatomic) NSArray *itemImgName;
@property (nonatomic) NSArray *itemData;
@property (nonatomic) NSArray *costData;

@property (nonatomic, weak) UIView *itemContainerView;
@property (nonatomic) NSMutableArray *itemViews;
@property (nonatomic, weak) UIView *dispalyView;
@property (nonatomic, weak) UILabel *displayLb;

// inputView 라는 이름을 쓰면 framework의 property를 override 하기 때문에 다른 이름을 써줘야 한다.
@property (nonatomic, weak) UIView *inputViewCustom;
@property (nonatomic) NSMutableArray *inputBtns;

// 남은 돈
@property (nonatomic, assign) NSInteger remainedMoney;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.itemImgName = @[@"island1",@"island2",@"island3.jpg",@"island4.jpg"];
//    self.itemData = @{@"sum1":@"1000",@"sum2":@"2000",@"sum3":@"3000",@"sum4":@"4000"};
    // 데이터 구조 변경
    self.itemData = @[
                      @{@"title":@"sum1", @"cost":@"1000", @"imageName":@"island1"},
                      @{@"title":@"sum2", @"cost":@"2000", @"imageName":@"island2"},
                      @{@"title":@"sum3", @"cost":@"3000", @"imageName":@"island3.jpg"},
                      @{@"title":@"sum4", @"cost":@"4000", @"imageName":@"island4.jpg"},
                      ];
    
    self.costData = @[@"10000",@"5000",@"1000"];
    self.itemViews = [[NSMutableArray alloc] init];
    self.inputBtns = [[NSMutableArray alloc] init];
    [self createView];
    [self updateLayout];
}


- (void)createView
{
    //Display
    UIView *itemContainerView = [[UIView alloc] init];
    //    drinkContainerView.backgroundColor = [UIColor yellowColor];
    itemContainerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:itemContainerView];
    self.itemContainerView = itemContainerView;
    
//    NSArray *itemDataKeys = self.itemData.allKeys;
    
    //item View
    for (NSInteger i = 0; i < 4; i++) {
        //base
        ItemView *itemView = [[ItemView alloc] initWithData:self.itemData[i]];
        itemView.backgroundColor = [UIColor grayColor];
        itemView.tag = i;
        // delegate 사용하기 위함
        itemView.delegate = self;
        
        [self.itemContainerView addSubview:itemView];
        [self.itemViews addObject:itemView];
        
        // 구현부를 ItemView로 따로 뻈음
//        itemView.imageName = self.itemImgName[i];
//        itemView.itemTitle = itemDataKeys[i];
//        itemView.itemCost = [self.itemData objectForKey:itemDataKeys[i]];
        
    }
    
    //Display View
    UIView *displayView = [[UIView alloc] init];
    displayView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:displayView];
    self.dispalyView = displayView;
    
    UILabel *displayLb = [[UILabel alloc] init];
    displayLb.text = @"0";
    displayLb.font = [UIFont systemFontOfSize:40];
    displayLb.textAlignment = NSTextAlignmentRight;
    [displayView addSubview:displayLb];
    self.displayLb = displayLb;
    
    //Input View Custom
    UIView *inputViewCustom = [[UIView alloc] init];
    inputViewCustom.backgroundColor = [UIColor redColor];
    [self.view addSubview:inputViewCustom];
    self.inputViewCustom = inputViewCustom;
    
    // 잔액 반환하는 버튼
//    UIButton *regetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    regetBtn.frame = CGRectMake(0, 0, 100, 100);
//    [regetBtn addTarget:self action:@selector(onTouchupInsideItem:) forControlEvents:UIControlEventTouchUpInside];
//    regetBtn.backgroundColor = [UIColor blackColor];
//    [displayView addSubview:regetBtn];
    
    
    for (NSInteger i = 0; i < [self.costData count]; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(onTouchupInsideCoin:) forControlEvents:UIControlEventTouchUpInside];
        btn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|  UIViewAutoresizingFlexibleHeight;
        [btn setTitle:[self.costData objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        btn.tag = i;
        [inputViewCustom addSubview:btn];
        [self.inputBtns addObject:btn];
    }
    
    
}

//UI잡기
- (void)updateLayout
{
    //큰 틀 y좌표
    CGFloat baseViewOffsetY = 45;
    
    //드링크 뷰 하나의 높이는 200정도 잡느다.
    self.itemContainerView.frame = CGRectMake(20, baseViewOffsetY, self.view.frame.size.width - 40, 400+10);
    baseViewOffsetY += self.itemContainerView.frame.size.height + 30;
    
    //item Layout
    const NSInteger baseViewBet = 10;
    for (UIView *itemView in self.itemViews) {
        NSInteger row = itemView.tag/2;
        NSInteger cal = itemView.tag%2;
        CGFloat itemViewWidth = (self.itemContainerView.frame.size.width - 10)/2;
        CGFloat itemViewHeight = (self.itemContainerView.frame.size.height - 10)/2;
        itemView.frame = CGRectMake((itemViewWidth + baseViewBet)*cal,(itemViewHeight + baseViewBet)*row, itemViewWidth,itemViewHeight);
    }
    
    //displayView Layout
    self.dispalyView.frame = CGRectMake(20, baseViewOffsetY, self.view.frame.size.width - 40, 150);
    self.displayLb.frame = CGRectMake(0, 0, self.dispalyView.frame.size.width, self.dispalyView.frame.size.height);
    baseViewOffsetY += self.dispalyView.frame.size.height + 15;
    
    //inputViewCustom Layout
    self.inputViewCustom.frame = CGRectMake(20, baseViewOffsetY, self.view.frame.size.width - 40, 45);
    NSInteger btnWitdh = self.inputViewCustom.frame.size.width/[self.inputBtns count] - 10;
    for (UIView *inputBtn in self.inputBtns) {
        inputBtn.frame = CGRectMake((btnWitdh + 10)*inputBtn.tag, 0, btnWitdh, self.inputViewCustom.frame.size.height);
    }
    
}

////아이템 버튼 클릭시 액션 (델리게이트)
- (void)didSelectedItemView:(ItemView *)itemView {
    // 현재 클릭된 버튼의 금액
//    NSInteger selectTag = sender.tag;
//    // itemData dictionary의 모든 키 값을 가져옴
//    NSArray *dataKeys = self.itemData.allKeys;
//    NSString *dataKey = [dataKeys objectAtIndex:selectTag];
//    NSString *costStr = [self.itemData objectForKey:dataKey];

    // 버튼마다 property 가 할당되었기 때문에 객체한테 직접 물어봐도 된다 (이것이 객체지향!)
    // 전체 데이터에서 가져오는 것이 아니라, 각각 분화된 객체로부터 데이터를 가져옴. 각각은 전체를 고려하지 않아도 됨.
    NSString *title = [itemView getTitle];
    NSInteger cost = [itemView getCost];
    
    // remained 보다 상품 가격이 작거나 같아야 한다.
    if (self.remainedMoney >= cost) {
        // 디스플레이 업데이트
        self.remainedMoney -= cost;
        self.displayLb.text = [NSString stringWithFormat:@"%ld", _remainedMoney];
        
        // alert 띄우기
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"빙고" message:[NSString stringWithFormat:@"%@가 나왔습니다.", title] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okBtn];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        // 잔액이 부족합니다. alert 띄우기
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"잔액부족" message:@"잔액이 부족합니다." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okBtn];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

////아이템 버튼 클릭시 액션
//- (void)onTouchupInsideItem:(UIButton *)sender
//{
//}

//돈
- (void)onTouchupInsideCoin:(UIButton *)sender
{
    // 내가 누른 버튼의 태그 값을 가져옴
    // 현재 클릭된 버튼의 가격
    NSInteger selectTag = sender.tag;
    NSString *costStr = [self.costData objectAtIndex:selectTag];
    
    // 디스플레이 뷰에 추가하기
    self.remainedMoney += costStr.integerValue;
    self.displayLb.text = [NSString stringWithFormat:@"%ld", _remainedMoney];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
