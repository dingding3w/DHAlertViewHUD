# DHAlertViewHUD
###快速集成APP提示框,包含淡入淡出\下滑弹出\左滑弹出\上滑弹出\右滑弹出\自动消失\手动消失等效果;
## 效果图展示:
<!--![image](https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-1.gif) ![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-4.png) ![image](https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-2.gif)-->
<table>
	<tr>
		<th>DDAlertViewButtonStyleInline</th>
		<th>DDAlertViewButtonStylePlain</th>
		<th>DDAlertViewButtonStyleInline</th>
		<th>DDAlertViewButtonStylePlain</th>
	</tr>
	
	<tr>
		<td><img src="https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-1.gif" height="300"></td>
		<td><img src="https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-2.gif" height="300"></td>
		<td><img src="https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-1.gif" height="300"></td>
		<td><img src="https://github.com/dingding3w/DHAlertViewHUD/blob/master/DHAlertViewHUD/DesignSketchGIF/Untitled-2.gif" height="300"></td>
	</tr>
</table>

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
####1.下载项目或者下载项目中DHAlertViewHUD这个文件,将下载好的文件拖拽到自己的工程文件夹中,并在使用DHAlertViewHUD的类中导入#import "DHAlertViewHUD.h"头文件;

####2.初始化并使用DHAlertViewHUD视图(例)
```objc
// 创建DHAlertViewHUD
DHAlertViewHUD *alertView = [[DHAlertViewHUD alloc] initWithTitle:@"标题" message:@"内容" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" alertViewClickIndexBlock:^(NSInteger alertViewClickIndex) {
        NSLog(@"您点击了第 %zd 个按钮", alertViewClickIndex);
}];
// 设置DHAlertViewHUD弹出样式(不设置则显示默认样式)
[alertView setAlertViewAnimationStyle:DDShowAlertViewAnimationStyleTop];
// 设置DHAlertViewHUD按钮样式(不设置则显示DDAlertViewButtonStyleInline样式)
[alertView setAlertViewButtonStyle:DDAlertViewButtonStylePlain];
// 显示DHAlertViewHUD
[alertView showDHAlertViewHUD];
```
## 部分代码说明:
####1.创建并初始化DHAlertViewHUD方式时,该SDK会自动检测当前按钮的值: ①当两个按钮值同时为nil时会取消按钮的显示并默认添加自动消失的效果; ②当其中一个按钮为nil时会默认添加一个按钮并自动分配相应的大小; ③当两个按钮同时有值时正常显示;

####2.设置DHAlertViewHUD的弹出样式:
```objc
// 默认效果
DDShowAlertViewAnimationStyleDefault
// 从顶部滑落
DDShowAlertViewAnimationStyleTop
// 从左边弹出
DDShowAlertViewAnimationStyleLeft
// 从下面弹出
DDShowAlertViewAnimationStyleBottom
// 从右面弹出
DDShowAlertViewAnimationStyleRight
// 没有效果
DDShowAlertViewAnimationStyleNO
// 对应实现的方法是:
[alertView setAlertViewAnimationStyle:<#(DDShowAlertViewAnimationStyle)#>];
```

####3.设置DHAlertViewHUD按钮的样式:
```objc
// 默认效果(Inline)
DDAlertViewButtonStyleInline
// 平铺效果(Plain)
DDAlertViewButtonStylePlain
// 对应实现的方法是:
[alertView setAlertViewButtonStyle:<#(DDAlertViewButtonStyle)#>]
```


## <<分享是一种美德,Star是一种鼓励![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DHGuidePageHUDExample/DHGuidePageHUDExampleUITests/Untitled-star/Untitled-star.png)>>