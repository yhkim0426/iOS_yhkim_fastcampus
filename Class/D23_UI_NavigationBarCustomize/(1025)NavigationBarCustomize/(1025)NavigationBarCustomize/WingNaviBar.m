//
//  WingNaviBar.m
//  (1025)NavigationBarCustomize
//
//  Created by Nexus_MYT on 2016. 10. 25..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "WingNaviBar.h"

@implementation WingNaviBar
- (instancetype)initWithType:(WingNaviBarType)type ViewController:(UIViewController *)vc target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        
        
        if (vc != nil) {
            self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
            [vc.view addSubview:self];
        }
        [self createNavibarWithType:type target:(id)target action:(SEL)action];
    }
    return self;
}

- (void)createNavibarWithType:(WingNaviBarType)type target:(id)target action:(SEL)action {
    //20 point is status bar
    const NSInteger naviStartPointY = 20 + 5;
    self.backgroundColor = [[UIColor alloc] initWithRed:114.f/255.f green:244.f/255.f blue:6.f/255.f alpha:1];
    
    CGSize itemSize = CGSizeMake(40, 30);
    //leftBtn
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(10, naviStartPointY, itemSize.width, itemSize.height)];
    logo.image = [UIImage imageNamed:@"logo.png"];
    [self addSubview:logo];
    
    switch (type) {
        case WingNaviBarTypeNormal:
            
            break;
        case WingNaviBarTypeAdd:
        {
            UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 10 - itemSize.width, naviStartPointY , itemSize.width, itemSize.height)];
            [rightBtn setTitle:@"추가" forState:UIControlStateNormal];
            [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:rightBtn];
        }
            break;
            
        default:
            break;
    }
    
    //right btn
}

@end
