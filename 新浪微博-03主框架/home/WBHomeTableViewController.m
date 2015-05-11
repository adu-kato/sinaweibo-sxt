//
//  WBHomeTableViewController.m
//  新浪微博-03主框架
//
//  Created by len on 15-5-7.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBHomeTableViewController.h"
#import  "WBTitleButton.h"
#import "UIBarButtonItem+custom.h"
@interface WBHomeTableViewController ()

@end

@implementation WBHomeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置navigationbar
//    //1.左边按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem CustomButtonItemWithNormal:@"navigationbar_friendsearch_os7" hightLighted:@"navigationbar_friendsearch_highlighted_os7"];
    
//    [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_friendsearch_os7"] style:UIBarButtonItemStylePlain target:nil action:nil];

    
    
    
    //2.中间标题
    //self.navigationItem.title=@"首页";
    WBTitleButton* titleButton=[[WBTitleButton alloc]init];


    [titleButton setTitle:@"北京尚学堂" forState:UIControlStateNormal];
    
    self.navigationItem.titleView=titleButton;
    //3.右边的按钮
  

     self.navigationItem.rightBarButtonItem=[UIBarButtonItem CustomButtonItemWithNormal:@"navigationbar_pop_os7" hightLighted:@"navigationbar_pop_highlighted_os7"];
    
}


//-(UIBarButtonItem *)CustomButtonItemWithNormal:(NSString *)normalImage hightLighted:(NSString *)hightedImage
//{
//    UIButton* btn=[[UIButton alloc]init];
//    UIImage* image= [UIImage imageNamed:normalImage];
//    UIImage* image2= [UIImage imageNamed:hightedImage ];
//    [btn setImage:image forState:UIControlStateNormal];
//    [btn setImage:image2 forState:UIControlStateHighlighted];
//    btn.bounds=CGRectMake(0, 0, image.size.width, image.size.height);
//   return [[UIBarButtonItem alloc]initWithCustomView:btn];
//
//}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.从重用对象池中找到cell对象
    static NSString* cellID=@"mycell";
    UITableViewCell* cell=[self.tableView dequeueReusableCellWithIdentifier:cellID];
    //2.如果没有找到就自己创建对象
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //3.设置cell属性
    cell.textLabel.text=@"测试数据";
    return cell;
}
//点击某一单元格时跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController* vc=[[UIViewController alloc]init];
    //当跳转到下一个控制器时    下面的条会隐藏

    [self.navigationController pushViewController:vc animated:YES];
}

@end
