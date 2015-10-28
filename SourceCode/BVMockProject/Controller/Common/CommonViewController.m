//
//  CommonController.h
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "CommonViewController.h"

typedef void (^Operation_Completion_Handler_Status)(BOOL success);

@interface CommonViewController ()

@end

@implementation CommonViewController

//| ----------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    // Add code to clean up any of your own resources that are no longer necessary.
    if ([self.view window] == nil){
        // Add code to preserve data stored in the views that might be
        // needed later.
        
        // Add code to clean up other strong references to the view in
        // the view hierarchy.
        self.view = nil;
    }
}

#pragma mark - LoadView
//| ----------------------------------------------------------------------------
- (void)loadView{
    
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    
}

//| ----------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Background Color
    self.view.backgroundColor = [UIColor colorFromHexString:AppColor.backgroundColor];
    
    //Layout views for ios 7 and greater
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
}


//| ----------------------------------------------------------------------------
- (void)clearMemory:(Operation_Completion_Handler_Status)completion{
    self.view.backgroundColor = [UIColor whiteColor];
    for (int i=(int)[self.view.subviews count]-1; i>=0; i--){
        [[self.view.subviews objectAtIndex:i] removeFromSuperview];
        if ([self.view.subviews count]==0) {
            completion(true);
        }
    }
    
}

//| ----------------------------------------------------------------------------
#pragma mark - UIResponder
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(![touch.view isMemberOfClass:[UITextField class]]) {
        [touch.view endEditing:YES];
    }
}



@end





