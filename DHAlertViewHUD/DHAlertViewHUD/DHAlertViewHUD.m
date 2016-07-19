//
//  DHAlertViewHUD.m
//  DHAlertViewHUD
//
//  Created by Apple on 16/7/19.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHAlertViewHUD.h"
#import "UILabel+DHExtension.h"
#import "UIImage+DHExtension.h"

#define DDScreenW [UIScreen mainScreen].bounds.size.width
#define DDScreenH [UIScreen mainScreen].bounds.size.height

#define DDAlertViewW        270.0
#define DDAlertViewTitleH   20.0
#define DDAlertViewButtonH  36.0
#define DDTitleTopSpace     10.0 /**< 标题距离顶部的距离 */
#define DDMessageLabelSpace 20.0
#define DDMessageLabelMAXH  400.0
#define DDButtonLeftSpace   20.0

#define DDQBlueColor        [UIColor colorWithRed:9/255.0 green:170/255.0 blue:238/255.0 alpha:1.0]
#define DDRedColor          [UIColor colorWithRed:255/255.0 green:92/255.0 blue:79/255.0 alpha:1.0]
#define DDLightGrayColor    [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0]

#define DDTitleFont         [UIFont boldSystemFontOfSize:17.0];
#define DDMessageFont       [UIFont systemFontOfSize:14.0];
#define DDBtnTitleFont      [UIFont systemFontOfSize:15.0];

@interface DHAlertViewHUD ()
@property (nonatomic, strong) UIWindow *alertWindow;
@property (nonatomic, strong) UIView   *alertView;
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UILabel  *messageLabel;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *otherButton;
@end

@implementation DHAlertViewHUD
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle alertViewClickIndexBlock:(DDAlertViewHUDClickIndexBlock)alertViewClickBlock {
    if (self = [super init]) {
        [self setFrame:[[UIScreen mainScreen] bounds]];
        [self setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.7]];
        
        self.alertView = [[UIView alloc] init];
        self.alertView.backgroundColor = [UIColor whiteColor];
        self.alertView.layer.cornerRadius = 6.0;
        self.alertView.layer.masksToBounds = YES;
        self.alertView.userInteractionEnabled = YES;
        
        if (title) {
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, DDTitleTopSpace, DDAlertViewW, DDAlertViewTitleH)];
            self.titleLabel.text = title;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.font = DDTitleFont;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;/**< 结尾部分的内容以……方式省略,显示头的文字内容*/
        }
        
        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.backgroundColor = [UIColor whiteColor];
        self.messageLabel.text = message;
        self.messageLabel.textColor = [UIColor lightGrayColor];
        self.messageLabel.font = DDMessageFont;
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.lineBreakMode = NSLineBreakByTruncatingTail;/**< 结尾部分的内容以……方式省略,显示头的文字内容*/
        self.messageLabel.characterSpace = 2;   /**< 字间距 */
        self.messageLabel.lineSpace = 3;        /**< 行间距 */
        CGSize labelSize = [self.messageLabel getLableRectWithMaxWidth:DDAlertViewW - DDMessageLabelSpace*2];
        CGFloat messageLabelAotuH = labelSize.height > DDMessageLabelMAXH ? DDMessageLabelMAXH : labelSize.height;
        self.messageLabel.frame = CGRectMake(DDMessageLabelSpace, CGRectGetMaxY(self.titleLabel.frame)+DDTitleTopSpace, DDAlertViewW-DDMessageLabelSpace*2, messageLabelAotuH);
        
        //计算alertView的高度(通过判断AlertView上显示的子视图来判断)
        if ((cancelButtonTitle.length>0 || otherButtonTitle.length>0) && title.length>0) {
            self.alertView.frame = CGRectMake(0, 0, DDAlertViewW, CGRectGetMaxY(self.messageLabel.frame)+DDAlertViewTitleH+DDAlertViewButtonH+DDTitleTopSpace);
        } else if ((cancelButtonTitle.length==0 || otherButtonTitle.length==0) && title.length>0) {
            self.alertView.frame=CGRectMake(0, 0, DDAlertViewW, CGRectGetMaxY(self.messageLabel.frame)+DDAlertViewTitleH+DDTitleTopSpace);
        } else if ((cancelButtonTitle.length==0 || otherButtonTitle.length==0) && title.length==0) {
            self.alertView.frame=CGRectMake(0, 0, DDAlertViewW, CGRectGetMaxY(self.messageLabel.frame)+DDTitleTopSpace);
        }
        
        
        self.alertView.center = self.center;
        [self addSubview:self.alertView];
        [self.alertView addSubview:self.titleLabel];
        [self.alertView addSubview:self.messageLabel];
        
        if (cancelButtonTitle) {
            self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.cancelButton.titleLabel.font = DDBtnTitleFont;
            self.cancelButton.layer.cornerRadius = 3;
            self.cancelButton.layer.masksToBounds = YES;
            [self.cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
            [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.cancelButton setBackgroundImage:[UIImage imageWithColor:DDLightGrayColor] forState:UIControlStateNormal];
            [self.cancelButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.alertView addSubview:self.cancelButton];
        }
        
        if (otherButtonTitle) {
            self.otherButton=[UIButton buttonWithType:UIButtonTypeCustom];
            self.otherButton.titleLabel.font = DDBtnTitleFont;
            self.otherButton.layer.cornerRadius = 3;
            self.otherButton.layer.masksToBounds = YES;
            [self.otherButton setTitle:otherButtonTitle forState:UIControlStateNormal];
            [self.otherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.otherButton setBackgroundImage:[UIImage imageWithColor:DDRedColor] forState:UIControlStateNormal];
            [self.otherButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.alertView addSubview:self.otherButton];
        }
        
        CGFloat buttonY = self.alertView.frame.size.height-DDAlertViewButtonH-10;
        if (cancelButtonTitle && !otherButtonTitle) {
            self.cancelButton.tag = 0;
            self.cancelButton.frame = CGRectMake(DDButtonLeftSpace, buttonY, DDAlertViewW-DDButtonLeftSpace*2, DDAlertViewButtonH);
        } else if (!cancelButtonTitle && otherButtonTitle){
            self.otherButton.tag = 0;
            self.otherButton.frame = CGRectMake(DDButtonLeftSpace, buttonY, DDAlertViewW-DDButtonLeftSpace*2, DDAlertViewButtonH);
        } else if (cancelButtonTitle && otherButtonTitle){
            self.cancelButton.tag = 0;
            self.otherButton.tag = 1;
            CGFloat btnSpace = 20; /**< 两个button之间的间距 */
            CGFloat buttonW = (DDAlertViewW-DDButtonLeftSpace*2-btnSpace)/2;
            self.cancelButton.frame = CGRectMake(DDButtonLeftSpace, buttonY, buttonW, DDAlertViewButtonH);
            self.otherButton.frame = CGRectMake(self.alertView.frame.size.width-buttonW-DDButtonLeftSpace, buttonY, buttonW, DDAlertViewButtonH);
        } else if (!cancelButtonTitle && !otherButtonTitle) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissDHAlertViewHUD];
            });
        }
        self.alertViewClickBlock = alertViewClickBlock;
    }
    return self;
}

