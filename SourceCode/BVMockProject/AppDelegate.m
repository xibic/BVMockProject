//
//  AppDelegate.m
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "AppDelegate.h"
#import "DepartmentViewController.h"
#import "ShoppingCartViewController.h"

@interface AppDelegate ()

@end


@implementation AppDelegate

#pragma mark - Start App
//| ----------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Set Status Bar Style - White Color
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    
    //Customize Navigation Bar
    [self customizeNavigationBarAppearance];

    
    
    //Prepare view controllers and set inside tab bar controlers
    //Create TabBar Controller with Our ViewController array
    self.tabBarController = [[XIBTabBarController alloc]
                             initWithViewControllers:[self initialTabbedViewControllers]];
    
    
    
    //Init - App Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    
    
    //Set root view controller
    [self.window setRootViewController:self.tabBarController]; // We'll just present the tabbar controller
    
    
    
    return YES;
}



#pragma mark - Initial ViewControllers - 2 View
//| ----------------------------------------------------------------------------
- (NSArray *)initialTabbedViewControllers{
    
    //1.
    // Create Department ViewControllers
    DepartmentViewController *deptVC = [[DepartmentViewController alloc] init];
    [deptVC.tabBarItem setImage:[UIImage imageNamed:@"search"]];
    deptVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    
    //Department View - Navigation Controller
    UINavigationController *deptNavController = [[UINavigationController alloc]
                                 initWithNavigationBarClass:[XIBNavigationBar class]
                                 toolbarClass:nil];
    deptNavController.viewControllers = @[deptVC];
    //deptNavController.edgesForExtendedLayout = UIRectEdgeNone;
    deptNavController.navigationBar.translucent = YES;
    //Change Navigation bar color
    [deptNavController.navigationBar setBarTintColor:[UIColor colorFromHexString:AppColor.navBarColor]];
    
    
    
    
    //2.
    // Create Cart ViewControllers
    ShoppingCartViewController *cartVC = [[ShoppingCartViewController alloc] init];
    [cartVC setTitle:@"0.00 DKK"]; // Currently No Product - 0 DKK
    cartVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0.0, -4.0);
    [cartVC.tabBarItem setImage:[UIImage imageNamed:@"cart"]];

    
    //Cart View - Navigation Controller
    UINavigationController *cartNavController = [[UINavigationController alloc]
                                                 initWithNavigationBarClass:[XIBNavigationBar class]
                                                 toolbarClass:nil];
    cartNavController.viewControllers = @[cartVC];
    //cartNavController.edgesForExtendedLayout = UIRectEdgeNone;
    cartNavController.navigationBar.translucent = YES;
    //Change Navigation bar color
    [cartNavController.navigationBar setBarTintColor:[UIColor colorFromHexString:AppColor.navBarColor]];
    
    
    
    
    //Return 2 ViewControllers as Array
    return @[deptNavController,cartNavController];
}

#pragma mark - NavigationBar
//| ----------------------------------------------------------------------------
- (void)customizeNavigationBarAppearance{
    //Title Text Font and Size
    [[XIBNavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                            [UIColor whiteColor],
                                                            NSForegroundColorAttributeName,
                                                            [UIFont fontWithName:Fonts.Bold size:Fonts.HeaderFontSize],
                                                            NSFontAttributeName, nil]];
    //Tint Color - For Text/Default Button
    [[XIBNavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //Remove Back Button Title ---
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100.f) forBarMetrics:UIBarMetricsDefault];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
