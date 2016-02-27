//
//  InfoMenuItemView.h
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>
//引用数据
@class ImageInfoViewData;
//引用图片
@class InfoImageView;


/*菜单项*/
@interface InfoMenuItemView : UIView

#pragma  mark ui
//简介
@property(nonatomic,strong)IBOutlet UILabel *text;
//图片
@property(nonatomic,strong)IBOutlet InfoImageView *icon;
//蒙版
@property(nonatomic,strong) IBOutlet InfoImageView * mask;
#pragma  mark data
//获取视图
+(id)menuItemView:(ImageInfoViewData*)menuItem;
//获取视图
//+(id)menuItemViewNew:(ImageInfoViewData*)menuItem;

//添加事件
-(void)addTarget:(id)target action:(SEL)action;
#pragma mark 从xib初始化
+ (instancetype)initializeForNib;
+ (instancetype)initializeForNibSmall:(ImageInfoViewData*)menuItem;
+ (instancetype)initializeForNibSmallCircle:(ImageInfoViewData*)menuItem;

@end
