//
//  ProductListViewCell.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "ProductListViewCell.h"

static int CELL_HEIGHT = MULTIPLE_DATA_CELL_HEIGHT;

static int TITLE_TAG = 1;
static int PRICE_TAG = 2;
static int SUB_TITLE_TAG = 3;

@implementation ProductListViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Update Cell
//Update Empty cell with data
- (void)updateWithData:(Product *)prodItem{
    ((UILabel *)[self viewWithTag:TITLE_TAG]).text = [NSString stringWithFormat:@"%@",prodItem.name];
    ((UILabel *)[self viewWithTag:SUB_TITLE_TAG]).text = [NSString stringWithFormat:@"%@",prodItem.subText];
    ((UILabel *)[self viewWithTag:PRICE_TAG]).text = [NSString stringWithFormat:@"%.2f DKK",prodItem.price];
}

#pragma mark - init
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        //self.layer.borderColor = [UIColor redColor].CGColor;
        //self.layer.borderWidth = 1.0f;
        
        //Create Custom View
        [self createCustomCellView];
    }
    return self;
}

- (void)createCustomCellView{
    
    //Add Container View
    UIView *dataContainerView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 5.0f,
                                                                         SCREEN_SIZE.width-10.0f,
                                                                         CELL_HEIGHT-3.0f)];
    dataContainerView.backgroundColor = [UIColor whiteColor];
    dataContainerView.layer.cornerRadius = 3.0f;
    [self addSubview:dataContainerView];
    
    
    //Add Name Label
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(10.0, 0.0, CGRectGetWidth(dataContainerView.frame)-20.0f,
                                                            CGRectGetHeight(dataContainerView.frame)/2.0)];//Set frame of label
    [nameLabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [nameLabel setFont:[UIFont fontWithName:Fonts.Regular size:Fonts.TitleFontSize]];
    [nameLabel setText:@""];//Set text in label.
    [nameLabel setTextColor:[UIColor colorFromHexString:AppColor.textTitleColor]];//Set text color in label.
    [nameLabel setTextAlignment:NSTextAlignmentLeft];//Set text alignment in label.
    [nameLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [nameLabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [nameLabel setNumberOfLines:1];//Set number of lines in label.
    //[nameLabel.layer setCornerRadius:25.0];//Set corner radius of label to change the shape.
    //[nameLabel.layer setBorderWidth:2.0f];//Set border width of label.
    [nameLabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    //[nameLabel.layer setBorderColor:[UIColor blackColor].CGColor];//Set Border color.
    //Set tag
    nameLabel.tag = TITLE_TAG;
    [dataContainerView addSubview:nameLabel];//Add it to the view
    
    //Add Description Label
    UILabel *deslabel=[[UILabel alloc]initWithFrame:CGRectMake(10.0,
                                                               CGRectGetMaxY(nameLabel.frame),
                                                               CGRectGetWidth(dataContainerView.frame)/2.0 + 20.0,
                                                            CGRectGetHeight(dataContainerView.frame)/2.0f)];//Set frame of label
    [deslabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [deslabel setFont:[UIFont fontWithName:Fonts.Regular size:Fonts.ContentFontSize]];
    [deslabel setText:@""];//Set text in label.
    [deslabel setTextColor:[UIColor colorFromHexString:AppColor.textContentColor]];//Set text color in label.
    [deslabel setTextAlignment:NSTextAlignmentLeft];//Set text alignment in label.
    [deslabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [deslabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [deslabel setNumberOfLines:1];//Set number of lines in label.
    //[deslabel.layer setCornerRadius:25.0];//Set corner radius of label to change the shape.
    //[deslabel.layer setBorderWidth:2.0f];//Set border width of label.
    [deslabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    //[deslabel.layer setBorderColor:[UIColor blackColor].CGColor];//Set Border color.
    //Set tag
    deslabel.tag = SUB_TITLE_TAG;
    [dataContainerView addSubview:deslabel];//Add it to the view
    
    //Add Price Label
    UILabel *priceLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(deslabel.frame),
                                                                 CGRectGetMaxY(nameLabel.frame),
                                                                CGRectGetWidth(dataContainerView.frame)-CGRectGetMaxX(deslabel.frame)-30,
                                                            CGRectGetHeight(dataContainerView.frame)/2.0f)];//Set frame of label
    [priceLabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [priceLabel setFont:[UIFont fontWithName:Fonts.Regular size:Fonts.ContentFontSize]];
    [priceLabel setText:@""];//Set text in label.
    [priceLabel setTextColor:[UIColor colorFromHexString:AppColor.textContentColor]];//Set text color in label.
    [priceLabel setTextAlignment:NSTextAlignmentLeft];//Set text alignment in label.
    [priceLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [priceLabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [priceLabel setNumberOfLines:1];//Set number of lines in label.
    //[priceLabel.layer setCornerRadius:25.0];//Set corner radius of label to change the shape.
    //[priceLabel.layer setBorderWidth:2.0f];//Set border width of label.
    [priceLabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    //[priceLabel.layer setBorderColor:[UIColor blackColor].CGColor];//Set Border color.
    //Set tag
    priceLabel.tag = PRICE_TAG;
    [dataContainerView addSubview:priceLabel];//Add it to the view
    
    //AccessoryView
    UIImage *image = [UIImage imageNamed:@"plus.png"];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)-24,
                                                                  dataContainerView.frame.size.height/2.0f - 12.0f, 24, 24)];
    [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.alpha = 0.6;
    [button addTarget:self action:@selector(accessoryButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
    [dataContainerView addSubview:button];
    
}

- (void)accessoryButtonTapped:(id)sender event:(id)event{
    
    //Animate on Plus button tap
    CGPoint position = self.center;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(position.x, position.y)];
    [path addLineToPoint:CGPointMake(position.x-20, position.y)];
    [path addLineToPoint:CGPointMake(position.x+20, position.y)];
    [path addLineToPoint:CGPointMake(position.x-20, position.y)];
    [path addLineToPoint:CGPointMake(position.x+20, position.y)];
    [path addLineToPoint:CGPointMake(position.x, position.y)];
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.path = path.CGPath;
    positionAnimation.duration = .5f;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [CATransaction begin];
    [self.layer addAnimation:positionAnimation forKey:nil];
    [CATransaction commit];
    
    //Send event to parent class - delegate
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnProductAddButton:)]) {
        [self.delegate didClickOnProductAddButton:event];
    }
}

@end
