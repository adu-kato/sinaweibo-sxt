//
//  WBTitleButton.m
//  新浪微博-03主框架
//
//  Created by DuChunhui on 15/5/11.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBTitleButton.h"
#define TITLE_FONT [UIFont systemFontOfSize:17]
@interface WBTitleButton()
@property(assign,nonatomic) CGFloat labelWidth;
@property(assign,nonatomic) CGFloat imageWidth;
@end
@implementation WBTitleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      //  UIButton* titleButton=[[UIButton alloc]init];
        
        [self setTitle:@"首页" forState:UIControlStateNormal];
        //[self setTitle:@"首页" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImage* image=[UIImage imageNamed:@"navigationbar_arrow_down_os7"];
        self.titleLabel.font=TITLE_FONT;
        self.imageWidth=image.size.width;
        
      
        
        [self setImage:image forState:UIControlStateNormal];
        self.imageView.contentMode=UIViewContentModeCenter;
    
    }
    return self;
}


#pragma mark 重写button settitle方法，计算文字大小

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self setTitleString:title];
    
    CGSize size=[self.TitleString sizeWithAttributes:@{NSFontAttributeName:TITLE_FONT}];
    self.labelWidth=size.width;

}

#pragma mark 重写layout subview,重写button大小
-(void)layoutSubviews
{
    [super layoutSubviews];
        self.bounds=CGRectMake(0, 0, self.labelWidth+self.imageWidth, 30);

}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x=0.0;
    CGFloat y=0.0;
   
  
    return CGRectMake(x, y,self.labelWidth, contentRect.size.height);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect

{
  

   
    CGFloat x=self.labelWidth;
    CGFloat y=0.0;

 return CGRectMake(x, y,self.imageWidth, contentRect.size.height);
}

@end
