//
//  HeroTableViewCell.m
//  MoveTableView
//
//  Created by wenHao Qiu on 2018/3/30.
//  Copyright © 2018年 文豪. All rights reserved.
//

#import "HeroTableViewCell.h"

@interface HeroTableViewCell ()

/**
 *  图片imgView
 */
@property (nonatomic, strong) UIImageView * pictureView;

/**
 *  标题label
 */
@property (nonatomic, strong) UILabel * titleLabel;

/**
 *  内容Label
 */
@property (nonatomic, strong) UILabel * littleLabel;

@end

@implementation HeroTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //取消选中效果
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        //裁剪看不到的
        self.clipsToBounds = YES;
    }
    return self;
    
}

- (void)setModel:(RowModel *)model {
    
    _model = model;
    
    //pictureView的Y往上加一半cellHeight 高度为2 * cellHeight，这样上下多出一半的cellHeight
    _pictureView = [[UIImageView alloc] init];
    
    _pictureView.contentMode = UIViewContentModeScaleAspectFill;
    
    [_pictureView setImage:[UIImage imageNamed:model.img]];
    
    _pictureView.frame = CGRectMake(0, -model.cellH/2, ScreenWidth, model.cellH * 2);
    
    [self.contentView addSubview:_pictureView];
}

- (CGFloat)cellOffset {
    
    CGRect toWindow = [self convertRect:self.bounds toView:self.window];
    
    //获取父视图的中心
    CGPoint windowCenter = self.window.center;
    
    //cell在y轴上的位移  CGRectGetMidY获取中心点的Y值
    CGFloat cellOffsetY = CGRectGetMidY(toWindow) - windowCenter.y;
    
    //位移比例
    CGFloat offsetDig = 2 * cellOffsetY / self.window.frame.size.height ;
    
    //要补偿的位移
    CGFloat offset =  -offsetDig * self.model.cellH/2;
    
    //让pictureViewY轴方向位移offset
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);
    
    self.pictureView.transform = transY;
    
    return offset;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
