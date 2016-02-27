//
//  InfoListView.h
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import <UIKit/UIKit.h>
//条形视图
@class InfoListView;
@class ImageInfoViewData;
#pragma  mark 代理
@protocol InfoListViewDelegate <NSObject>
@required
-(NSUInteger)numberOfMenuItemsInListView:(InfoListView*)listView;
-(ImageInfoViewData*)listView:(InfoListView*)listView menuItemAtIndex:(NSUInteger)index;
-(void)listView:(InfoListView*)listView didSelectMenuItemAtIndex:(NSUInteger)index;
@end

/*横向视图|[][][][]|*/
@interface InfoListView : UIScrollView
#pragma mark 成员
@property(nonatomic,weak)id<InfoListViewDelegate> listViewDelegate;
//@property(nonatomic)NSUInteger padding;
@property(nonatomic)BOOL isAutoFit;//default YES
@property(nonatomic)NSUInteger topPadding;//default 10
@property(nonatomic) NSUInteger columnPortraitCount;//default count 3
@property(nonatomic) NSUInteger columnLandscapeCount;//default count 4
@property(nonatomic) CGSize menuItemSize;//default size 100*100
@property (nonatomic) BOOL isPortrait;//是行，还是列


@end
