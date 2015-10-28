//
//  DALManager.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "DALManager.h"
#import "HTTPClient.h"

@interface DALManager(){
    
    HTTPClient *httpClient;
    
    BOOL isOnline;
    
    //Array to store Product that added to cart
    NSMutableArray *cartProductListArray;
    
    //Calculate and Store total Price
    float addedToCartTotalPrice;
    
    //Dictionary to keep track of added product
    NSMutableDictionary *cartProductDic;
    
    //Total product Count
    int totalProductAdded;
    
}

@end

@implementation DALManager

//Singleton
+ (DALManager*)sharedManager{
    
    // static variable to hold the instance
    static DALManager *_sharedManager = nil;
    
    // initialization code executes only once.
    static dispatch_once_t oncePredicate;
    // initializer is never called again
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[DALManager alloc] init];
    });
    
    return _sharedManager;
}


#pragma mark - init
- (id)init{
    self = [super init];
    if (self) {
        
        httpClient = [[HTTPClient alloc] init];
        isOnline = YES; //Set Online = YES, as we are getting Data from Server
        
        //Init Shopping Cart data
        cartProductListArray = [[NSMutableArray alloc] init];
        addedToCartTotalPrice = 0.0;
        cartProductDic = [[NSMutableDictionary alloc] init];
        totalProductAdded = 0;
    }
    return self;
}


#pragma mark - Department
// Get Product Department List
- (void)getDepartmentData:(api_Completion_Handler_Data)completion{
    
    if (isOnline){
        
        //Prepare the Corresponding URL
        NSString *urlString = [NSString stringWithFormat:@"departments"];
        
        //Get Data on Separate Thread
        dispatch_queue_t backgroundQueue = dispatch_queue_create("Background Queue", NULL);
        dispatch_async(backgroundQueue, ^{
            [XIBActivityIndicator startActivity];
            [httpClient getRequest:urlString withResponseCallback:^(NSArray *responseJsonData) {
                @autoreleasepool {
                    if (responseJsonData!=nil) {
                        NSMutableArray *deptList = [[NSMutableArray alloc] init];
                        //We got json dictionaries from Server - Convert to our model
                        for (NSDictionary *dic in responseJsonData) {
                            NSError *err;
                            Department *deptItem = [[Department alloc] initWithDictionary:dic error:&err];
                            //NSLog(@"name: %@",deptItem.name);
                            [deptList addObject:deptItem];
                        }
                        //Return Data to Main thread
                        dispatch_async(dispatch_get_main_queue(), ^{
                            completion(TRUE,deptList);
                            [XIBActivityIndicator dismissActivity];
                        });
                    }else{
                        //Return Nil to Main thread
                        dispatch_async(dispatch_get_main_queue(), ^{
                            completion(FALSE,nil);
                            [XIBActivityIndicator dismissActivity];
                        });
                    }
                }
            }];
            
        });
        
    }
    // - Offline
    else{
        //Get Data From DB
    }
    
}

#pragma mark - Group
// Get Groups List of a Department
- (void)getGroupsDataForDepartmentID:(NSString *)deptID completion:(api_Completion_Handler_Data)completion{
    
    if (isOnline){

        //Prepare the Corresponding URL
        NSString *urlString = [NSString stringWithFormat:@"groups?departmentid=%@",deptID];
        
        //Get Data on Separate Thread
        dispatch_queue_t backgroundQueue = dispatch_queue_create("Background Queue", NULL);
        dispatch_async(backgroundQueue, ^{
            [XIBActivityIndicator startActivity];
            [httpClient getRequest:urlString withResponseCallback:^(NSArray *responseJsonData) {
                @autoreleasepool {
                    if (responseJsonData!=nil) {
                        NSMutableArray *grpList = [[NSMutableArray alloc] init];
                        //We got json dictionaries from Server - Convert to our model
                        for (NSDictionary *dic in responseJsonData) {
                            NSError *err;
                            Group *grpItem = [[Group alloc] initWithDictionary:dic error:&err];
                            //NSLog(@"name: %@",deptItem.name);
                            [grpList addObject:grpItem];
                        }
                        //Return Data to Main thread
                        dispatch_async(dispatch_get_main_queue(), ^{
                            completion(TRUE,grpList);
                            [XIBActivityIndicator dismissActivity];
                        });
                    }else{
                        //Return Nil to Main thread
                        dispatch_async(dispatch_get_main_queue(), ^{
                            completion(FALSE,nil);
                            [XIBActivityIndicator dismissActivity];
                        });
                    }
                }
            }];
            
        });
        
    }
    // - Offline
    else{
        //Get Data From DB
    }
}


