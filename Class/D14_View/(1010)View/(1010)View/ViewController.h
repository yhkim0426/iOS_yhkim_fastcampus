//
//  ViewController.h
//  (1010)View
//
//  Created by Nexus_MYT on 2016. 10. 10..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol testProtocol;
@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,weak) id <testProtocol> delegate;

@end

@protocol testProtocol <NSObject>

- (void)testMethod;

@end

