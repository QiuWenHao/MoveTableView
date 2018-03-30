//
//  HeroModel.h
//  MoveTableView
//
//  Created by wenHao Qiu on 2018/3/30.
//  Copyright © 2018年 文豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ScreenWidth                   [[UIScreen mainScreen] bounds].size.width

#define ScreenHeight                  [[UIScreen mainScreen] bounds].size.height

@interface HeroModel : NSObject

@property (nonatomic,strong)  NSArray *imgArr;

@property (nonatomic, strong) NSMutableArray *modelArr;

@end

@interface RowModel : NSObject

@property (nonatomic,copy)    NSString *img;

@property (nonatomic, assign) CGFloat cellH;

@end
