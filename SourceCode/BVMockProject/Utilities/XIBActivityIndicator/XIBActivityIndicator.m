//
//  XIBActivityIndicator.m
//
//  Created by xibic on 6/13/14.
//

#import "XIBActivityIndicator.h"

@interface XIBActivityIndicator(){
    UIView *hudView;
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation XIBActivityIndicator

+ (XIBActivityIndicator *)sharedActivity{
    static XIBActivityIndicator *sharedActivity;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedActivity = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedActivity;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
		self.alpha = 0.9;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (void)startActivity{
    [[self sharedActivity] showLoading];
}


+ (void)dismissActivity{
    [[self sharedActivity] hideLoading];
}

- (void)showLoading{
    
    [hudView removeFromSuperview];
    
    
    hudView = [[UIView alloc] initWithFrame:self.frame];
    hudView.backgroundColor = [UIColor blackColor];
    hudView.alpha = 0.2f;
    hudView.userInteractionEnabled = NO;
    [self addSubview:hudView];
    
    [activityIndicator removeFromSuperview];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.center = CGPointMake(self.frame.size.width/2.0f, self.frame.size.height/2.0f);
    activityIndicator.hidesWhenStopped = YES;
    [activityIndicator startAnimating];
    [self addSubview:activityIndicator];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIApplication sharedApplication].keyWindow.userInteractionEnabled = NO;
    //[[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}

- (void)hideLoading{
    
    [hudView removeFromSuperview];
    [activityIndicator removeFromSuperview];
    
    [self removeFromSuperview];
    
    [UIApplication sharedApplication].keyWindow.userInteractionEnabled = YES;
    //[[UIApplication sharedApplication] endIgnoringInteractionEvents];
}

@end
