//
//  CartListViewCell.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "CartListViewCell.h"

static int CELL_HEIGHT = MULTIPLE_DATA_CELL_HEIGHT;

static int TITLE_TAG = 1;
static int PRICE_TAG = 2;
static int TOTAL_TAG = 3;
static int PROD_COUNT_TAG = 4;

@implementation CartListViewCell

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
    
    int prodCount = [[DALManager sharedManager] getCountForProduct:prodItem.productId];
    
    ((UILabel *)[self viewWithTag:TITLE_TAG]).text = [NSString stringWithFormat:@"%@",prodItem.name];
    ((UILabel *)[self viewWithTag:TOTAL_TAG]).text = [NSString stringWithFormat:@"%.2f",(prodItem.price * prodCount)];
    ((UILabel *)[self viewWithTag:PRICE_TAG]).text = [NSString stringWithFormat:@"a  %.2f DKK",prodItem.price];
    ((UILabel *)[self viewWithTag:PROD_COUNT_TAG]).text = [NSString stringWithFormat:@"%d",prodCount];
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
    
    
    //Add Added To Cart Count  Label
    UILabel *countLabel=[[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 40.0f,
                                                                 CGRectGetHeight(dataContainerView.frame)/2.0f)];//Set frame of label
    [countLabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [countLabel setFont:[UIFont fontWithName:Fonts.Bold size:Fonts.HeaderFontSize]];
    [countLabel setText:@""];//Set text in label.
    [countLabel setTextColor:[UIColor colorFromHexString:AppColor.textTitleColor]];//Set text color in label.
    [countLabel setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [countLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [countLabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [countLabel setNumberOfLines:1];//Set number of lines in label.
    [countLabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    //Set tag
    countLabel.tag = PROD_COUNT_TAG;
    [dataContainerView addSubview:countLabel];//Add it to the view
    
    //Add Name Label
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(countLabel.frame),
                                                                0.0, CGRectGetWidth(dataContainerView.frame)-70.0f,
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
    
    
    //Add Price Label
    UILabel *priceLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(countLabel.frame),
                                                                 CGRectGetMaxY(nameLabel.frame),
                                                                 CGRectGetWidth(dataContainerView.frame)/3.0,
                                                                 CGRectGetHeight(dataContainerView.frame)/2.0f)];//Set frame of label
    [priceLabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [priceLabel setFont:[UIFont fontWithName:Fonts.Regular size:Fonts.ContentFontSize]];
    [priceLabel setText:@""];//Set text in label.
    [priceLabel setTextColor:[UIColor colorFromHexString:AppColor.textContentColor]];//Set text color in label.
    [priceLabel setTextAlignment:NSTextAlignmentLeft];//Set text alignment in label.
    [priceLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [priceLabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [priceLabel setNumberOfLines:1];//Set number of lines in label.
    [priceLabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    //Set tag
    priceLabel.tag = PRICE_TAG;
    [dataContainerView addSubview:priceLabel];//Add it to the view
    
    
    //Add Total Price Label
    UILabel *totalPriceLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(dataContainerView.frame)-65.0f,
                                                                      0.0,
                                                                      55.0f,
                                                        CGRectGetHeight(dataContainerView.frame))];//Set frame of label.
    [totalPriceLabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [totalPriceLabel setFont:[UIFont fontWithName:Fonts.Bold size:Fonts.TitleFontSize]];
    [totalPriceLabel setText:@""];//Set text in label.
    [totalPriceLabel setTextColor:[UIColor colorFromHexString:AppColor.textTitleColor]];//Set text color in label.
    [totalPriceLabel setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [totalPriceLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [totalPriceLabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [totalPriceLabel setNumberOfLines:1];//Set number of lines in label.
    [totalPriceLabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    
    //Set tag
    totalPriceLabel.tag = TOTAL_TAG;
    [dataContainerView addSubview:totalPriceLabel];//Add it to the view
    
    
}

- (void)accessoryButtonTapped:(id)sender event:(id)event{
    //
}

@end