- (void)buttonClick:(UIButton *)button {
    if (self.alertViewClickBlock) {
        self.alertViewClickBlock(button.tag);
    }
    [self dismissDHAlertViewHUD];
}

- (void)showDHAlertViewHUD {
    self.alertWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.alertWindow.windowLevel = UIWindowLevelAlert;
    [self.alertWindow becomeKeyWindow];
    [self.alertWindow makeKeyAndVisible];
    
    [self.alertWindow addSubview:self];
    [self setShowAnimation];
}

- (void)dismissDHAlertViewHUD {
    [self removeFromSuperview];
    [self.alertWindow resignKeyWindow];
}

- (void)setAnimationStyle:(DDShowAlertViewAnimationStyle)animationStyle {
    self.alertViewAnimationStyle = animationStyle;
}

- (void)setShowAnimation {
    switch (self.alertViewAnimationStyle) {
        case DDShowAlertViewAnimationStyleDefault: {
            [UIView animateWithDuration:0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self.alertView.layer setValue:@(0) forKeyPath:@"transform.scale"];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.23 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    [self.alertView.layer setValue:@(1.2) forKeyPath:@"transform.scale"];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.09 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        [self.alertView.layer setValue:@(.9) forKeyPath:@"transform.scale"];
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.05 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            [self.alertView.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                        } completion:^(BOOL finished) {
                            
                        }];
                    }];
                }];
            }];
        }
            break;
            
        case DDShowAlertViewAnimationStyleTop: {
            CGPoint startPoint = CGPointMake(self.center.x, -self.alertView.frame.size.height);
            self.alertView.layer.position = startPoint;
            
            // duration : 动画的持续时间
            // delay    : 动画执行的延迟时间
            // damping  : 类似弹簧振动效果 0~1 (接近于0弹性效果越明显)
            // velocity : 初始速度
            // options  : 动画过渡效果
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.alertView.layer.position = self.center;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case DDShowAlertViewAnimationStyleLeft:{
            CGPoint startPoint = CGPointMake(-DDAlertViewW, self.center.y);
            self.alertView.layer.position = startPoint;
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.alertView.layer.position = self.center;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case DDShowAlertViewAnimationStyleBottom:{
            CGPoint startPoint = CGPointMake(self.center.x, self.frame.size.height);
            self.alertView.layer.position = startPoint;
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.alertView.layer.position = self.center;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case DDShowAlertViewAnimationStyleRight:{
            CGPoint startPoint = CGPointMake(DDAlertViewW+DDAlertViewW, self.center.y);
            self.alertView.layer.position = startPoint;
            
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.alertView.layer.position = self.center;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case DDShowAlertViewAnimationStyleNO:{
        }
            break;
            
        default:
            break;
    }
}
@end
