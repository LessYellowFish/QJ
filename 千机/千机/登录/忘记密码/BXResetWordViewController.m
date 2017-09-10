//
//  BXResetWordViewController.m
//  千机
//
//  Created by My MAC on 2017/9/8.
//  Copyright © 2017年 刘浩宇. All rights reserved.
//

#import "BXResetWordViewController.h"

@interface BXResetWordViewController ()

@end

@implementation BXResetWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"重置密码";
    [self createUI];
}
-(void)createUI{
    BXTextField *passWordField = [[BXTextField alloc] init];
    passWordField.backgroundColor = RGB(245, 245, 245);
    passWordField.layer.masksToBounds = YES;
    passWordField.layer.cornerRadius = 25;
    passWordField.secureTextEntry = YES;
    passWordField.placeholder = @"请输入6-16位新密码";
    passWordField.leftImage = @"ic-输入密码";
    passWordField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:passWordField];
    [passWordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.right.equalTo(@-30);
        make.top.equalTo(@89);
        make.height.equalTo(@44);
    }];
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn setTitle:@"确定" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = UIFONT(15);
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.backgroundColor = [UIColor blackColor];
    nextBtn.layer.masksToBounds = YES;
    nextBtn.layer.cornerRadius = 20;
    [self.view addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@88);
        make.right.equalTo(@-88);
        make.top.equalTo(passWordField.mas_bottom).offset(40);
        make.height.equalTo(@40);
    }];
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
