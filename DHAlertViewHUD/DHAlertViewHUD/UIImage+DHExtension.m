//
//  UIImage+DHExtension.m
//  DHAlertViewHUD
//
//  Created by Apple on 16/7/19.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "UIImage+DHExtension.h"

@implementation UIImage (DHExtension)
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
/**
 *  自定义视图圆角方案:
 *  UIView *customFilletView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 200, 80)];
 *  [customFilletView setBackgroundColor:[UIColor redColor]];
 *  [self.view addSubview:customFilletView];
 *
 *  UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:customFilletView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
 *  CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
 *  maskLayer.frame = customFilletView.bounds;
 *  maskLayer.path = maskPath.CGPath;
 *  customFilletView.layer.mask = maskLayer;
 */