//
//  ViewController.m
//  (1025)NavigationBarCustomize
//
//  Created by Nexus_MYT on 2016. 10. 25..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"
#import "WingNaviBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES];
    
    WingNaviBar *naviBar = [[WingNaviBar alloc] initWithType:WingNaviBarTypeAdd ViewController:self target:self action:nil];
    
    
////    [self.navigationController setNavigationBarHidden:YES];
//
//    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [itemButton addTarget:self action:@selector(onSelectedButtonItem:) forControlEvents:UIControlEventTouchUpInside];
//    [itemButton setFrame:CGRectMake(10, 10, 100, 44)];
////    itemButton.backgroundColor = [UIColor blackColor];
////    [itemButton setTitle:@"custom" forState:UIControlStateNormal];
//    [itemButton setImage:[UIImage imageNamed:@"ic_keyboard_arrow_left"] forState:UIControlStateNormal];
////    [itemButton setTintColor:[UIColor whiteColor]];
////    [itemButton setBackgroundColor:[UIColor redColor]];
//    
//    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
//    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"hihi" style:UIBarButtonItemStylePlain target:self action:@selector(onSelectedItem:)];
//    
//    self.navigationItem.rightBarButtonItem = item;
//    self.navigationItem.leftBarButtonItem = customItem;
////    self.navigationItem.backBarButtonItem = customItem;
    
}

- (void)onSelectedButtonItem:(id)sender {
    
}

- (void)onSelectedItem:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
