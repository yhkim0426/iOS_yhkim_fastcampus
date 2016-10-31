
//  ViewController.m
//  (1027)MyImagePicker
//
//  Created by Nexus_MYT on 2016. 10. 27..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *myGestureRecognizer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // imageView userInteraction 이 처음에 NO 로 되어 있다!
    self.imageView.userInteractionEnabled = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedViewAction:(id)sender {
    NSLog(@"tapped");
    [self showAlertController:UIAlertControllerStyleActionSheet];
}

- (void)showAlertController:(UIAlertControllerStyle)style {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"사진앨범"
                                                                             message:@"사진앨범 선택"
                                                                      preferredStyle:style];
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"라이브러리"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                         NSLog(@"library");
                                                         }];
    [alertController addAction:libraryAction];
    
    UIAlertAction *pictureAlbumAction = [UIAlertAction actionWithTitle:@"사진앨범"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              NSLog(@"pictures");
                                                          }];
    [alertController addAction:pictureAlbumAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                                 style:UIAlertActionStyleCancel
                                                               handler:^(UIAlertAction * _Nonnull action) {
                                                                   NSLog(@"cancel");
                                                               }];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
