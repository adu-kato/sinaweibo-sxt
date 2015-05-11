//
//  WBTabbar.m
//  新浪微博-03主框架
//
//  Created by len on 15-5-7.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBTabbar.h"
#import "WBTabbarButton.h"
@interface WBTabbar()
@property(strong,nonatomic)UIButton* selectedButton;//被选中的button
@end
@implementation WBTabbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor whiteColor];
        
    }
    return self;
}
//只管添加button
-(void)addButtonWithTabbarItem:(UITabBarItem *)tabbarItem
{
    WBTabbarButton* button=[[WBTabbarButton alloc]init];
    button.item=tabbarItem;
    //给button添加点击事件
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    //设置按钮的tag，便于知道按的时哪个按钮
    button.tag=self.subviews.count;
    
    [self addSubview:button];
    
    //设置执行程序时。第一个按钮被默认选中
    if (self.subviews.count>0) {//里面有一个控件
        [self.subviews[0] setSelected:YES];
        self.selectedButton=self.subviews[0];//记录第一个button为被选中的button
    }
    if (self.subviews.count==4) {
        [self createAddButton];
    }
}
-(void)createAddButton
{
    //创建加号按钮
    UIButton* addbutton=[[UIButton  alloc]init];
    [addbutton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_os7"] forState:UIControlStateNormal    ];
    [addbutton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_os7"] forState:UIControlStateNormal];
    [self insertSubview:addbutton atIndex:2];
}
#pragma mark 按钮事件处理
-(void)buttonClicked:(WBTabbarButton *)sender
{
    if ([sender isEqual:self.selectedButton]) {
        return;
    }
    else
    {
        //取消之前选中的button
        [self.selectedButton setSelected:NO];
        //设置当前选中的button
        [sender setSelected:YES];
        self.selectedButton=sender;
    }
    //调用代理的方法，将选中了哪个按钮的tag传给控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {//如果代理能够响应tabBar:didSelectIndex:这个方法  再去调用下面的方法  保证程序稳定
        [self.delegate tabBar:self didSelectIndex:sender.tag];

    }
    }
//重新布局时调用此方法
-(void)layoutSubviews
{
    [super layoutSubviews];
    //此处可以确定有几个按钮可以确定按钮大小和位置
    CGFloat gap=5.0;//间隔
    CGFloat x=gap;
    CGFloat y=gap;
    CGFloat width=(self.bounds.size.width-gap*(self.subviews.count+1))/self.subviews.count;
    CGFloat height=self.bounds.size.height-2.0*gap;
    
    for (int i=0; i<self.subviews.count; i++) {
        UIButton* button=self.subviews[i];
        button.frame=CGRectMake(x+i*(gap+width), y, width, height);
    }
}


@end
