//
//  TitleLabel.m
//  (1020)LifeCycleOfApplication
//
//  Created by Nexus_MYT on 2016. 10. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "TitleLabel.h"

@implementation TitleLabel

// 동일한 스타일의 커스텀 레이블을 만들어 쓰는 경우, 이렇게 초기화 해서 시작하면 코드 양이 줄어든다. 
- (instancetype)initWithTitle:(NSString *)title
                        frame:(CGRect)frame
                    textColor:(UIColor *)textColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont boldSystemFontOfSize:30];
        self.textColor = textColor;
        self.text = title;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
