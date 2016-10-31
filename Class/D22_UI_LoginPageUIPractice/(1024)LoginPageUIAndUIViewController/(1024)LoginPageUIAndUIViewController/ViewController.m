//
//  ViewController.m
//  (1024)LoginPageUIAndUIViewController
//
//  Created by Nexus_MYT on 2016. 10. 24..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchupInsideButton:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] ;
    ViewController2 *vc2 = [storyBoard instantiateViewControllerWithIdentifier:@"SignupPage"];
    
    [self.navigationController pushViewController:vc2 animated:YES];
}

@end
