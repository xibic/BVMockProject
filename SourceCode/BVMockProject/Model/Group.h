//
//  Groups.h
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "JSONModel.h"

@interface Group : JSONModel

@property (nonatomic, copy) NSString *groupId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *departmentId;

@end
