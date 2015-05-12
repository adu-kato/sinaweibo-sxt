//
//  UIBarButtonItem+custom.m
//  新浪微博-03主框架
//
//  Created by DuChunhui on 15/5/11.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "UIBarButtonItem+custom.h"

@implementation UIBarButtonItem (custom)
+(UIBarButtonItem *)CustomButtonItemWithNormal:(NSString *)normalImage hightLighted:(NSString *)hightedImage
{
    UIButton* btn=[[UIButton alloc]init];
    UIImage* image= [UIImage imageNamed:normalImage];
    UIImage* image2= [UIImage imageNamed:hightedImage ];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:image2 forState:UIControlStateHighlighted];
    btn.bounds=CGRectMake(0, 0, image.size.width, image.size.height);
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    //ssqs
}
@end
