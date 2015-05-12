//
//  WBBadgeButton.m
//  新浪微博-04主框架
//
//  Created by len on 15-5-8.  haha
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBBadgeButton.h"

@implementation WBBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //badge文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //badge文字大小
        self.titleLabel.font=[UIFont systemFontOfSize:10];

    }
    return self;
}
-(void)setBadgeValue:(NSString *)badgeValue//根据传过来的badgevalue设置button大小
{
    _badgeValue=badgeValue;
    //设置文字标题
    [self setTitle:_badgeValue forState:UIControlStateNormal];
    //根据标题内容改变大小
    if (_badgeValue.length>1) {
        //计算文字所占的区域
        //1.一个数字所占的区域大小
        CGSize size=[@"1" sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];//是对数字所在区域进行拉伸
        //2.正常的button的大小就是图片的大小
        UIImage* image=[UIImage imageNamed:@"main_badge_os7"];
        //3.需要拉伸的区域就是一个文字所占的区域,计算不需要拉伸的区域
        //CGFloat offset2=(image.size.width-size.width)/2.0;
        //4.设置图片的不参与拉伸的区域（capinsets）
        //UIImage* resizeimage=[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, offset2, 0, offset2)];//上 左  下 右
        UIImage* resizeimage=[image
                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width/2.0, 0, image.size.width/2.0)];
        //设置图片
        [self setBackgroundImage:resizeimage forState:UIControlStateNormal];
        //设置button的大小,正常的图片大小已经包含了一个文字的大小，所有button的新的宽度就是图片的宽度加上多余文字的宽度
        self.bounds=CGRectMake(0, 0, image.size.width+size.width*(_badgeValue.length-1), image.size.height);
        
    }
    else
    {
        //直接是图片的大小
        UIImage* image=[UIImage imageNamed:@"main_badge_os7"];
        [self setBackgroundImage:image forState:UIControlStateNormal];
        self.bounds=CGRectMake(0, 0, image.size.width, image.size.height);
    }
}
#pragma mark 设置按钮的左上角坐标
-(void)setPoint:(CGPoint)point
{
    self.frame=(CGRect){point,self.bounds.size};

}
@end
