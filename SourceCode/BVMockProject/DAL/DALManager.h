//
//  DALManager.h
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

//Model items
#import "Department.h"
#import "Group.h"
#import "Product.h"

typedef void (^api_Completion_Handler_Status)(BOOL success);
typedef void (^api_Completion_Handler_Data)(BOOL success, NSMutableArray *resultDataArray);

@interface DALManager : NSObject

//Singleton
+ (DALManager *)sharedManager;

// Get Product Department List
- (void)getDepartmentData:(api_Completion_Handler_Data)completion;

// Get Groups List of a Department
- (void)getGroupsDataForDepartmentID:(NSString *)deptID completion:(api_Completion_Handler_Data)completion;

// Get Product List of a Group
- (void)getProductListForGroupID:(NSString *)groupID completion:(api_Completion_Handler_Data)completion;

// Get details of a Product
- (Product *)getProductDetailsForID:(NSString *)productID completion:(api_Completion_Handler_Data)completion;



//Manage Added To Cart - Data

//Total Price
- (float)getTotalPriceForAddedProduct;

//Add Price to total price
- (void)addProductPriceToTotalPrice:(float)nPrice;

//Get added product list
- (NSArray *)getProductListAddedToCart;

//Add product to array
- (void)addProductToCart:(Product *)nProduct;

//Get number of products added
- (int)getAddedToCartProductCount;

//Get Added Count for a Single Product
- (int)getCountForProduct:(NSString *)prodId;

@end
