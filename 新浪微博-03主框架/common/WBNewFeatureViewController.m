//
//  WBNewFeatureViewController.m
//  新浪微博-03主框架
//
//  Created by DuChunhui on 15/5/11.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBNewFeatureViewController.h"
#define PAGE_COUNT 3

@interface WBNewFeatureViewController()
@property(strong,nonatomic)UIPageControl* pageController;

@end


@implementation WBNewFeatureViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
   

    [self setupController];
    [self setupScrollView];
      
    
    }
   


-(void)setupController
{ //添加Pagecontroller
    UIPageControl* pageController=[[UIPageControl alloc]init];
    
    
    //页数
    
    pageController.numberOfPages=PAGE_COUNT;
    pageController.currentPage=0;
    //颜色
    pageController.bounds=CGRectMake(0, 0, 100, 30);
    pageController.center=CGPointMake(160, 300);
    //事件响应
    [pageController addTarget:self action:@selector(pageControllerChange:) forControlEvents:UIControlEventValueChanged];
    pageController.currentPageIndicatorTintColor=[UIColor redColor];
    pageController.pageIndicatorTintColor=[UIColor grayColor];
    self.pageController=pageController;
    [self.view addSubview:pageController];


}

-(void)setupScrollView
{

    //创建scrollview
    self.scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.scrollView];
    
    //创建imageView
    for (int i=0; i<PAGE_COUNT; i++) {
        NSString* imageName=[NSString stringWithFormat:@"new_feature_%d",i+1];
        UIImage* image= [UIImage imageNamed:imageName];
        UIImageView* imageView=[[UIImageView alloc]initWithImage:image];
        
        imageView.frame=CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        //如果是第三站，加按钮
        if(i==PAGE_COUNT-1)
            
        {
            //开启imageview用户交互功能
            imageView.userInteractionEnabled=YES;
            UIButton* checkBox=[[UIButton alloc]init];
            UIImage* image= [UIImage imageNamed:@"new_feature_share_true"];
            [checkBox setImage:image forState:UIControlStateNormal];
            
            [checkBox setImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateSelected];
            checkBox.selected=NO;
            
           //位置
            checkBox.bounds=CGRectMake(0, 0, image.size.width, image.size.height);
            checkBox.center=CGPointMake(120, 200);
            //添加事件
            [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:checkBox];
            
            //label
            UILabel *label=[[UILabel alloc]init];
            label.text=@"分享给好友";
            label.frame=CGRectMake(CGRectGetMaxX(checkBox.frame), CGRectGetMidY(checkBox.frame), 100, 30);
            [imageView addSubview:label];
            UIButton *startBtn=[[UIButton alloc]init];
            //添加文字
            [startBtn setTitle:@"开始使用" forState:UIControlStateNormal];
            //开始按钮
            [startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            UIImage* image2= [UIImage imageNamed:@"new_feature_finish_button"];
            [startBtn setBackgroundImage:image2 forState:UIControlStateNormal];
            [startBtn setImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
            startBtn.bounds=CGRectMake(0, 0, image2.size.width, image2.size.height);
            startBtn.center=CGPointMake(160, CGRectGetMaxY(checkBox.frame)+30);
           //添加事件
            [startBtn addTarget:self action:@selector(startBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [imageView addSubview:startBtn];
        }
        
        [self.scrollView addSubview:imageView];
    }
        self.scrollView.contentSize=CGSizeMake(self.view.frame.size.width*PAGE_COUNT, 0);
        self.scrollView.pagingEnabled=YES;
        self.scrollView.delegate=self;}



#pragma mark checkBox事件响应
-(void)checkBoxClicked:(UIButton *)sender
{
    
    sender.selected=!sender.selected;

    
    
}
#pragma mark startbutton事件响应
-(void)startBtnClicked:(UIButton *)sender
{
    

}
#pragma mark pageController事件响应
-(void)pageControllerChange:(UIPageControl *)sender
{
    self.scrollView.contentSize=CGSizeMake(self.view.frame.size.width*sender.currentPage, 0);


}
#pragma mark -scrollview delegate method
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger pageNo= scrollView.contentOffset.x/self.view.frame.size.width;
    self.pageController.currentPage=pageNo;


}

@end
