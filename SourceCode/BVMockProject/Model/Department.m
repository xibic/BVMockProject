//
//  Departments.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "Department.h"

@implementation Department

#pragma mark - Mappings
//Create mappings with Json to Object
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"Id": @"departmentId",
                                                       @"Name": @"name",
                                                       }];
}




@end
