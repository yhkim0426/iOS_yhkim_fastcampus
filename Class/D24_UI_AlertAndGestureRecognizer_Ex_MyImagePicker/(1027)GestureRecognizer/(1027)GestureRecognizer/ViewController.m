//
//  ViewController.m
//  (1027)GestureRecognizer
//
//  Created by Nexus_MYT on 2016. 10. 27..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *coordinator;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *myRecognizer;

@property NSInteger tapNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapNumber = 0;
    self.coordinator.text = @"";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapGestureRecognition:(id)sender {
    self.tapNumber += 1;
    CGPoint nowPoint = [self.myRecognizer locationInView:self.view];
//    NSLog(@"(%lf, %lf), %ld", nowPoint.x, nowPoint.y, self.tapNumber );
    self.coordinator.text = [NSString stringWithFormat:@"(%.lf %.lf), %ld", nowPoint.x, nowPoint.y, self.tapNumber];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

@end
