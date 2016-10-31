//
//  ViewController.m
//  (1028)UIImagePickerPractice
//
//  Created by Nexus_MYT on 2016. 10. 28..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // NSUerDefaults 는 Singleton 이다
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
    UIImage *image = [UIImage imageWithData:imageData];
    [self.imageView setImage:image];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTabImageView:(id)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"사진 가져오기"
                                                                         message:@"사진을 가져올 소스 선택"
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak ViewController *weakSelf = self;
    
    // action 을 받아서 weakSelf 에 ImagePicker 올리는 일을 함
    void (^actionHandler)(UIAlertAction * _Nonnull action) = ^(UIAlertAction * _Nonnull action) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if ([action.title isEqualToString:@"사진 앨범"]) {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        } else if ([action.title isEqualToString:@"카메라"]) {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        
        [weakSelf showImagePicker:sourceType];
    };
    
    NSArray *actionTitle = @[@"사진 라이브러리", @"사진앨범", @"카메라", @"취소"];
    
    for (NSString *title in actionTitle) {
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        
        if ([title isEqualToString:@"취소"]) {
            style = UIAlertActionStyleCancel;
        } else if ([title isEqualToString:@"카메라"]) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) {
                continue;
            }
            style = UIAlertActionStyleDestructive;
        }
        UIAlertAction *action = [UIAlertAction actionWithTitle:title
                                                         style:style
                                                       handler:actionHandler];
        
        [actionSheet addAction:action];
    }
    
    [self presentViewController:actionSheet
                       animated:YES
                     completion:nil];
}

/// sourceType 받아서 edit 가능하게 해주는 메서드
- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:sourceType];
    [picker setAllowsEditing:YES];
    [picker setMediaTypes:[UIImagePickerController availableMediaTypesForSourceType:sourceType]];
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark = UIImagePickerController Delegate

// 사용자가 선택을 취소하면 picker 를 dismiss 한다
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 사용자가 선택을 완료한 경우
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Dictionary 에서 key 값을 저렇게 편하게 가져오는 방법이 있었네, 참고합시다
    UIImage *pickedImage = info[UIImagePickerControllerEditedImage];
    
    if (pickedImage == nil) {
        pickedImage = info[UIImagePickerControllerOriginalImage];
    }
    
    if (pickedImage == nil) {
        NSLog(@"사진이 없습니다.");
        return;
    }
    
    if (pickedImage != nil) {
        NSData *imageData = UIImagePNGRepresentation(pickedImage);
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:imageData forKey:@"imageData"];
        [userDefault synchronize];
    }
    
    [self.imageView setImage:pickedImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        // 사진을 가져왔습니다!
    }];
}

@end
