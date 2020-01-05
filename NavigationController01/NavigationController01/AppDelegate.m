//
//  AppDelegate.m
//  NavigationController01
//
//  Created by jelly on 2020/1/4.
//  Copyright © 2020 jelly. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UINavigationController *navVC;
    NSInteger counter;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    //创建根视图控制器
//    UIViewController *rootVC = [[UIViewController alloc] init];
//    rootVC.view.backgroundColor = [UIColor redColor];
    
    //创建UINavigationController，将根视图控制器作为它的根视图
//    navVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    navVC = [[UINavigationController alloc] init];
    
    UIViewController *vc1 = [self createVCWithTitle:[NSString stringWithFormat:@"第%ld页", ++counter] pageNumber:counter];
    UIViewController *vc2 = [self createVCWithTitle:[NSString stringWithFormat:@"第%ld页", ++counter] pageNumber:counter];
    UIViewController *vc3 = [self createVCWithTitle:[NSString stringWithFormat:@"第%ld页", ++counter] pageNumber:counter];
    [navVC setViewControllers:@[vc1,vc2,vc3]];
    
    //设置toolbar是否可见
    navVC.toolbarHidden = NO;
    
    //设置window的根视图控制器为UINavigationController
    self.window.rootViewController = navVC;
    //显示Window
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController*) createVCWithTitle:(NSString*)title pageNumber:(NSInteger)pageNumber{
    UIViewController *vc=[[UIViewController alloc]init];
    vc.view.backgroundColor=[UIColor redColor];
    vc.view.tag = pageNumber;
    [vc setTitle:title];
    
    UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake(100,250,150,50)];
    [button setTitle:@"下一页" forState:(UIControlStateNormal)];
    [button addTarget:nil action:@selector(vc1BtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    /*11 下面代码打开后，返回按钮和左按钮会同时显示 11*/
    /* 默认时，本页返回按钮文字 会显示 上一页 的标题 */
    //创建一个返回按钮
    //不创建时，默认显示上一面的标题
//    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:@selector(pressBack:)];
//    vc.navigationItem.backBarButtonItem = backBtn;
    
    //创建一个导航栏左侧按钮
//    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:@selector(pressLeft:)];
//    vc.navigationItem.leftBarButtonItem = leftBtn;
    
    //如果给当前view设置了leftbarbutton,会把把backbarbutton覆盖掉,想同时显示两者,
//    vc.navigationItem.leftItemsSupplementBackButton = YES;
    /*11 上面代码注释掉后，返回按钮和左按钮会同时显示 11*/
    
    //创建一个导航栏右侧按钮
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:nil action:@selector(pressRight:)];
    vc.navigationItem.rightBarButtonItem = rightBtn;
    
    //设置titleview,会覆盖title
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[title, @"江山", @"美人"]];
    vc.navigationItem.titleView = segment;

    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:@selector(pressPlay:)];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:nil action:@selector(pressPause:)];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:nil action:@selector(pressStop:)];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

//
//    //toolbar是整个navigation堆栈里的view共同的,但toolbar上面的items却是每个view单独拥有的
//    //现在只是设置了当前view的toolbaritem,与其他view的toolbaritme是没有关系的
//    [vc setToolbarItems:[NSArray arrayWithObjects:one, flexItem, two, flexItem, three, flexItem, nil]];
    vc.toolbarItems = @[one, flexItem, two, flexItem, three];
    
    [vc.view addSubview:button];
    return vc;
}

-(void) vc1BtnClick:(UIButton *)sender{
    NSLog(@"will go to next page");
//    [navVC.topViewController.];
    UIViewController *top = navVC.topViewController;
    NSInteger pageNumber = top.view.tag + 1;
    UIViewController *vc = [self createVCWithTitle:[NSString stringWithFormat:@"第%ld页", pageNumber] pageNumber:pageNumber];
    [navVC pushViewController:vc animated:YES];
}

/**
 * 下方工具栏，播放按钮 点击事件回调方法
 */
- (void) pressPlay:(UIBarButtonItem*)btn {
    NSLog(@"播放按钮被按下");
}

/**
 * 下方工具栏，暂停按钮 点击事件回调方法
 */
- (void) pressPause:(UIBarButtonItem*)btn {
    NSLog(@"暂停按钮被按下");
}

/**
 * 下方工具栏，停止按钮 点击事件回调方法
 */
- (void) pressStop:(UIBarButtonItem*)btn {
    NSLog(@"停止按钮被按下");
}

/**
 * 左侧按钮点击事件回调方法
 */
- (void) pressBack:(UIBarButtonItem*)btn {
    NSLog(@"返回按钮被按下");
    [navVC popViewControllerAnimated:YES];
}

/**
 * 左侧按钮点击事件回调方法
 */
- (void) pressLeft:(UIBarButtonItem*)btn {
    NSLog(@"左侧按钮被按下");
}

/**
 * 右侧按钮点击事件回调方法
 */
- (void) pressRight:(UIBarButtonItem*)btn {
    NSLog(@"右侧按钮被按下");
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

