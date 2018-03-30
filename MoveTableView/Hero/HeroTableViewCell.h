//
//  HeroTableViewCell.h
//  MoveTableView
//
//  Created by wenHao Qiu on 2018/3/30.
//  Copyright © 2018年 文豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroModel.h"

@interface HeroTableViewCell : UITableViewCell

@property (nonatomic, strong) RowModel *model;

- (void)setModel:(RowModel *)model;

- (CGFloat)cellOffset;

@end
