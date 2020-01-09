//
//  MyTableViewController.m
//  UITableViewController
//
//  Created by jelly on 2020/1/7.
//  Copyright © 2020 jelly. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
{
    NSMutableArray<NSString*> *tableData;
    NSArray<NSArray*> *generalArray;
    NSInteger index;
    
    UIRefreshControl *refreshControl;
}
@end

/// <#Description#>
@implementation MyTableViewController

/// <#Description#>
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    index = 0;
    tableData = [[NSMutableArray alloc] init];
    NSArray<NSString*> *array1 = @[@"吕布",@"赵云",@"典韦",@"关羽",@"马超",@"张飞",@"黄忠",@"许褚"];
    NSArray<NSString*> *array2 = @[@"孙策",@"太史慈",@"夏侯惇",@"张辽",@"张郃",@"徐晃",@"庞德",@"甘宁"];
    NSArray<NSString*> *array3 = @[@"周泰",@"魏延",@"张绣",@"颜良",@"文丑",@"邓艾",@"姜维"];
    generalArray = [[NSArray alloc] initWithObjects:array1, array2, array3, nil];
    
    [tableData addObjectsFromArray:array1];
    [tableData addObjectsFromArray:array2];
    [tableData addObjectsFromArray:array3];
    
    //创建UITableView对象
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0)];
    [headerLabel setText:@"三国名将"];
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.backgroundColor = [UIColor cyanColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    //设置UITableView的页眉控件
    [self.tableView setTableHeaderView:headerLabel];
    
//    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
//    [footerLabel setText:@"以上城市房价太高"];
//    //设置UITableView页脚控件
//    [self.tableView setTableFooterView:footerLabel];
    
    //设置行cell高（默认44px）
//    [self.tableView setRowHeight:50];
    //设置分割线颜色
//    [self.tableView setSeparatorColor:[UIColor redColor]];
    //设置分割线风格
    
    /**
     *  UITableViewCellSeparatorStyleNone 不使用分割线
     UITableViewCellSeparatorStyleSingleLine 使用分割线
     UITableViewCellSeparatorStyleSingleLineEtched 在有组的情况使用分割线
     */
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    // 设置UITableView的背景颜色
    [self.tableView setBackgroundColor:[UIColor lightGrayColor]];
    
    // 设置数据源代理，必须实现协议UITableViewDataSource中的相关方法
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //复用标志
    static NSString * cellId = @"Cell";
    
    /*
     dequeueReusableCellWithIdentifier:内部采用了复用队列
     每次调用dequeueReusableCellWithIdentifier:cellId
     都会从复用队列中 查看 有没有 不在屏幕上显示的空闲的可用的cell
     //如果没有 返回 nil             ,那么就创建新的cell
     //如果有可用的cell 返回cell地址   ,那么就复用
     
     最多创建cell 个数 一屏 + 1个
     只要cell 离开屏幕 就 会 空闲可复用
     */
    //从复用队列获取可用的
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        //表示没有 可复用的空闲的cell
        //创建新的cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    //获取指定的数据
    cell.textLabel.text= [tableData objectAtIndex:indexPath.row];
    

    cell.imageView.image=[UIImage imageNamed:@"photo"];
    
    //每一行 右侧小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = [tableData objectAtIndex:indexPath.row];
    NSString *message = [NSString stringWithFormat:@"%@ 三图著名人物...", title];
    [self showAlertTitle:title massage:message];
}

- (void) showAlertTitle:(NSString*)title massage:(NSString*)message {
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertCtl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点了取消");
    }]];
    
    [self presentViewController:alertCtl animated:true completion:nil];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
