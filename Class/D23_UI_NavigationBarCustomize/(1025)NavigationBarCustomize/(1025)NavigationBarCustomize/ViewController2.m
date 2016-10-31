//
//  ViewController2.m
//  (1025)NavigationBarCustomize
//
//  Created by Nexus_MYT on 2016. 10. 25..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"ViewDidLoad:VC2");
    
//    [self.navigationController setNavigationBarHidden:YES];
    
//    UITabBarController *item = [[UITabBarController alloc] init];
//    item.tabBarItem.image = [UIImage imageNamed:@"ic_search"];
    self.tabBarItem.image = [UIImage imageNamed:@"ic_search"];
    self.tabBarItem.title = @"test";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
