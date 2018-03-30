//
//  HeroSkinViewController.m
//  MoveTableView
//
//  Created by wenHao Qiu on 2018/3/30.
//  Copyright © 2018年 文豪. All rights reserved.
//

#import "HeroSkinViewController.h"

#define ScreenWidth                   [[UIScreen mainScreen] bounds].size.width

#define ScreenHeight                  [[UIScreen mainScreen] bounds].size.height

@interface HeroSkinViewController ()

@end

@implementation HeroSkinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"皮肤";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
    
    UIImage *image = [UIImage imageNamed:self.img];
    
    CGFloat width = CGImageGetWidth(image.CGImage);
    
    CGFloat height = CGImageGetHeight(image.CGImage);
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    scroll.contentSize = image.size;
    
    [img setImage:image];
    
    [scroll addSubview:img];
    
    [self.view addSubview:scroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
