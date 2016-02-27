//
//  InfoMenuItemView.m
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import "InfoMenuItemView.h"
//数据
#import "ImageInfoViewData.h"
//图片
#import "InfoImageView.h"
//兼容
#import "LongPressImage.h"
//xib名字
#define NIBNAME @"InfoMenuItemView"
@implementation InfoMenuItemView

- (id)init{
    if(self=[super init]){
        NSArray *views=[[NSBundle mainBundle] loadNibNamed:NIBNAME owner:self options:nil];
        [self addSubview:[views objectAtIndex:0]];
    }
    return self;
}
//添加事件
-(void)addTarget:(id)target action:(SEL)action{
    if(self.icon){
        [self.icon addTarget:target action:action];
    }
}
//获取视图
+(id)menuItemView:(ImageInfoViewData*)menuItem
{
    InfoMenuItemView *menuItemView=[[InfoMenuItemView alloc]init];
    menuItemView.text.text=menuItem.mTitle;
    [menuItemView.icon setImage:[UIImage imageNamed:menuItem.mPic]];
    return menuItemView;
}
//初始阿虎
+ (instancetype)initializeForNib{
    InfoMenuItemView *view = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
    return view;
}
+ (instancetype)initializeForNibSmall:(ImageInfoViewData*)menuItem
{
    InfoMenuItemView *view = [[[NSBundle mainBundle]loadNibNamed:@"InfoSmallView" owner:nil options:nil]lastObject];
    view.text.text=menuItem.mTitle;
    //额外样式
    view.layer.borderWidth=1.0;
    view.layer.borderColor=[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
    view.clipsToBounds=YES;
    view.layer.cornerRadius=5;
    view.layer.backgroundColor=[UIColor whiteColor].CGColor;
    [view.icon setImage:[UIImage imageNamed:menuItem.mPic]];
    return view;
}
+ (instancetype)initializeForNibSmallCircle:(ImageInfoViewData*)menuItem
{
    InfoMenuItemView *view = [[[NSBundle mainBundle]loadNibNamed:@"InfoSmallCircleView" owner:nil options:nil]lastObject];
    view.text.text=menuItem.mTitle;
    //额外样式
    view.layer.borderWidth=1.0;
    view.layer.borderColor=[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
    view.clipsToBounds=YES;
    view.layer.cornerRadius=5;
    view.layer.backgroundColor=[UIColor whiteColor].CGColor;
    [view.icon setImage:[UIImage imageNamed:menuItem.mPic]];
    return view;
}
@end
