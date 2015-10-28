//
//  ProductListViewCell.h
//  BVMockProject
//
//  Created by xibic on 10/27/15.
//  Copyright (c) 2015 BordingVista. All rights reserved.
//

#import "Product.h"


@protocol ProductListViewCellDelegate <NSObject>

- (void)didClickOnProductAddButton:(id)event;

@end


@interface ProductListViewCell : UITableViewCell

@property (weak, nonatomic) id<ProductListViewCellDelegate>delegate;

- (void)updateWithData:(Product *)prodItem;


@end
