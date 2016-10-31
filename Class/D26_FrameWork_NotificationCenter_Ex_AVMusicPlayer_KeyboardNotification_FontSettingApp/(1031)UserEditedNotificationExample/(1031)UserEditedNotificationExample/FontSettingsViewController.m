//
//  FontSettingsViewController.m
//  (1031)UserEditedNotificationExample
//
//  Created by Nexus_MYT on 2016. 10. 31..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "FontSettingsViewController.h"

@interface FontSettingsViewController () 
@property (weak, nonatomic) IBOutlet UILabel *settingResultLB;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fontSizeChooseSegment;
@property (weak, nonatomic) IBOutlet UIButton *goToMainButton;

@property CGFloat red;
@property CGFloat green;
@property CGFloat blue;

@end

@implementation FontSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
//    NSLog(@"%ld",sender.tag);
    
    switch (sender.tag) {
        case 0:
            self.red = sender.value;
            break;
        case 1:
            self.green = sender.value;
            break;
        case 2:
            self.blue = sender.value;
            break;
    }
    self.settingResultLB.textColor = [UIColor colorWithRed:self.red
                                                     green:self.green
                                                      blue:self.blue
                                                     alpha:1];
}

- (IBAction)segmentButtonValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.settingResultLB.font = [UIFont systemFontOfSize:20];
            break;
        case 1:
            self.settingResultLB.font = [UIFont systemFontOfSize:40];
            break;
        case 2:
            self.settingResultLB.font = [UIFont systemFontOfSize:60];
            break;
    }
}

- (IBAction)touchupInsideButton:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:DidSettingChanged
                                                        object:self
                                                      userInfo:@{@"fontSize":self.settingResultLB.font, @"fontColor":self.settingResultLB.textColor}];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
