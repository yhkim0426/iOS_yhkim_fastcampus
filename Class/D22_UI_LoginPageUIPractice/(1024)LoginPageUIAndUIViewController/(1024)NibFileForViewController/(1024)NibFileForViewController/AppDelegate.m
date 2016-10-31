//
//  AppDelegate.m
//  (1024)NibFileForViewController
//
//  Created by Nexus_MYT on 2016. 10. 24..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIViewController2.h"
#import "ViewControllerWithXib.h"

@interface AppDelegate ()

@end

// 1. setting 에서 main interface 삭제

@implementation AppDelegate

// 스토리뷰를 전혀 쓰지 않고 코드로 UI 만드는 법 -> xib (커스텀 뷰를 만들 수도 있다)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 스토리 보드를 통해 View Controller 를 만드는 경우
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    // storyBoard 내에서 화살표로 지정된 뷰를 가져온다
//    ViewController *vc = [storyBoard instantiateInitialViewController];
    ViewController *vc2 = [storyBoard instantiateViewControllerWithIdentifier:@"UIViewController2"];
    
    // Navigation View Controller 설정
//    UINavigationController *vc = [storyBoard instantiateInitialViewController];
    
    
    // xib 를 이용해서 View Controller 를 만드는 경우
    // xib file 은 객체생성방식이 좀 다르다
    ViewControllerWithXib *vcWithX = [[ViewControllerWithXib alloc] init];
//    ViewControllerWithXib *vcWithX = [[ViewControllerWithXib alloc] initWithNibName:@"ViewControllerWithXib" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vcWithX];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = vc;
//    self.window.rootViewController = vc2;
//    self.window.rootViewController = vcWithX;
    
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
