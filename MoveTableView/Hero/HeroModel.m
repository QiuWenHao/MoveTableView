//
//  HeroModel.m
//  MoveTableView
//
//  Created by wenHao Qiu on 2018/3/30.
//  Copyright © 2018年 文豪. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel

- (void)setImgArr:(NSArray *)imgArr {
    
    _imgArr = imgArr;
    
    for (NSString *imageStr in imgArr) {
        
        RowModel *model = [[RowModel alloc] init];
        
        model.img = imageStr;
        
        UIImage *image = [UIImage imageNamed:model.img];
        
        CGFloat width = CGImageGetWidth(image.CGImage);
        
        CGFloat height = CGImageGetHeight(image.CGImage);
        
        model.cellH  = ScreenWidth/width * height/2;
        
        [self.modelArr addObject:model];
    }
}
- (NSMutableArray *)modelArr {
    
    if (!_modelArr) {
        
        _modelArr = [[NSMutableArray alloc] init];
    }
    
    return _modelArr;
}

@end

@implementation RowModel

@end
