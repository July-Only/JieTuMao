//
//  SCHomeViewController.m
//  ScreenShotCat
//
//  Created by chen on 2019/5/12.
//  Copyright © 2019 chen. All rights reserved.
//

#import "SCHomeViewController.h"
#import "ATCarouselView.h"
#import "SCHomeCell.h"

@interface SCHomeViewController ()<UITableViewDelegate,UITableViewDataSource,ATCarouselViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ATCarouselView *headerView;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@end

@implementation SCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bg_createTableview];
}

-(void)bg_createTableview
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(ATCarouselView*)headerView
{
    if(!_headerView){
        _headerView = [[ATCarouselView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        _headerView.delegate = self;
        _headerView.images = @[
                               [UIImage imageNamed:@"0.jpg"],
                               [UIImage imageNamed:@"1.jpg"],
                               [UIImage imageNamed:@"2.jpg"],
                               [UIImage imageNamed:@"3.jpg"],
                               [UIImage imageNamed:@"4.jpg"]
                               ];
        _headerView.currentPageColor = [UIColor orangeColor];
        _headerView.pageColor = [UIColor grayColor];
    }
    return _headerView;
}

#pragma mark -UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCHomeCell *cell =[tableView dequeueReusableCellWithIdentifier:@"HomeCell"];;
    if (!cell) {
        cell = [[SCHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeCell"];
    }

//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"微微";
    }
    return @"支支";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
