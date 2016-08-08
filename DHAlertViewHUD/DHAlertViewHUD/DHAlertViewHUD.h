//
//  DHAlertViewHUD.h
//  DHAlertViewHUD
//
//  Created by Apple on 16/7/19.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , DDShowAlertViewAnimationStyle) {
    DDShowAlertViewAnimationStyleDefault = 0,// 缩放
    DDShowAlertViewAnimationStyleTop        ,// 上
    DDShowAlertViewAnimationStyleLeft       ,// 左
    DDShowAlertViewAnimationStyleBottom     ,// 下
    DDShowAlertViewAnimationStyleRight      ,// 右
    DDShowAlertViewAnimationStyleNO         ,// 没有
};
typedef void(^DDAlertViewHUDClickIndexBlock)(NSInteger alertViewClickIndex);

typedef NS_ENUM(NSInteger, DDAlertViewButtonStyle) {
    DDAlertViewButtonStyleInline = 0,   // 内联
    DDAlertViewButtonStylePlain,        // 平铺
};

@interface DHAlertViewHUD : UIView
@property (nonatomic, copy  ) DDAlertViewHUDClickIndexBlock alertViewClickBlock;
@property (nonatomic, assign) DDShowAlertViewAnimationStyle alertViewAnimationStyle;
@property (nonatomic, assign) DDAlertViewButtonStyle        alertViewButtonStyle;

/**
 *  自定义初始化DHAlertViewHUD
 *
 *  @param title               标题
 *  @param message             内容
 *  @param cancelButtonTitle   按钮一
 *  @param otherButtonTitle    按钮二
 *  @param alertViewClickBlock 点击按钮回调Block(内联方法block)
 *
 *  @return 自定义初始化DHAlertViewHUD对象
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle alertViewClickIndexBlock:(DDAlertViewHUDClickIndexBlock)alertViewClickBlock;

/**
 *  显示showDHAlertViewHUD
 */
- (void)showDHAlertViewHUD;
@end
