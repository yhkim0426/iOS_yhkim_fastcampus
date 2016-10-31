//
//  ViewController2.m
//  (1024)LoginPageUIAndUIViewController
//
//  Created by Nexus_MYT on 2016. 10. 24..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchupInsideButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
