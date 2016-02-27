//
//  InfoImageView.h
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 带点击事件图片
 */
@interface InfoImageView : UIImageView
//面板
@property(nonatomic)CGRect imageViewFrame;
//绑定
@property(nonatomic) id target;
//事件
@property(nonatomic)SEL action;
//添加事件
-(void)addTarget:(id)target action:(SEL)action;

@end
