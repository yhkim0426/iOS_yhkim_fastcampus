//
//  MyViewController.m
//  (1017)ViewControllerConnectStoryBoard
//
//  Created by Nexus_MYT on 2016. 10. 17..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property (nonatomic) IBOutlet UILabel *myLB;
@property (nonatomic) IBOutlet UIButton *myBtn;
@property (nonatomic) IBOutlet UISegmentedControl *mySegmentCtrl;
@property (nonatomic) IBOutlet UITextField *myTF;
@property (nonatomic) IBOutlet UISlider *mySlider;
@property (nonatomic) IBOutlet UISwitch *mySwitch;

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UISlider *redValue;
@property (weak, nonatomic) IBOutlet UISlider *greenValue;
@property (weak, nonatomic) IBOutlet UISlider *blueValue;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.myLB.text = @"test";
//    self.myLB.textColor = [UIColor redColor];
//    
//    [self.myBtn addTarget:self action:@selector(btnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    self.redValue.tintColor = [UIColor redColor];
    self.greenValue.tintColor = [UIColor greenColor];
    self.blueValue.tintColor = [UIColor blueColor];
    
//    self.redValue
}

- (IBAction)btnTouchUpInside:(id)sender {
    // 만약 버튼이 아닌 다른 게 들어왔을 때는 쉽사리 죽을 수 있다.
    // 그래서 확인을 한 번 해주고 돌리면 안전하다
    
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = sender;
        NSLog(@"btn: %@, tag: %ld clicked", button.titleLabel.text, button.tag);
    } else {
        NSLog(@"버튼이 아닙니다");
    }
}

- (IBAction)sliderValueChanged:(id)sender {
//    if ([sender isKindOfClass:[UISlider class]]) {
//        UISlider *slider = sender;
//        NSLog(@"slider value : %f", slider.value);
//    }
    
    self.colorView.backgroundColor = [UIColor colorWithRed:self.redValue.value green:self.greenValue.value blue:self.blueValue.value alpha:1];
    
}

- (IBAction)segmentSelectionChanged:(id)sender {
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segmentControl = sender;
        NSLog(@"segment control: %ld", segmentControl.selectedSegmentIndex);
    }
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
