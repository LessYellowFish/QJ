//
//  LeHomeListController.m
//  千机
//
//  Created by 刘浩宇 on 2017/9/5.
//  Copyright © 2017年 刘浩宇. All rights reserved.
//

#import "LeHomeListController.h"
#import "BXListTableViewCell.h"
#import "BXAddPasterViewController.h"
#import "BXFriendsViewController.h"
#import "BXDetailViewController.h"
#import "ZZYSettingViewController.h"
@interface LeHomeListController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeHomeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(250, 250, 250);
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationItem.title = @"小强快叫爸爸";
    UIButton *navLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 7, 30, 30)];
    [navLeftBtn setBackgroundImage:[UIImage imageNamed:@"ic_添加"] forState:UIControlStateNormal];
    [navLeftBtn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:navLeftBtn];
    self.navigationItem.leftBarButtonItem = item;
    UIButton *navRightBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 7, 30, 30)];
    [navRightBtn setBackgroundImage:[UIImage imageNamed:@"ic_设置"] forState:UIControlStateNormal];
    [navRightBtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:navRightBtn];
    self.navigationItem.rightBarButtonItem = item1;

    [self createUI];
    [self createTableView];
    
}
-(void)leftClick{
    BXAddPasterViewController *addPasterVC = [[BXAddPasterViewController alloc] init];
    [self.navigationController pushViewController:addPasterVC animated:YES];
}

-(void)rightClick{
    ZZYSettingViewController *settingVC = [[ZZYSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}
-(void)createUI{
   
    UIImageView *imgVC = [[UIImageView alloc] init];
    imgVC.backgroundColor  =[UIColor redColor];
    imgVC.layer.masksToBounds = YES;
    imgVC.layer.cornerRadius = 15;
    [self.view addSubview:imgVC];
    [imgVC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@117);
        make.centerX.equalTo(self.view);
        make.width.height.equalTo(@30);
    }];
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"当前尚未绑定贴片";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = RGB(50, 50, 50);
    lab.font = UIFONT(15);
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgVC.mas_bottom).offset(13);
        make.centerX.equalTo(self.view);
    }];
    
}
-(void)createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, KSCREENWIDTH, KSCREENHEIGHT-64-49) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 200;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [tableView registerClass:[BXListTableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BXListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BXDetailViewController *detailVC = [[BXDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
