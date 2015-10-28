//
//  AppDelegate.h
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XIBNavigationBar.h"
#import "XIBTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) XIBTabBarController *tabBarController;

@end

