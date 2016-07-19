# DHAlertViewHUD
###快速集成APP提示框,包含淡入淡出\下滑弹出\左滑弹出\上滑弹出\右滑弹出\自动消失\手动消失等效果;
## 效果图展示:
![image](https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-1.gif) ![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-4.png) ![image](https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-2.gif)

## 方法说明:
```objc
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
```
```objc
/**
 *  显示DHAlertViewHUD
 */
- (void)showDHAlertViewHUD;
```

## 使用方式:
####1.下载项目或者下载项目中DHAlertViewHUD这个文件,将下载好的文件拖拽到自己的工程文件夹中,并在自己添加APP引导页的类中导入#import "DHAlertViewHUD.h"头文件;

####2.初始化DHAlertViewHUD视图(例)
```objc
// 创建DHAlertViewHUD
DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"内容" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
}];
// 设置DHAlertViewHUD弹出样式(不设置则显示默认样式)
[alertView setAlertViewAnimationStyle:DDShowAlertViewAnimationStyleTop];
// 显示DHAlertViewHUD
[alertView showDHAlertViewHUD];
```

## <<分享是一种美德,Star是一种鼓励![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DHGuidePageHUDExample/DHGuidePageHUDExampleUITests/Untitled-star/Untitled-star.png)>>