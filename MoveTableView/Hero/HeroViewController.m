//
//  HeroViewController.m
//  MoveTableView
//
//  Created by wenHao Qiu on 2018/3/30.
//  Copyright © 2018年 文豪. All rights reserved.
//

#import "HeroViewController.h"
#import "HeroTableViewCell.h"
#import "HeroSkinViewController.h"

@interface HeroViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic, strong) HeroModel *model;

@end

@implementation HeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"英雄";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"yasuo",@"xiaoyu",@"nvqiang",@"aike",@"vn",@"huonan",@"jie",@"baoshi",@"yaoji",@"jin",@"laoshu",@"nvjing",@"timor",@"pansen",@"kate",@"dazui",@"weilusi",@"niutou",@"shitou",@"lisangzhuo",@"rinv",@"jinkesi",@"jiansheng",@"kasading",@"debang",@"dashu",@"baonv",@"dachongzi",@"xiaofa",@"anni",@"chuishi",@"nanqiang",@"taitan",@"jiesi",@"jianji",@"eyu",@"nuoke",@"chuangzhang",@"wuqi",@"wangling",@"manzi",@"zelasi", nil];
    
    _model = [[HeroModel alloc] init];
    
    _model.imgArr = self.dataArray;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, ScreenWidth, ScreenHeight + 64) style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate  = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[HeroTableViewCell class] forCellReuseIdentifier:@"HeroTableViewCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RowModel *model = _model.modelArr[indexPath.row];
    
    return model.cellH;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeroTableViewCell"];
    
    // 添加3DTouch效果 对每个cell指定代理
    if (@available(iOS 9.0, *)) {
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    } else {
        // Fallback on earlier versions
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HeroSkinViewController * skin = [[HeroSkinViewController alloc]init];
    
    skin.img = self.dataArray[indexPath.row];
    
    [self.navigationController pushViewController:skin animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HeroTableViewCell * heroCell = (HeroTableViewCell *)cell;
    
    RowModel *model = _model.modelArr[indexPath.row];
    
    [heroCell setModel:model];
    
    //需要在这调用一下，不写这句在滑动之前图片位置不对
    [heroCell cellOffset];
}

#pragma mark -- UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{

    if (@available(iOS 9.0, *)) {
        
        //    CGPoint point = [self.tableView convertPoint:location fromView:self.view];
        //    NSIndexPath * indexpath = [self.tableView indexPathForRowAtPoint:point];
        
        NSIndexPath * indexpath = [self.tableView indexPathForCell:(UITableViewCell* )[previewingContext sourceView]];
        
        HeroSkinViewController * skin = [[HeroSkinViewController alloc]init];
        
        skin.img = self.dataArray[indexpath.row];
        
        return skin;
    } else {
        // Fallback on earlier versions
    }
    
    return 0;
}
//手指长安
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSArray *array = [self.tableView visibleCells];
    
    [array enumerateObjectsUsingBlock:^(HeroTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj cellOffset];
        
    }];
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
