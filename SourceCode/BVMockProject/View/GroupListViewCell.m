//
//  GroupViewCell.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "GroupListViewCell.h"

static int CELL_HEIGHT = SINGLE_DATA_CELL_HEIGHT;

static int TITLE_TAG = 1;

@implementation GroupListViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Update Cell
//Update Empty cell with data
- (void)updateWithData:(Group *)grpItem{
    ((UILabel *)[self viewWithTag:TITLE_TAG]).text = [NSString stringWithFormat:@"%@",grpItem.name];
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
                                                                CGRectGetHeight(dataContainerView.frame))];//Set frame of label
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
    
    
    //AccessoryView
    UIImage *image = [UIImage imageNamed:@"next.png"];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)-15, 0, 20, 20)];
    [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(accessoryButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
    [dataContainerView addSubview:button];
    button.center = CGPointMake(button.center.x, nameLabel.center.y);
    button.alpha = 0.5;
}

- (void)accessoryButtonTapped:(id)sender event:(id)event{
    //
}

@end
