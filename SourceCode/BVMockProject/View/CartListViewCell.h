//
//  CartListViewCell.h
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "Product.h"

@interface CartListViewCell : UITableViewCell

- (void)updateWithData:(Product *)prodItem;

@end
