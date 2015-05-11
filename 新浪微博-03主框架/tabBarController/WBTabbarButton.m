//
//  WBTabbarButton.m
//  新浪微博-03主框架
//
//  Created by len on 15-5-8.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBTabbarButton.h"
#import "WBBadgeButton.h"
#define RATIO 0.7
@implementation WBTabbarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //字体大小
        self.titleLabel.font=[UIFont systemFontOfSize:11.0];
        //图片居中
        [self.imageView setContentMode:UIViewContentModeCenter];
        //文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    return self;
}
//重写item的设置方法
-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    //设置文字
    [self setTitle:item.title forState:UIControlStateNormal];
    
    //设置图片
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    //设置badgeValue
    if (item.badgeValue.length>0) {//说明badgeValue有内容
        WBBadgeButton* badgeButton=[[WBBadgeButton alloc]init];
        
        badgeButton.badgeValue=_item.badgeValue;
        
//        UIImage* image=[[UIImage imageNamed:@"main_badge_os7"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
//        
//        [badgeButton setBackgroundImage:image forState:UIControlStateNormal];
       
        
        
    [self addSubview:badgeButton];
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    for(UIView *subview  in self.subviews )
    {
        //取出文字所占区域的大小
        if ([subview isKindOfClass:[WBBadgeButton class]]) {
            //subview.frame = CGRectMake(self.bounds.size.width - subview.bounds.size.width - 5, 0.0,subview.bounds.size.width, subview.bounds.size.height);
            [(WBBadgeButton*)subview setPoint:CGPointMake(self.bounds.size.width-subview.bounds.size.width, 0)];
        }
    }
}
#pragma mark  设置图像位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x=0.0;
    CGFloat y=0.0;
    CGFloat imageWidth=contentRect.size.width;
    CGFloat imageHeight=contentRect.size.height*RATIO;
    return CGRectMake(x, y, imageWidth, imageHeight);
}
#pragma mark  设置标题的位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x=0.0;
    CGFloat y=contentRect.size.height*RATIO;
    CGFloat titleWidth=contentRect.size.width;
    CGFloat titleHeight=contentRect.size.height*(1-RATIO);
    return CGRectMake(x, y, titleWidth, titleHeight);
}


@end
