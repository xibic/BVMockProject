//
//  Departments.h
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "JSONModel.h"

@interface Department : JSONModel

@property (nonatomic, copy) NSString *departmentId;
@property (nonatomic, copy) NSString *name;

@end
