//
//  ShoppingCartViewController.m
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "CartListViewCell.h"

static NSString *CellIdentifier = @"CartListViewCell";


@interface ShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UILabel *totalPriceLabel;
}

@property (nonatomic, strong) UITableView *dataTableView;
@property (nonatomic, strong) NSArray *tableDataArray;

@end

@implementation ShoppingCartViewController


#pragma mark - ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"My Cart";
    
    // Setup initial screen UI
    [self setupInitialView];
    
}

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Set Data Source
    self.tableDataArray = [[DALManager sharedManager] getProductListAddedToCart];
    if (self.tableDataArray.count>0) {
        //Reset total price
        [totalPriceLabel setText:[NSString stringWithFormat:@"%.2f DKK",[[DALManager sharedManager] getTotalPriceForAddedProduct]]];
        
        if (self.dataTableView!=nil) {
            [self.dataTableView reloadData];
        }else{
            [self addDataTableView];
        }
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No products added yet!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        alert = nil;
    }
    
}

#pragma mark - INitial View
- (void)setupInitialView{
    //Add Total TextLabel
    UILabel *totalLabel=[[UILabel alloc]initWithFrame:CGRectMake(5.0,
                                                                 self.view.frame.size.height - 140.0f,
                                                                 60.0f,
                                                                 40.0f)];//Set frame of label
    [totalLabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [totalLabel setFont:[UIFont fontWithName:Fonts.Bold size:Fonts.HeaderFontSize]];
    [totalLabel setText:@"Total"];//Set text in label.
    [totalLabel setTextColor:[UIColor blackColor]];//Set text color in label.
    [totalLabel setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [totalLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [totalLabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [totalLabel setNumberOfLines:1];//Set number of lines in label.
    [totalLabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    [self.view addSubview:totalLabel];//Add it to the view
    
    //Add Total Price  Label
    totalPriceLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 100.0f,
                                                                      self.view.frame.size.height - 140.0f,
                                                                      95.0f,
                                                                      40.0f)];//Set frame of label
    [totalPriceLabel setBackgroundColor:[UIColor clearColor]];//Set background color of label.
    [totalPriceLabel setFont:[UIFont fontWithName:Fonts.Bold size:Fonts.HeaderFontSize]];
    [totalPriceLabel setText:[NSString stringWithFormat:@"%.2f DKK",[[DALManager sharedManager] getTotalPriceForAddedProduct]]];//Set text in label.
    [totalPriceLabel setTextColor:[UIColor blackColor]];//Set text color in label.
    [totalPriceLabel setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [totalPriceLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [totalPriceLabel setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [totalPriceLabel setNumberOfLines:1];//Set number of lines in label.
    [totalPriceLabel setClipsToBounds:YES];//Set its to YES for Corner radius to work.
    [self.view addSubview:totalPriceLabel];//Add it to the view
}

#pragma mark - Table View
- (void)addDataTableView{
    
    // Register Custom cell to TableView
    [self.dataTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    // Add TableView to Show - Added Product to Shopping Cart
    self.dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,
                                                                       self.view.frame.size.width,
                                                    SCREEN_SIZE.height-165.0f)
                                                      style:UITableViewStylePlain];
    [self.view addSubview:self.dataTableView];
    
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    
    self.dataTableView.backgroundColor = [UIColor clearColor];
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataTableView.rowHeight = MULTIPLE_DATA_CELL_HEIGHT;
    
}

#pragma mark - TableView
#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return self.tableDataArray.count>0?self.tableDataArray.count:200;
}

//View For the Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath{
    // Declare the cell if nil
    CartListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CartListViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Update the cell...
    Product *prdItem = (Product *)[self.tableDataArray objectAtIndex:indexPath.row];
    if(prdItem!=nil)[cell updateWithData:prdItem];
    
    return cell;
}


@end
