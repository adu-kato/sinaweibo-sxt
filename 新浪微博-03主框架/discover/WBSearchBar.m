//
//  WBSearchBar.m
//  新浪微博-03主框架
//
//  Created by DuChunhui on 15/5/11.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBSearchBar.h"

@implementation WBSearchBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置放大镜图片
        UIImageView* imageView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        self.leftView=imageView;
        [imageView setBounds:CGRectMake(0, 0, 40, 30)];
        //设置居中显示
        imageView.contentMode=UIViewContentModeCenter;
        //设置永远显示
        self.leftViewMode=UITextFieldViewModeAlways;
        UIImage* image= [UIImage imageNamed:@"searchbar_textfield_background_os7"];
        
        [self setBackground:image];
        //设置默认提示文字
        [self setPlaceholder:@"搜索"];
        //显示快速删除
        self.clearButtonMode=UITextFieldViewModeWhileEditing;
        //修改键盘的return键
        self.returnKeyType=UIReturnKeySearch;
        self.enablesReturnKeyAutomatically=YES;
        
        //设置textfield大小
//        
//        self.bounds=CGRectMake(0, 0, self.view.frame.size.width, 30);
//        self.navigationItem.titleView=self;

    }
    return self;
}
@end
