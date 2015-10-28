//
//  XIBTabBarController.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "XIBTabBarController.h"

@interface XIBTabBarController ()

@end

@implementation XIBTabBarController

- (id)initWithViewControllers:(NSArray *)viewControllerArray{
    if (self = [super init]) {
        
        // Change the tabbar's background and selection image through the appearance proxy
        UIColor *backgroundColor = [UIColor colorFromHexString:AppColor.tabBarColor];
        CGSize tabBarSize = CGSizeMake(320.0f, 49.0f);
        
        // set the bar background color
        [[UITabBar appearance] setBackgroundImage:[XIBTabBarController imageFromColor:backgroundColor
                                                               forSize:tabBarSize withCornerRadius:0]];
        
        // set the text color for selected state
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        // set the text color for unselected state
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
        
        // set the selected icon color
        [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
        [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
        // remove the shadow
        [[UITabBar appearance] setShadowImage:nil];
        
        // Set the dark color to selected tab (the dimmed background)
        [[UITabBar appearance] setSelectionIndicatorImage:
         [XIBTabBarController imageFromColor:[UIColor darkerColorForColor:backgroundColor] forSize:CGSizeMake(tabBarSize.width/2.0f - 8.0f, tabBarSize.height - 8.0f) withCornerRadius:4]];
        
        //Set Text Attributes
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor grayColor];
        shadow.shadowOffset = CGSizeMake(0.0, 0.5);
        
        NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont fontWithName:Fonts.Bold size:10.0], NSFontAttributeName,
                                   [UIColor whiteColor], NSForegroundColorAttributeName,
                                   shadow,NSShadowAttributeName,nil];
        [[UITabBarItem appearance] setTitleTextAttributes:attribute forState:UIControlStateNormal];

        
        //Set the View Controllers
        [self setViewControllers:viewControllerArray];
        //Set First ViewController as the initial View
        [self setSelectedIndex:0];
        
    }
    return self;
}

//Return Darker Color Image from a given color and size
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

@end
