//
//  BXForgetViewController.m
//  千机
//
//  Created by My MAC on 2017/9/8.
//  Copyright © 2017年 刘浩宇. All rights reserved.
//

#import "BXForgetViewController.h"
#import "BXResetWordViewController.h"
#import "BXEmailViewController.h"
@interface BXForgetViewController ()
@property (nonatomic ,strong) UIButton *getCodeBtn;
@property (nonatomic ,strong) NSTimer *timer;
@property (nonatomic ,assign) NSInteger timeNum;
@end

@implementation BXForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"验证手机";
    [self createUI];
}
-(void)createUI{
    
    BXTextField *_iphoneField = [[BXTextField alloc] init];
    _iphoneField.backgroundColor = RGB(245, 245, 245);
    _iphoneField.keyboardType = UIKeyboardTypeNumberPad;
    _iphoneField.layer.masksToBounds = YES;
    _iphoneField.layer.cornerRadius = 25;
    _iphoneField.placeholder = @"请输入手机号";
    _iphoneField.font  =UIFONT(15);
    _iphoneField.leftImage = @"ic-手机";
    [self.view addSubview:_iphoneField];
    [_iphoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.right.equalTo(@-30);
        make.top.equalTo(@89);
        make.height.equalTo(@44);
    }];
    BXTextField *codeField = [[BXTextField alloc] init];
    codeField.backgroundColor = RGB(245, 245, 245);
    codeField.layer.masksToBounds = YES;
    codeField.layer.cornerRadius = 25;
    codeField.placeholder = @"请输入验证码";
    codeField.font  =UIFONT(15);
    codeField.leftImage = @"ic-输入验证码";
    [self.view addSubview:codeField];
    [codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.right.equalTo(@-30);
        make.top.equalTo(_iphoneField.mas_bottom).offset(20);
        make.height.equalTo(@44);
    }];
    _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _getCodeBtn.titleLabel.font  =UIFONT(12);
    [_getCodeBtn setTitleColor:RGB(40, 47, 53) forState:UIControlStateNormal];
    [_getCodeBtn addTarget:self action:@selector(codeClick) forControlEvents:UIControlEventTouchUpInside];
    [codeField addSubview:_getCodeBtn];
    [_getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-15);
        make.centerY.equalTo(codeField);
    }];
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = UIFONT(15);
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    nextBtn.backgroundColor = [UIColor blackColor];
    nextBtn.layer.masksToBounds = YES;
    nextBtn.layer.cornerRadius = 20;
    [self.view addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@88);
        make.right.equalTo(@-88);
        make.top.equalTo(codeField.mas_bottom).offset(40);
        make.height.equalTo(@40);
    }];
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"邮箱用户找回密码，请";
    lab.textColor = RGB(100, 100, 100);
    lab.font = UIFONT(13);
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@93.5);
        make.bottom.equalTo(@-63.5);
    }];
    UIButton *emailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [emailBtn setTitle:@"点击这里" forState:UIControlStateNormal];
    emailBtn.titleLabel.font = [UIFont fontWithName:@ "PingFangSC-Medium"  size:(13)];
    [emailBtn setTitleColor:RGB(40, 47, 53) forState:UIControlStateNormal];
    emailBtn.backgroundColor = [UIColor clearColor];
    [emailBtn addTarget:self action:@selector(emailClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:emailBtn];
    [emailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lab.mas_right).offset(5);
        make.centerY.equalTo(lab);
    }];

}
-(void)codeClick{
    _timeNum = 60;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTime) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantPast]];
    _getCodeBtn.userInteractionEnabled = NO;
}
-(void)startTime{
    _timeNum--;
    [_getCodeBtn setTitle:[NSString stringWithFormat:@"%lds",(long)_timeNum] forState:UIControlStateNormal];
    if (_timeNum<0) {
        [_timer setFireDate:[NSDate distantFuture]];
        [_timer invalidate];
        _timer = nil;
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getCodeBtn.userInteractionEnabled = YES;
    }
}
-(void)emailClick{
    BXEmailViewController *emailVC = [[BXEmailViewController alloc] init];
    [self.navigationController pushViewController:emailVC animated:YES];

}
-(void)nextClick{
    BXResetWordViewController *resetWordVC = [[BXResetWordViewController alloc] init];
    [self.navigationController pushViewController:resetWordVC animated:YES];
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
