//
//  ViewController.m
//  (1031)NSNotificationKeyboard
//
//  Created by Nexus_MYT on 2016. 10. 31..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *keyboardStatusLB;
@property (weak, nonatomic) IBOutlet UILabel *keyboardFrameSizeLB;
@property (weak, nonatomic) IBOutlet UILabel *keyboardOriginLB;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.delegate = self;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveKeyboardStatusChanged:) name:UIKeyboardDidHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveKeyboardStatusChanged:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveKeyboardStatusChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (void)didReceiveKeyboardStatusChanged:(NSNotification *)noti {
    if ([noti.name isEqualToString:UIKeyboardDidShowNotification]) {
        self.keyboardStatusLB.text = @"키보드 있음";
    } else if ([noti.name isEqualToString:UIKeyboardDidHideNotification]) {
        self.keyboardStatusLB.text = @"키보드 없음";
    }
    
    if ([noti.name isEqualToString:UIKeyboardDidChangeFrameNotification]) {
        NSValue *keyboardFrameBegin = noti.userInfo[UIKeyboardFrameBeginUserInfoKey];
        CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
        
        self.keyboardFrameSizeLB.text = [NSString stringWithFormat:@"(%.lf, %.lf),",keyboardFrameBeginRect.origin.x,keyboardFrameBeginRect.origin.y];
        self.keyboardOriginLB.text = [NSString stringWithFormat:@"(%.lf, %.lf)",keyboardFrameBeginRect.size.width,keyboardFrameBeginRect.size.height];
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //! return 키 눌렀을 떄 키보드 내려감
    [textField endEditing:YES];
    return YES;
}

@end
