//
//  InfoListViewController.h
//  ChildrenLocation
//
//  Created by szalarm on 15/8/11.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>
//引用列表视图
#import "InfoListView.h"

@protocol InfoListViewControllerDelegate <NSObject>

@required
-(NSMutableArray*)createMenuItems;
@end

/*
 列表视图控制器
 */
//引用控制器,引用列表
@interface InfoListViewController : UIViewController<InfoListViewControllerDelegate,InfoListViewDelegate>
//测试
//@property (weak, nonatomic) IBOutlet InfoListView *mUiInfoListView;


@end
