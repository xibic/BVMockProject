//
//  XIBNavigationBar.m
//
//  Created by xibic on 9/30/15.
//

#import "XIBNavigationBar.h"

const CGFloat kNavigationBarExtraHeight = 0.0f;

@implementation XIBNavigationBar


- (CGSize)sizeThatFits:(CGSize)size{
    
    CGSize navigationBarSize = [super sizeThatFits:size];
    navigationBarSize.height += kNavigationBarExtraHeight;
    
    return navigationBarSize;
}

//| ----------------------------------------------------------------------------
- (void)layoutSubviews {
    [super layoutSubviews];
    /*
     //
     //Only Applicable if Height is Custom
     //
     
    NSArray *classNamesToReposition = @[@"_UINavigationBarBackground"];
    
    for (UIView *view in [self subviews]) {
        
        if ([classNamesToReposition containsObject:NSStringFromClass([view class])]) {
            
            CGRect bounds = [self bounds];
            CGRect frame = [view frame];
            frame.origin.y = bounds.origin.y + kNavigationBarExtraHeight - 28.f;
            frame.size.height = bounds.size.height + 20.f;
            
            [view setFrame:frame];
        }
    }
     
     */
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize {
    
    [self setTransform:CGAffineTransformMakeTranslation(0, -(kNavigationBarExtraHeight/2))];
    
    // Custom Drop Shadow
    self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.layer.shadowRadius = 4.0f;
    self.layer.shadowOpacity = 0.8f;
    
}


//| ----------------------------------------------------------------------------
//  Custom implementation of the setter for the customButton property.
//
- (void)setCustomButton:(UIButton *)customButton{
    // Remove the previous button
    [_customButton removeFromSuperview];
    
    _customButton = customButton;
    
    [self addSubview:customButton];
    
    // Force our -sizeThatFits: method to be called again and flag the
    // navigation bar as needing layout.
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

+ (CGFloat)navigationBarExtendedHeight{
    return kNavigationBarExtraHeight;
}

@end
