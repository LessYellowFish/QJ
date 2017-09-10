//
//  BXSettingPasterViewController.m
//  千机
//
//  Created by My MAC on 2017/9/9.
//  Copyright © 2017年 刘浩宇. All rights reserved.
//

#import "BXSettingPasterViewController.h"

@interface BXSettingPasterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArr;
@end

@implementation BXSettingPasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(250, 250, 250);
    self.title = @"设置";
    _titleArr = @[@[@"名称",@"图片",@"分类",@"设备铃声"],@[@"激活时间",@"设备ID",@"固件更新"]];
    [self createTableView];
}
-(void)createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, KSCREENHEIGHT-64) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollEnabled = NO;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_titleArr[section] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section==1?31.5:0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0 && indexPath.row==1) {
        return 75;
    }
    return 45;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIView *view = [[UIView alloc] init];
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"设备信息";
    lab.textColor = RGB(100, 100, 100);
    lab.font = UIFONT(12);
    [view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(view);
    }];
    if (section==0) {
        return nil;
    }
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _titleArr[indexPath.section][indexPath.row];
    cell.textLabel.textColor = RGB(50, 50, 50);
    cell.textLabel.font = UIFONT(15);
    if (indexPath.section==0 && indexPath.row==1) {
        UIImageView *imageVC = [[UIImageView alloc] init];
        imageVC.backgroundColor = [UIColor redColor];
        //imageVC.image = _headImage;
        imageVC.layer.masksToBounds = YES;
        imageVC.layer.cornerRadius = 27.5;
        [cell addSubview:imageVC];
        [imageVC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-35);
            make.centerY.equalTo(cell.contentView);
            make.width.height.equalTo(@55);
        }];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else {
        UILabel *lab = [[UILabel alloc] init];
        lab.text = @"自行车";
        lab.textAlignment = NSTextAlignmentRight;
        lab.textColor = RGB(100, 100, 100);
        lab.font = UIFONT(13);
        [cell addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView);
            make.right.equalTo(@-35);
        }];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    UILabel *lineLab = [[UILabel alloc] init];
    lineLab.backgroundColor = RGB(250, 250, 250);
    [cell.contentView addSubview:lineLab];
    [lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.height.equalTo(@1);
        make.right.bottom.equalTo(@0);
    }];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
