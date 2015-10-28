//  Created by xibic
//
//  UIColor+FlatColors.h
//
//

#import "UIColor+FlatColors.h"

@implementation UIColor (FlatColors)

+ (UIColor *)lighterColorForColor:(UIColor *)color alphaValue:(CGFloat)a{
    CGFloat r, g, b, oa;
    if ([color getRed:&r green:&g blue:&b alpha:&oa])
        return [UIColor colorWithRed:MIN(r , 1.0)
                               green:MIN(g , 1.0)
                                blue:MIN(b , 1.0)
                               alpha:a];
    return nil;
}

+ (UIColor *)lighterColorForColor:(UIColor *)color{
    CGFloat r, g, b, a;
    if ([color getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.2, 1.0)
                               green:MIN(g + 0.2, 1.0)
                                blue:MIN(b + 0.2, 1.0)
                               alpha:a];
    return nil;
}

+ (UIColor *)darkerColorForColor:(UIColor *)color{
    CGFloat r, g, b, a;
    if ([color getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.2, 0.0)
                               green:MAX(g - 0.2, 0.0)
                                blue:MAX(b - 0.2, 0.0)
                               alpha:a];
    return nil;
}

+ (NSString *)hexStringFromColor:(UIColor *)color{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255.0),
            lroundf(g * 255.0),
            lroundf(b * 255.0)];
}

+ (UIColor *)colorFromHexString:(NSString *)hexValue{
    NSString *noHashString = [hexValue stringByReplacingOccurrencesOfString:@"#" withString:@""]; // remove the #
    NSScanner *scanner = [NSScanner scannerWithString:noHashString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]]; // remove + and $
    
    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}


+ (UIColor *)flatEucalyptusColor {
    return [UIColor colorWithRed:38.0f/255.0f green:166.0f/255.0f blue:91.0f/255.0f alpha:1.0];
}

+ (UIColor *)flatDodgerBlueColor {
    return [UIColor colorWithRed:25.0f/255.0f green:181.0f/255.0f blue:254.0f/255.0f alpha:1.0];
}

+ (UIColor *)flatSungloColor {
    return [UIColor colorWithRed:226.0f/255.0f green:106.0f/255.0f blue:106.0f/255.0f alpha:1.0];
}

+ (UIColor *)flatTurquoiseColor {
    return [UIColor colorWithRed:0.10196078431372549 green:0.7372549019607844 blue:0.611764705882353 alpha:1.0];
}

+ (UIColor *)flatGreenSeaColor {
    return [UIColor colorWithRed:0.08627450980392157 green:0.6274509803921569 blue:0.5215686274509804 alpha:1.0];
}

+ (UIColor *)flatEmeraldColor {
    return [UIColor colorWithRed:0.1803921568627451 green:0.8 blue:0.44313725490196076 alpha:1.0];
}

+ (UIColor *)flatNephritisColor {
    return [UIColor colorWithRed:0.15294117647058825 green:0.6823529411764706 blue:0.3764705882352941 alpha:1.0];
}

+ (UIColor *)flatPeterRiverColor {
    return [UIColor colorWithRed:0.20392156862745098 green:0.596078431372549 blue:0.8588235294117647 alpha:1.0];
}

+ (UIColor *)flatBelizeHoleColor {
    return [UIColor colorWithRed:0.1607843137254902 green:0.5019607843137255 blue:0.7254901960784313 alpha:1.0];
}

+ (UIColor *)flatAmethystColor {
    return [UIColor colorWithRed:0.6078431372549019 green:0.34901960784313724 blue:0.7137254901960784 alpha:1.0];
}

+ (UIColor *)flatWisteriaColor {
    return [UIColor colorWithRed:0.5568627450980392 green:0.26666666666666666 blue:0.6784313725490196 alpha:1.0];
}

+ (UIColor *)flatWetAsphaltColor {
    return [UIColor colorWithRed:0.20392156862745098 green:0.28627450980392155 blue:0.3686274509803922 alpha:1.0];
}

+ (UIColor *)flatMidnightBlueColor {
    return [UIColor colorWithRed:0.17254901960784313 green:0.24313725490196078 blue:0.3137254901960784 alpha:1.0];
}

+ (UIColor *)flatSunFlowerColor {
    return [UIColor colorWithRed:0.9450980392156862 green:0.7686274509803922 blue:0.058823529411764705 alpha:1.0];
}

+ (UIColor *)flatOrangeColor {
    return [UIColor colorWithRed:0.9529411764705882 green:0.611764705882353 blue:0.07058823529411765 alpha:1.0];
}

+ (UIColor *)flatCarrotColor {
    return [UIColor colorWithRed:0.9019607843137255 green:0.49411764705882355 blue:0.13333333333333333 alpha:1.0];
}

+ (UIColor *)flatPumpkinColor {
    return [UIColor colorWithRed:0.8274509803921568 green:0.32941176470588235 blue:0 alpha:1.0];
}

+ (UIColor *)flatAlizarinColor {
    return [UIColor colorWithRed:0.9058823529411765 green:0.2980392156862745 blue:0.23529411764705882 alpha:1.0];
}

+ (UIColor *)flatPomegranateColor {
    return [UIColor colorWithRed:0.7529411764705882 green:0.2235294117647059 blue:0.16862745098039217 alpha:1.0];
}

+ (UIColor *)flatCloudsColor {
    return [UIColor colorWithRed:0.9254901960784314 green:0.9411764705882353 blue:0.9450980392156862 alpha:1.0];
}

+ (UIColor *)flatSilverColor {
    return [UIColor colorWithRed:0.7411764705882353 green:0.7647058823529411 blue:0.7803921568627451 alpha:1.0];
}

+ (UIColor *)flatConcreteColor {
    return [UIColor colorWithRed:0.5843137254901961 green:0.6470588235294118 blue:0.6509803921568628 alpha:1.0];
}

+ (UIColor *)flatAsbestosColor {
    return [UIColor colorWithRed:0.4980392156862745 green:0.5490196078431373 blue:0.5529411764705883 alpha:1.0];
}

+ (UIColor *)flatCararraColor{
    return [UIColor colorWithRed:242.0f/255.0f green:241.0f/255.0f blue:239.0f/255.0f alpha:1.0];
}

+ (UIColor *)flatIronColor{
    return [UIColor colorWithRed:218.0f/255.0f green:223.0f/255.0f blue:225.0f/255.0f alpha:1.0];
}

+ (UIColor *)flatGalleryColor{
    return [UIColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1.0];
}


@end