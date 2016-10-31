
#import "ViewController.h"

@interface ViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property UIImageView *imageViewForPicture;
@property NSUserDefaults *userDefault;

@end

@implementation ViewController

- (void)showImagePicker:(UIImagePickerControllerSourceType)type {
    // UIImagePickerController
    
    // modal - present
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:type];
    [picker setAllowsEditing:YES];
    [picker setMediaTypes:[UIImagePickerController availableMediaTypesForSourceType:type]];
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (void)onTapImageView:(UITapGestureRecognizer *)sender {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"사진 가져오기"
                                                                         message:@"사진을 가져올 소스 선택"
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak ViewController *weakSelf = self;
    
    void (^actionHandler)(UIAlertAction * _Nonnull action) = ^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if ([[action title] isEqualToString:@"사진 앨범"]) {
            
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            
        } else if ( [[action title] isEqualToString:@"카메라"]) {
            
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
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

#pragma mark - UIImagePickerController Delegate

// 사용자가 선택을 취소하면 picker 를 dismiss 한다
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 사용자가 선택을 완료한 경우
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // info 를 로그로 찍어보지 말고 문서를 읽어보라!
    UIImage *pickedImage = info[UIImagePickerControllerEditedImage];
    
    if (pickedImage == nil) {
        pickedImage = info[UIImagePickerControllerOriginalImage];
    }
    
    if (pickedImage == nil) {
        NSLog(@"사진이 없습니다.");
        return;
    }
    
    if (pickedImage != nil) {
    // 사진을 userDefault 에 저장 -> binary data 로 변경해서.
//    NSData *imageData = UIImagePNGRepresentation(pickedImage);
        NSData *imageData = UIImageJPEGRepresentation(pickedImage, 1.0);
//    [self.userDefault setObject:imageData forKey:@"picture"];
//    [self.userDefault synchronize];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:imageData forKey:@"imageData"];
        [userDefault synchronize];
    }
    
//    [[self imageViewForPicture] setImage:pickedImage];
    
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   // 사진을 가져왔습니다!
                               }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 이미지 불러오기가 실패한 이유 -> 싱글턴의 특성
//    [self.userDefault synchronize];
//    
//    if ([self.userDefault objectForKey:@"picture"] == nil) {
//        self.userDefault = [NSUserDefaults standardUserDefaults];
//        NSLog(@"generated");
//    } else {
//        NSLog(@"gettedImage");
//        UIImage *gettedImage = [UIImage imageWithData:[self.userDefault objectForKey:@"picture"]];
//        [self.imageViewForPicture setImage:gettedImage];
//    }
    
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
    UIImage *image = [UIImage imageWithData:imageData];
    
    self.imageViewForPicture = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.imageViewForPicture setImage:image];
//    [self.imageViewForPicture setImage:gettedImage];
    [self.imageViewForPicture setUserInteractionEnabled:YES];
    [self.view addSubview:self.imageViewForPicture];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(onTapImageView:)];
    [self.imageViewForPicture addGestureRecognizer:tapRecognizer];
    
    // User Default 가 변경되었을 때 Noti 를 날린다
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didUserDefaultChange:) name:NSUserDefaultsDidChangeNotification object:nil];
    
}

// 노티를 수신받았을 떄 동작할 메서드
- (void)didUserDefaultChange:(NSNotification *)noti {
    NSLog(@"user default changed");
    
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
    UIImage *image = [UIImage imageWithData:imageData];
    [self.imageViewForPicture setImage:image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
