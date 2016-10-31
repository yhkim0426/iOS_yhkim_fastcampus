//
//  UIViewController2.m
//  (1024)NibFileForViewController
//
//  Created by Nexus_MYT on 2016. 10. 24..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "UIViewController2.h"

@interface UIViewController2 ()

@end

@implementation UIViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"xib: view did load");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"xib: view will layout subview");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"xib: view did layout subview");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"xib: view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"xib: view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"xib: view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"xib: view did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchupInsideDismissButton:(id)sender {
    
    // 버튼을 눌렀을 때 dismiss 되도록 설정
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
