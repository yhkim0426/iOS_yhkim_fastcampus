//
//  ItemView.m
//  (1011)DelegateUsageForVendingMachine
//
//  Created by Nexus_MYT on 2016. 10. 11..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ItemView.h"

@interface ItemView()


@property NSDictionary *data;
@property NSString *imageName;

@end

@implementation ItemView

- (instancetype)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.data = data;
        [self createView];
    }
    return self;
}

- (void)createView {
    //imageView
    UIImageView *img = [[UIImageView alloc] init];
    img.frame = CGRectMake(0, 0, self.frame.size.width, 200 - 35);
    // 상위 뷰가 변할때 하위 뷰가 같이 변하도록 하게 하기 위해서 autoresizeingmask 사용함
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    img.image = [UIImage imageNamed:[self.data objectForKey:@"imageName"]];
    [self addSubview:img];
    
    //title
    UILabel *titleLb = [[UILabel alloc] init];
    titleLb.frame = CGRectMake(0, 200 - 35, self.frame.size.width, 20);
    titleLb.text = [self.data objectForKey:@"title"];
    titleLb.font = [UIFont boldSystemFontOfSize:16];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:titleLb];
    //cost
    UILabel *costLB = [[UILabel alloc] init];
    costLB.frame = CGRectMake(0, 200 - 15, self.frame.size.width, 15);
    costLB.text = [self.data objectForKey:@"cost"];
    costLB.font = [UIFont systemFontOfSize:15];
    costLB.textAlignment = NSTextAlignmentCenter;
    costLB.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:costLB];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [btn addTarget:self action:@selector(onTouchupInsideItem:) forControlEvents:UIControlEventTouchUpInside];
    btn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:btn];
}

- (void)onTouchupInsideItem:(UIButton *)sender {
    
    // nil 이 아닐 경우에만 요청하는 if 문. 안전성을 위해서 쓰는 코드. 오타가 나거나 하면 앱이 뻗을 수 있기 때문. 
    if ([self.delegate respondsToSelector:@selector(didSelectedItemView:)]) {
        [self.delegate didSelectedItemView:self];
    }
}

- (NSString *)getTitle {
    return [self.data objectForKey:@"title"];
}

- (NSInteger)getCost {
    return [[self.data objectForKey:@"cost"] integerValue];
}

@end
