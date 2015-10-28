//
//  ProductsViewController.m
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductListViewCell.h"


static NSString *CellIdentifier = @"ProductListViewCell";


@interface ProductsViewController ()<UITableViewDataSource,UITableViewDelegate,ProductListViewCellDelegate>

@property (nonatomic, strong) UITableView *dataTableView;
@property (nonatomic, strong) NSMutableArray *tableDataArray;

@end

@implementation ProductsViewController

#pragma mark - ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"Products";
    
    /* Initi - Reset Data */
    //NO Need to Reset Selected Product list or Total Count
    //As Not required This time
    
    
    // Setup initial screen UI
    [self setupInitialView];
    
}

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Get Product List
    [self getProductListData];
    
}

#pragma mark - Data
- (void)getProductListData{
    
    [[DALManager sharedManager] getProductListForGroupID:self.selectedGroupId completion:^(BOOL success, NSMutableArray *resultDataArray) {
        
        if (success && resultDataArray.count>0) {
            self.tableDataArray = resultDataArray;
            //Update List with data
            if (self.dataTableView !=nil ) {
                [self.dataTableView reloadData];
            }else{
                [self addDataTableView];
            }
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Opps!" message:@"No product available in this group right now!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            alert = nil;
        }
    }];
}
#pragma mark - INitial View
- (void)setupInitialView{
    //No Views
}

#pragma mark - Table View
- (void)addDataTableView{
    
    // Register Custom cell to TableView
    [self.dataTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    // Add TableView to Show - Product List
    self.dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
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
    ProductListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ProductListViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.delegate = self;
        //Apply animation - first time cell added
        [self animateTableViewCell:cell index:(int)indexPath.row];
        
    }
    
    // Update the cell...
    Product *prdItem = (Product *)[self.tableDataArray objectAtIndex:indexPath.row];
    if(prdItem!=nil)[cell updateWithData:prdItem];
    
    return cell;
}

//Cell Appear Animation
- (void)animateTableViewCell:(ProductListViewCell *)cell index:(int)cellIndex{
    
    cell.frame = CGRectMake(-CGRectGetWidth(cell.bounds), cell.frame.origin.y, CGRectGetWidth(cell.bounds), CGRectGetHeight(cell.bounds));
    cell.alpha = 0.f;
    
    cell.alpha = 1.f;
    [UIView animateWithDuration:0.25f
                          delay:cellIndex * 0.1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         cell.frame = CGRectMake(0.f, cell.frame.origin.y, CGRectGetWidth(cell.bounds), CGRectGetHeight(cell.bounds));
                     }
                     completion:nil];
}




#pragma mark - CellDelegate
- (void)didClickOnProductAddButton:(id)event{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.dataTableView];
    NSIndexPath *indexPath = [self.dataTableView indexPathForRowAtPoint: currentTouchPosition];
    
    if (indexPath != nil){
        Product *selectedProd = (Product *)[self.tableDataArray objectAtIndex:indexPath.row];
        //Update total
        [[DALManager sharedManager] addProductPriceToTotalPrice:selectedProd.price];
        //Update Selected Product array
        [[DALManager sharedManager] addProductToCart:selectedProd];
        
        //Update Badge
        [[[[[self tabBarController] tabBar] items]
          objectAtIndex:1] setBadgeValue:[NSString stringWithFormat:@"%d",[[DALManager sharedManager] getAddedToCartProductCount]]];
        [[[[[self tabBarController] tabBar] items]
          objectAtIndex:1] setTitle:[NSString stringWithFormat:@"%.2f DKK",[[DALManager sharedManager] getTotalPriceForAddedProduct]]];
        
    }
}


@end