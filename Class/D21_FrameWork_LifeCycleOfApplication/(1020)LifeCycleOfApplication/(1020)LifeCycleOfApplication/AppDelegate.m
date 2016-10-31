//
//  AppDelegate.m
//  (1020)LifeCycleOfApplication
//
//  Created by Nexus_MYT on 2016. 10. 20..
//  Copyright © 2016년 Nexus_MYT. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 스토리보드 없이 코드만으로 앱 만들어보기
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // rootViewController 를 생성해서 회색으로 배경색을 줌
//    ViewController *rootViewController = [[ViewController alloc] init];
//    rootViewController.view.backgroundColor = [UIColor lightGrayColor];
//
    
    // 스토리보드와 루트뷰 컨트롤러 포인터 생성
    UIStoryboard *firstStoryboard = nil;
    UIViewController *rootViewController = nil;
    
    // 로그인 여부에 따라 다른 스토리보드를 가지고 올 수 있다.
    BOOL isUserLogined = NO;
    
    if (isUserLogined) {
        // YES 라면 Main 이라는 이름의 스토리보드를 가져옴
        firstStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    } else {
        // NO 라면 MyStoryboard 라는 이름의 스토리보드를 가져옴
        firstStoryboard = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
    }
    
    // 가져온 스토리보드를 루트 뷰 컨트롤러와 연결
    rootViewController = [firstStoryboard instantiateInitialViewController];
    
    // 윈도우 객체 생성
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 윈도우 객체 위에 루트 뷰 컨트롤러 지정
    [self.window setRootViewController:rootViewController];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // appdelegate 가 가지고 있는 윈도우가 키 윈도우가 될 것이다.
    [self.window makeKeyAndVisible];
    
    
    // 프로젝트 전역에 UILabel 의 배경색을 노란색으로 지정.
    [[UILabel appearance] setBackgroundColor:[UIColor yellowColor]];
    
    // 프로젝트 뷰 전역에 UIView 배경색은 빨간색으로 지정. -> 협업할 때 문제가 될 수 있으니 잘 사용할 것.
    [[UIView appearance] setBackgroundColor:[UIColor redColor]];
    
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
