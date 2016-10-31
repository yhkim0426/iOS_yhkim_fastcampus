//
//  ViewController.m
//  (1018)AutoLayout
//
//  Created by Nexus_MYT on 2016. 10. 18..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *layoutRect;
@property (weak, nonatomic) IBOutlet UIStepper *stepperView;
@property (weak, nonatomic) IBOutlet UILabel *myLB;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // status bar 를 찾아주는 메서드. 그냥 20을 줘버리면 통화가 왔을때나 statusBar 의 길이가 바뀔 때 레이아웃이 깨진다
    [[UIApplication sharedApplication] statusBarFrame];
}
- (IBAction)stepperViewValueChanged:(id)sender {
    
//    self.layoutRect = (UIStepper *)sender 
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
