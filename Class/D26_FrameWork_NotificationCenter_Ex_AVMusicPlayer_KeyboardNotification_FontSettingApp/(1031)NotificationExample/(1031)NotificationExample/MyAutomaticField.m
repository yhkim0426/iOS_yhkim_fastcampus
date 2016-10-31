//
//  MyAutomaticField.m
//  (1031)NotificationExample
//
//  Created by Nexus_MYT on 2016. 10. 31..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "MyAutomaticField.h"

@interface MyAutomaticField () <UITextFieldDelegate>
@end

@implementation MyAutomaticField

///! storyboard 에서 객체가 생성될 때 이 메서드를 통해서 초기화 해주면 된다
- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"textField awake from Nib");
    
    if ([self delegate] == nil) {
        [self setDelegate:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //! return 키 눌렀을 떄 키보드 내려감
    [textField endEditing:YES];
    return YES;
}

@end
