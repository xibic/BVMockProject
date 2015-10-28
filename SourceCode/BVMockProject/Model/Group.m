//
//  Groups.m
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "Group.h"

@implementation Group

#pragma mark - Mappings
//Create mappings with Json to Object
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"Id": @"groupId",
                                                       @"Name": @"name",
                                                       @"DepartmentId": @"departmentId",
                                                       }];
}

@end
