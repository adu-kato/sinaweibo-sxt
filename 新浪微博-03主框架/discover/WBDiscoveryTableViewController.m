//
//  WBDiscoveryTableViewController.m
//  新浪微博-03主框架
//
//  Created by len on 15-5-7.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "WBDiscoveryTableViewController.h"
#import "UIBarButtonItem+custom.h"
@interface WBDiscoveryTableViewController ()

@end

@implementation WBDiscoveryTableViewController

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
    UITextField* searchBar=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    
    //设置放大镜图片
    UIImageView* imageView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
    searchBar.leftView=imageView;
    [imageView setBounds:CGRectMake(0, 0, 40, 30)];
   //设置居中显示
    imageView.contentMode=UIViewContentModeCenter;
    //设置永远显示
    searchBar.leftViewMode=UITextFieldViewModeAlways;
    UIImage* image= [UIImage imageNamed:@"searchbar_textfield_background_os7"];
    
    [searchBar setBackground:image];
    //设置默认提示文字
    [searchBar setPlaceholder:@"搜索"];
    //显示快速删除
    searchBar.clearButtonMode=UITextFieldViewModeWhileEditing;
    //修改键盘的return键
    searchBar.returnKeyType=UIReturnKeySearch;           
    searchBar.enablesReturnKeyAutomatically=YES;
    
    //设置textfield大小
    
    searchBar.bounds=CGRectMake(0, 0, self.view.frame.size.width, 30);
    self.navigationItem.titleView=searchBar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
