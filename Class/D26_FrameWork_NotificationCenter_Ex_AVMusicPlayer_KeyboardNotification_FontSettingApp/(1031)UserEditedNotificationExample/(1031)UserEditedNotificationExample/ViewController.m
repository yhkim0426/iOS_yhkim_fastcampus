//
//  ViewController.m
//  (1031)UserEditedNotificationExample
//
//  Created by Nexus_MYT on 2016. 10. 31..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLB1;
@property (weak, nonatomic) IBOutlet UILabel *resultLB2;
@property (weak, nonatomic) IBOutlet UILabel *resultLB3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveFontSettingValueChanged:) name:DidSettingChanged object:nil];
}

- (void)didReceiveFontSettingValueChanged:(NSNotification *)noti {
    self.resultLB1.font = noti.userInfo[@"fontSize"];
    self.resultLB1.textColor = noti.userInfo[@"fontColor"];
    
    self.resultLB2.font = noti.userInfo[@"fontSize"];
    self.resultLB2.textColor = noti.userInfo[@"fontColor"];
    
    self.resultLB3.font = noti.userInfo[@"fontSize"];
    self.resultLB3.textColor = noti.userInfo[@"fontColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
