//
//  SCHomeCell.m
//  ScreenShotCat
//
//  Created by Dolan on 2019/5/16.
//  Copyright © 2019 chen. All rights reserved.
//

#import "SCHomeCell.h"

@implementation SCHomeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubview];
    }
    return self;
}

-(void)createSubview
{
    for (int i = 0; i < 8; i++) {
        NSInteger index = i % 4;
        NSInteger page = i / 4;
        NSInteger w = SCREEN_WIDTH/4;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(index*w, page*w, w, w);
        [button setImage:[UIImage imageNamed:@"路径 1"] forState:UIControlStateNormal];
        [button setTitle:@"模拟器" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [button setImageEdgeInsets:UIEdgeInsetsMake(-button.titleLabel.intrinsicContentSize.height, 0, 0, -button.titleLabel.intrinsicContentSize.width)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(button.currentImage.size.height+10, -button.currentImage.size.width, 0, 0)];
        [self.contentView addSubview:button];
    }
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
