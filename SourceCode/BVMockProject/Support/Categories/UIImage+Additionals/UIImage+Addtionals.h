//
//  UIImage+Addtionals.h
//  EngageCare
//
//  Created by xibic on 4/1/15.
//  Copyright (c) 2015 m2sys. All rights reserved.
//

#import <UIKit/UIKit.h>

@import UIKit;


@interface UIImage (Addtionals)

//Effects
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyGaussianBlur;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;


+ (UIImage *)imageFromResource:(NSString *)filename;
+ (UIImage *)imageFromView:(UIView *)view;
+ (UIImage *)imageWithBGColor:(UIColor*)color andTopImage:(NSString*)topImage;
+ (UIImage *)colorMaskedImage:(NSString *)name color:(UIColor *)color;
+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)mask;
+ (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius usingImage:(UIImage *)original;

- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end
