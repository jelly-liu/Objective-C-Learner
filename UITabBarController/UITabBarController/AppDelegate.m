//
//  AppDelegate.m
//  UITabBarController
//
//  Created by jelly on 2020/1/5.
//  Copyright © 2020 jelly. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSArray<NSString*>* cityList;
    UITableView * tableView;
}
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //2.设置窗口的根控制器
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    //添加子控制器
    //默认显示的第一个添加的子控制器的View
    //tabBarVC里面有多少个子控制器,tabBar当中就有多少个平分的按钮
    
    //UITabBarController中的tabBar的内容是有对应按钮的控制器来决定的.
    //tabBar的内容是有对应按钮的控制器的tabBarItem来决定
    
    //添加第一个 tab 对应的视图
    UIViewController *oneVC = [[UIViewController alloc] init];
    //设置标题
    oneVC.tabBarItem.title = @"消息";
    oneVC.view.backgroundColor = [UIColor redColor];
    //设置图片
    oneVC.tabBarItem.image = [[UIImage imageNamed:@"message"] imageWithRenderingMode:(UIImageRenderingModeAutomatic)];
    oneVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"message"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    //设置提醒图标
    oneVC.tabBarItem.badgeValue = @"99";
    [tabBarVC addChildViewController:oneVC];
    
    //添加第二个 tab 对应的视图
    UIViewController *twoVC = [[UIViewController alloc] init];
    //设置标题
    twoVC.tabBarItem.title = @"应用";
    twoVC.view.backgroundColor = [UIColor yellowColor];
    //设置图片
    twoVC.tabBarItem.image = [[UIImage imageNamed:@"weather"] imageWithRenderingMode:(UIImageRenderingModeAutomatic)];
    twoVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"weather"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [tabBarVC addChildViewController:twoVC];
    
    //添加第三个 tab 对应的视图
    UINavigationController *nav = [[UINavigationController alloc] init];
    //设置标题
    nav.tabBarItem.title = @"图片";
    //设置图片
    nav.tabBarItem.image = [[UIImage imageNamed:@"photo"] imageWithRenderingMode:(UIImageRenderingModeAutomatic)];
    //设置选中状态下的图片
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:@"photo"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    UIViewController *three1VC = [[UIViewController alloc] init];
    three1VC.view.backgroundColor = [UIColor blueColor];
    [three1VC setTitle:@"Three1"];
    
    UIViewController *three2VC = [[UIViewController alloc] init];
    three2VC.view.backgroundColor = [UIColor redColor];
    [three2VC setTitle:@"Three2"];
    
    UIViewController *three3VC = [[UIViewController alloc] init];
    three3VC.view.backgroundColor = [UIColor greenColor];
    [three3VC setTitle:@"Three3"];
    
    //添加三个子视图
    [nav setViewControllers:@[three1VC, three2VC, three3VC]];
    
    [tabBarVC addChildViewController:nav];
    
    //手动设置当前选中的是哪一个控制器
    //默认显示的第一个添加的子控制器的View
    //tabBarVC.selectedInd
    
    self.window.rootViewController = tabBarVC;
    //3.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


@end

