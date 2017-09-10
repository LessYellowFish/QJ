//
//  BXReginstViewController.m
//  千机
//
//  Created by My MAC on 2017/9/6.
//  Copyright © 2017年 刘浩宇. All rights reserved.
//

#import "BXReginstViewController.h"

@interface BXReginstViewController ()
@property (nonatomic, strong) BXTextField *iphoneField;
@end

@implementation BXReginstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册";
    self.titleArr = @[@"手机",@"邮箱"];
    [self createUI];
}
-(void)createUI{
    
    for (int i=0; i<2; i++) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(i*KSCREENWIDTH, 0, KSCREENWIDTH, KSCREENHEIGHT-64-44)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.scrollView addSubview:backView];
        
        _iphoneField = [[BXTextField alloc] init];
        _iphoneField.backgroundColor = RGB(245, 245, 245);
        _iphoneField.keyboardType = i==0?UIKeyboardTypeNumberPad:UIKeyboardTypeDefault;
        _iphoneField.layer.masksToBounds = YES;
        _iphoneField.layer.cornerRadius = 25;
        _iphoneField.placeholder = i==0?@"请输入手机号":@"请输入邮箱";
        _iphoneField.font  =UIFONT(15);
        _iphoneField.leftImage = i==0?@"ic-手机":@"ic-邮箱";
        [backView addSubview:_iphoneField];
        [_iphoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@30);
            make.right.equalTo(@-30);
            make.top.equalTo(self.topView.mas_bottom).offset(25);
            make.height.equalTo(@44);
        }];
        BXTextField *codeField;
        if (i==0) {
            codeField = [[BXTextField alloc] init];
            codeField.backgroundColor = RGB(245, 245, 245);
            codeField.layer.masksToBounds = YES;
            codeField.layer.cornerRadius = 25;
            codeField.placeholder = @"请输入验证码";
            codeField.font  =UIFONT(15);
            codeField.leftImage = @"ic-输入验证码";
            [backView addSubview:codeField];
            [codeField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@30);
                make.right.equalTo(@-30);
                make.top.equalTo(_iphoneField.mas_bottom).offset(20);
                make.height.equalTo(@44);
            }];
            UIButton *getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            getCodeBtn.titleLabel.font  =UIFONT(12);
            [getCodeBtn setTitleColor:RGB(40, 47, 53) forState:UIControlStateNormal];
            [codeField addSubview:getCodeBtn];
            [getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(@-15);
                make.centerY.equalTo(codeField);
            }];
        }
       
        BXTextField *passWordField = [[BXTextField alloc] init];
        passWordField.backgroundColor = RGB(245, 245, 245);
        passWordField.layer.masksToBounds = YES;
        passWordField.layer.cornerRadius = 25;
        passWordField.secureTextEntry = YES;
        passWordField.placeholder = @"请输入密码";
        passWordField.font  =UIFONT(15);
        passWordField.leftImage = @"ic-输入密码";
        [backView addSubview:passWordField];
        [passWordField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@30);
            make.right.equalTo(@-30);
            make.height.equalTo(@44);
            if (i==0) {
                make.top.equalTo(codeField.mas_bottom).offset(15);
            }else{
                make.top.equalTo(_iphoneField.mas_bottom).offset(15);
            }
        }];
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginBtn setTitle:@"完成" forState:UIControlStateNormal];
        loginBtn.titleLabel.font = UIFONT(15);
        [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        loginBtn.backgroundColor = [UIColor blackColor];
        loginBtn.layer.masksToBounds = YES;
        loginBtn.layer.cornerRadius = 20;
        [backView addSubview:loginBtn];
        [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@88);
            make.right.equalTo(@-88);
            make.top.equalTo(passWordField.mas_bottom).offset(40);
            make.height.equalTo(@40);
        }];
        
        UILabel *lab = [[UILabel alloc] init];
        lab.text = @"与";
        lab.textColor = RGB(100, 100, 100);
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = UIFONT(13);
        [backView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@-40);
            make.centerX.equalTo(backView);
        }];
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setTitle:@"使用条款" forState:UIControlStateNormal];
        [leftBtn setTitleColor:RGB(40, 47, 53) forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont fontWithName:@ "PingFangSC-Medium"  size:(13)];
        leftBtn.backgroundColor = [UIColor clearColor];
        [backView addSubview:leftBtn];
        [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(lab);
            make.right.equalTo(lab.mas_left).offset(-5);
        }];
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBtn setTitle:@"隐私协议" forState:UIControlStateNormal];
        [rightBtn setTitleColor:RGB(40, 47, 53) forState:UIControlStateNormal];
        rightBtn.titleLabel.font = [UIFont fontWithName:@ "PingFangSC-Medium"  size:(13)];
        rightBtn.backgroundColor = [UIColor clearColor];
        [backView addSubview:rightBtn];
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(lab);
            make.left.equalTo(lab.mas_right).offset(5);
        }];
        UILabel *lab1 = [[UILabel alloc] init];
        lab1.text = @"点击完成表示您已经阅读并同意";
        lab1.textColor = RGB(100, 100, 100);
        lab1.textAlignment = NSTextAlignmentCenter;
        lab1.font = UIFONT(13);
        [backView addSubview:lab1];
        [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(lab.mas_top).offset(-5);
            make.centerX.equalTo(backView);
        }];
        
    }
    
    
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
