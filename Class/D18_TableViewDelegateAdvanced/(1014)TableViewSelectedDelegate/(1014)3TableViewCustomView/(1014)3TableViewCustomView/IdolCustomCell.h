//
//  IdolCustomCell.h
//  (1014)3TableViewCustomView
//
//  Created by Nexus_MYT on 2016. 10. 14..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IdolCustomCell : UITableViewCell

- (void)setBackgroundImageName:(NSString *)imageName;
- (void)setTitle:(NSString *)title;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;

@end