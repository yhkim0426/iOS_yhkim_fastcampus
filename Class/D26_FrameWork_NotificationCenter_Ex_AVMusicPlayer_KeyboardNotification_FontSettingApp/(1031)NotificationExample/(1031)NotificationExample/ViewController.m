//
//  ViewController.m
//  (1031)NotificationExample
//
//  Created by Nexus_MYT on 2016. 10. 31..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

///! storyboard 에서 생성될 때 호출
- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awake from Nib");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[MySingleton sharedInstance] justMethod];
    
    NSLog(@"%@", MyName);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
