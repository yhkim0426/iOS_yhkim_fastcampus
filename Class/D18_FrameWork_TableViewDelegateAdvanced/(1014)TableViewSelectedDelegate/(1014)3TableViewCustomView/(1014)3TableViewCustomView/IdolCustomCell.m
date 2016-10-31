//
//  IdolCustomCell.m
//  (1014)3TableViewCustomView
//
//  Created by Nexus_MYT on 2016. 10. 14..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//


// 커스텀 뷰 만들기 예제
#import "IdolCustomCell.h"

@interface IdolCustomCell()

@property UIImageView *backgroundImage;
@property UILabel *titleLb;
@property UIView *coverView;

@end

@implementation IdolCustomCell

// Nib file 은 안만들었기 때문에 필요 없다
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

// frame 사이즈가 변경될 때마다 불린다 -> 잘 써야 하는 메서드!
// cell 정보, alpha 값이 변경될때마다 불린다. 엄청 많이 불린다.
- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"in layoutSubView: %lf", self.frame.size.height);
    [self updateLayout];
}

- (void)createView {
//    self.backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
    // cell 이 생성된 후에 cell height 가 생성되는 문제가 있어서 updateLayout 을 통해 사이즈를 다시 맞춰줌
    self.backgroundImage = [[UIImageView alloc] init];
    self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    // 넘어가는 것을 잘라준다
    self.backgroundImage.clipsToBounds = YES;
    // self.contentView 는 row 의 뷰를 의미함. 거기에 addSubview 를 해야 움직인다
    [self.contentView addSubview:self.backgroundImage];
    
    self.coverView = [[UIView alloc] init];
    self.coverView.backgroundColor = [[UIColor alloc] initWithRed:30.f/255 green:30.f/255 blue:30.f/255 alpha:0.5];
    // == coverView.backgroundColor = [UIColor colorWithRed:30.f/255 green:30.f/255 blue:30.f/255 alpha:0.5];
    [self.backgroundImage addSubview:self.coverView];
    
    self.titleLb = [[UILabel alloc] init];
    self.titleLb.font = [UIFont boldSystemFontOfSize:40];
    self.titleLb.textAlignment = NSTextAlignmentCenter;
    self.titleLb.textColor = [UIColor whiteColor];
    [self.coverView addSubview:self.titleLb];

}

- (void)updateLayout {
    self.backgroundImage.frame = self.bounds;
    self.coverView.frame = CGRectMake(10, 10, self.backgroundImage.frame.size.width-20, self.backgroundImage.frame.size.height-20);
    self.titleLb.frame = CGRectMake(0, 20, self.coverView.frame.size.width, self.coverView.frame.size.height);
}

// 백그라운드 이미지 설정
- (void)setBackgroundImageName:(NSString *)imageName {
    self.backgroundImage.image = [UIImage imageNamed:imageName];
}

- (void)setTitle:(NSString *)title {
    self.titleLb.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
