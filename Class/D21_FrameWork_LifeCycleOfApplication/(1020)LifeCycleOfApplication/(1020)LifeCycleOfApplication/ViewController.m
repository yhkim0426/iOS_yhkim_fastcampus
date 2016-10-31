//
//  ViewController.m
//  (1020)LifeCycleOfApplication
//
//  Created by Nexus_MYT on 2016. 10. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"
#import "TitleLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    
    TitleLabel *title1 = [[TitleLabel alloc] initWithTitle:@"Title1" frame:CGRectMake(30, 30, 200, 50) textColor:[UIColor blueColor]];
    [self.view addSubview:title1];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
