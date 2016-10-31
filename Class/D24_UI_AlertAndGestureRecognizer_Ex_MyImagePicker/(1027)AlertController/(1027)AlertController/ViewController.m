//
//  ViewController.m
//  (1027)AlertController
//
//  Created by Nexus_MYT on 2016. 10. 27..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonUpper;
@property (weak, nonatomic) IBOutlet UIButton *buttonLower;

@end

@implementation ViewController

- (IBAction)buttonUpperButtonTouchupInsideButton:(id)sender {
    [self showAlertController:UIAlertControllerStyleAlert];
}

- (IBAction)buttonLowerButtonTouchupInsideButton:(id)sender {
    [self showAlertController:100];
}

- (void)showAlertController:(UIAlertControllerStyle)style {
    
    switch (style) {
        case UIAlertControllerStyleAlert:
        case UIAlertControllerStyleActionSheet:
            NSLog(@"스타일 확인");
            break;
            
        default:
            NSLog(@"스타일 잘못 입력");
            return;
            break;
    }
    
    void (^handlerBlock)(UIAlertAction *) = ^(UIAlertAction * _Nonnull action) {
        
        if ([action.title isEqualToString:@"취소"]) {
            NSLog(@"취소가 선택되었습니다.");
        } else if ([action.title isEqualToString:@"확인"]) {
            NSLog(@"확인이 선택되었습니다.");
        } else if ([action.title isEqualToString:@"파괴"]) {
            NSLog(@"파괴가 선택되었습니다.");
        }
        
//        switch (action.style) {
        switch ([action style]) {
            case UIAlertActionStyleCancel:
                NSLog(@"사용자가 취소했습니다.");
                break;
            case UIAlertActionStyleDefault:
                NSLog(@"사용자가 확인했습니다.");
                break;
            case UIAlertActionStyleDestructive:
                NSLog(@"사용자가 파괴했습니다.");
                break;
        }
    };
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                             message:@"Alert Controller를 사용했습니다"
                                                                      preferredStyle:style];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                           style:UIAlertActionStyleCancel
//                                                         handler:^(UIAlertAction * _Nonnull action) {
//                                                             NSLog(@"cancel");
//                                                             }];
                                                         handler:handlerBlock];
    
    [alertController addAction:cancelAction];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
//                                                     handler:^(UIAlertAction * _Nonnull action) {
//                                                         NSLog(@"ok");
//                                                         }];
                                                     handler:handlerBlock];
    [alertController addAction:okAction];
    
    UIAlertAction *destructAction = [UIAlertAction actionWithTitle:@"파괴"
                                                             style:UIAlertActionStyleDestructive
//                                                           handler:^(UIAlertAction * _Nonnull action) {
//                                                               NSLog(@"destruct");
//                                                               NSLog(@"%@", [alertController actions]);
//                                                               }];
                                                           handler:handlerBlock];
                                     
    [alertController addAction:destructAction];
    
    [self presentViewController:alertController animated:YES completion:^{
        NSLog(@"화면 전환을 마쳤습니다.");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
