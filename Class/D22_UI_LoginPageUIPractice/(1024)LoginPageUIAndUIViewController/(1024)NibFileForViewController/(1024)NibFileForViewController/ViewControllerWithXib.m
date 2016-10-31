//
//  ViewControllerWithXib.m
//  (1024)NibFileForViewController
//
//  Created by Nexus_MYT on 2016. 10. 24..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewControllerWithXib.h"
#import "UIViewController2.h"

@interface ViewControllerWithXib ()

@end

@implementation ViewControllerWithXib

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"navi: view did load");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"navi: view will layout subview");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"navi: view did layout subview");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"navi: view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"navi: view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"navi: view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"navi: view did disappear");
}

- (IBAction)onTouchupInsideNextButton:(id)sender {
    // 객체 만들기
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController2 *vc2 = [storyBoard instantiateViewControllerWithIdentifier:@"UIViewController2"];
    
    // transition style
//    [vc2 setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
//    [vc2 setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//    [vc2 setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
//    // present
//    [self presentViewController:vc2 animated:YES completion:nil];
    [self.navigationController pushViewController:vc2 animated:YES];
    
}

@end
