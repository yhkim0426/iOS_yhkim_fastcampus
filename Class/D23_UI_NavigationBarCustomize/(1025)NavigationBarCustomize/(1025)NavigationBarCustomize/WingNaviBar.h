//
//  WingNaviBar.h
//  (1025)NavigationBarCustomize
//
//  Created by Nexus_MYT on 2016. 10. 25..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    WingNaviBarTypeNormal = 0,
    WingNaviBarTypeAdd = 1
}WingNaviBarType;

@interface WingNaviBar : UIView

- (instancetype)initWithType:(WingNaviBarType)type ViewController:(UIViewController *)vc target:(id)target action:(SEL)action;

@end
