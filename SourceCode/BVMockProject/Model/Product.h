//
//  Products.h
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "JSONModel.h"

@interface Product : JSONModel

@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *subText;
@property (nonatomic, copy) NSString *groupId;
@property (nonatomic, assign) float price;


@end
