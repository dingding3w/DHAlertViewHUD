//
//  ViewController.m
//  DHAlertViewHUDExample
//
//  Created by Apple on 16/7/19.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "ViewController.h"
#import "DHAlertViewHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 无按钮自动消失样式
- (IBAction)automaticallyDisappearButtonClick:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"自动消失" cancelButtonTitle:nil otherButtonTitle:nil alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"SDK会自动检测,当无按钮显示时HUD自动消失");
    }];
    [alertView showDHAlertViewHUD];
}

#pragma mark - 从上面滑落弹出样式
- (IBAction)aboveSlipButtonClock:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"AlertViewHUD从顶部滑落弹出" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
    }];
    [alertView setAlertViewAnimationStyle:DDShowAlertViewAnimationStyleTop];
    [alertView showDHAlertViewHUD];
}

#pragma mark - 从左边平滑弹出样式
- (IBAction)leftSmoothButtonClick:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"AlertViewHUD从左侧平滑弹出" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
    }];
    [alertView setAlertViewAnimationStyle:DDShowAlertViewAnimationStyleLeft];
    [alertView showDHAlertViewHUD];
}

#pragma mark - 从下面上升弹出样式
- (IBAction)followingUpButtonClick:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"AlertViewHUD从下边上升弹出" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
    }];
    [alertView setAlertViewAnimationStyle:DDShowAlertViewAnimationStyleBottom];
    [alertView showDHAlertViewHUD];
}

#pragma mark - 从右边平滑弹出样式
- (IBAction)rightSmoothButtonClick:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"AlertViewHUD从右边平滑弹出" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
    }];
    [alertView setAlertViewAnimationStyle:DDShowAlertViewAnimationStyleRight];
    [alertView showDHAlertViewHUD];
}

#pragma mark - 默认样式
- (IBAction)defaultStyleButtonClick:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"AlertViewHUD默认样式" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
    }];
    [alertView showDHAlertViewHUD];
}

#pragma mark - 单个按钮弹出/消失样式
- (IBAction)singleButtonClick:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"AlertViewHUD单个按钮样式" cancelButtonTitle:@"取消" otherButtonTitle:nil alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
    }];
    [alertView setAlertViewAnimationStyle:DDShowAlertViewAnimationStyleTop];
    [alertView showDHAlertViewHUD];
}

#pragma mark - DHAlertViewHUD随机样式
- (IBAction)randomStylesButtonClick:(id)sender {
    DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"AlertViewHUD单个按钮样式" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
    }];
    [alertView setAlertViewAnimationStyle:arc4random() % 5];
    NSLog(@"%d", arc4random() % 5);
    [alertView showDHAlertViewHUD];
}

@end
