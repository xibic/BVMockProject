//
//  ProductsGroupViewController.m
//  BVMockProject
//
//  Created by xibic on 10/26/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "ProductsGroupViewController.h"
#import "ProductsViewController.h"
#import "GroupListViewCell.h"

static NSString *CellIdentifier = @"GroupListViewCell";


@interface ProductsGroupViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *dataTableView;
@property (nonatomic, strong) NSMutableArray *tableDataArray;

@end

@implementation ProductsGroupViewController

#pragma mark - ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"Groups";
    
    // Setup initial screen UI
    [self setupInitialView];
    
}
#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Get Group List
    [self getGroupListData];
    
}

#pragma mark - Data
- (void)getGroupListData{
    [[DALManager sharedManager] getGroupsDataForDepartmentID:self.selectedDepartmentId completion:^(BOOL success, NSMutableArray *resultDataArray) {
        if (success && resultDataArray.count>0) {
            self.tableDataArray = resultDataArray;
            //Update List with data
            if (self.dataTableView !=nil ) {
                [self.dataTableView reloadData];
            }else{
                [self addDataTableView];
            }
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No data available!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
    
    // Add TableView to Show - Product Group List
    self.dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                      style:UITableViewStylePlain];
    [self.view addSubview:self.dataTableView];
    
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    
    self.dataTableView.backgroundColor = [UIColor clearColor];
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataTableView.rowHeight = SINGLE_DATA_CELL_HEIGHT;
    
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
    GroupListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[GroupListViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //Apply animation - first time cell added
        [self animateTableViewCell:cell index:(int)indexPath.row];
    }
    
    // Update the cell...
    Group *grpItem = (Group *)[self.tableDataArray objectAtIndex:indexPath.row];
    if(grpItem!=nil)[cell updateWithData:grpItem];
    
    return cell;
}

//Cell Appear Animation
- (void)animateTableViewCell:(GroupListViewCell *)cell index:(int)cellIndex{
    
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



//Selected Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Group *selectedGrp = (Group *)[self.tableDataArray objectAtIndex:indexPath.row];
    [self pushProductListViewController:selectedGrp.groupId];
}

#pragma mark - Push Product List
- (void)pushProductListViewController:(NSString *)groupId{
    ProductsViewController *prodVc = [[ProductsViewController alloc] init];
    prodVc.selectedGroupId = groupId;
    [self.navigationController pushViewController:prodVc animated:YES];
}



@end