#pragma mark - Product
// Get Product List of a Group
- (void)getProductListForGroupID:(NSString *)groupID completion:(api_Completion_Handler_Data)completion{
    
    if (isOnline){
        
        //Prepare the Corresponding URL
        NSString *urlString = [NSString stringWithFormat:@"products?groupid=%@",groupID];
        
        //Get Data on Separate Thread
        dispatch_queue_t backgroundQueue = dispatch_queue_create("Background Queue", NULL);
        dispatch_async(backgroundQueue, ^{
            //[XIBActivityIndicator startActivity];
            [httpClient getRequest:urlString withResponseCallback:^(NSArray *responseJsonData) {
                @autoreleasepool {
                    if (responseJsonData!=nil) {
                        NSMutableArray *prdList = [[NSMutableArray alloc] init];
                        //We got json dictionaries from Server - Convert to our model
                        for (NSDictionary *dic in responseJsonData) {
                            NSError *err;
                            Product *prdItem = [[Product alloc] initWithDictionary:dic error:&err];
                            //NSLog(@"name: %@",deptItem.name);
                            [prdList addObject:prdItem];
                        }
                        //Return Data to Main thread
                        dispatch_async(dispatch_get_main_queue(), ^{
                            completion(TRUE,prdList);
                            //[XIBActivityIndicator dismissActivity];
                        });
                    }else{
                        //Return Nil to Main thread
                        dispatch_async(dispatch_get_main_queue(), ^{
                            completion(FALSE,nil);
                            //[XIBActivityIndicator dismissActivity];
                        });
                    }
                }
                
            }];
            
        });
        
    }
    // - Offline
    else{
        //Get Data From DB
    }
}


// Get details of a Product
- (Product *)getProductDetailsForID:(NSString *)productID completion:(api_Completion_Handler_Data)completion{
    return nil;
}

#pragma mark - Shopping Cart Data

//Total Price
- (float)getTotalPriceForAddedProduct{
    return addedToCartTotalPrice;
}

//Add Price to total price
- (void)addProductPriceToTotalPrice:(float)nPrice{
    addedToCartTotalPrice += nPrice;
}

//Get added product list
- (NSArray *)getProductListAddedToCart{
    return cartProductListArray;
}

//Add product to array
- (void)addProductToCart:(Product *)nProduct{
    
    NSString *prodID = nProduct.productId;
    //Check if Product already added - then update
    if ([cartProductDic valueForKey:prodID]) {
        //NSLog(@"%@",[cartProductDic valueForKey:prodID]);
        //Get previous Product Count
        int newCount = [[cartProductDic valueForKey:prodID] intValue];
        //Add +1
        newCount += 1;
        //Update new Product Count
        [cartProductDic setValue:[NSString stringWithFormat:@"%d",newCount] forKey:prodID];
        totalProductAdded +=1;
    }
    else{//Add New Product
        totalProductAdded += 1;
        [cartProductDic setValue:@"1" forKey:prodID];
        [cartProductListArray addObject:nProduct];
        
    }
}

//Get Number of products added
- (int)getAddedToCartProductCount{
    return totalProductAdded;
}

//Get Added Count for a Single Product
- (int)getCountForProduct:(NSString *)prodId{
    int count = [[cartProductDic valueForKey:prodId] intValue];
    return count;
}

@end
