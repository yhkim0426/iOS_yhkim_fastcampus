//
//  ItemView.h
//  (1011)DelegateUsageForVendingMachine
//
//  Created by Nexus_MYT on 2016. 10. 11..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ItemViewDelegate;
@interface ItemView : UIView

@property (nonatomic, weak) id <ItemViewDelegate> delegate;
- (instancetype)initWithData:(NSDictionary *)data;

- (NSString *)getTitle;
- (NSInteger)getCost;

@end

@protocol ItemViewDelegate <NSObject>

- (void)didSelectedItemView:(ItemView *)itemView;

@end
