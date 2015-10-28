//
//  Products.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "Product.h"

@implementation Product

#pragma mark - Mappings
//Create mappings with Json to Object
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"Id": @"productId",
                                                       @"Text": @"name",
                                                       @"Text2": @"subText",
                                                       @"Price": @"price",
                                                       @"GroupId": @"groupId",
                                                       }];
}


@end
