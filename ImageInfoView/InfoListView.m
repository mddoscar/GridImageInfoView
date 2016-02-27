//
//  InfoListView.m
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import "InfoListView.h"
//引用数据
#import "ImageInfoViewData.h"
#import "InfoImageView.h"
#import "InfoMenuItemView.h"
#import "DeviceHelper.h"

#ifndef ChildrenLocation_InfoListViewHeader_h
#define ChildrenLocation_InfoListViewHeader_h
    //默认值
    //竖排4个
    #define kDefualtColumnLandscapeCount 4
    //横排3个
    #define kDefualtColumnPortraitCount 3
    //顶部边距
    #define kDefualtTopPadding 10
    //宽度
    #define kDefualtWidth 100
    //高度
    #define kDefualtHeight 100
#endif

@interface InfoListView()

@property(nonatomic,strong)NSMutableArray *menuItemViews;

-(void)createMenuItemViews;
-(void)layoutMenuItemViews;
-(void)menuItemClick:(id)sender;
@end

@implementation InfoListView
//单元格
@synthesize menuItemViews;

//初始化(xib加载时自动调用)
- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super initWithCoder:aDecoder]){
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
        self.menuItemViews=[[NSMutableArray alloc] init];
        self.menuItemSize=CGSizeMake(kDefualtWidth, kDefualtHeight);
        self.columnLandscapeCount=kDefualtColumnLandscapeCount;
        self.columnPortraitCount=kDefualtColumnPortraitCount;
        self.isAutoFit=YES;
        self.topPadding=kDefualtTopPadding;

    }
     NSLog(@"init GridVew:%d:%s",__LINE__,__FUNCTION__);
    return  self;
}
//大小
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
        self.menuItemViews=[[NSMutableArray alloc] init];
        self.menuItemSize=CGSizeMake(kDefualtWidth, kDefualtHeight);
        self.columnLandscapeCount=kDefualtColumnLandscapeCount;
        self.columnPortraitCount=kDefualtColumnPortraitCount;
        self.isAutoFit=YES;
        self.topPadding=kDefualtTopPadding;

    }
    NSLog(@"init GridVew:%d:%s",__LINE__,__FUNCTION__);
    return self;
}

//点击事件
-(void) menuItemClick:(InfoListView *)sender
{
    [self.listViewDelegate listView:self didSelectMenuItemAtIndex:sender.tag];
}
//创建
-(void)createMenuItemViews{
    //数量
    long count=[self.listViewDelegate numberOfMenuItemsInListView:self];
    for(int i=0;i<count;i++){
        ImageInfoViewData *menuItem=[self.listViewDelegate listView:self menuItemAtIndex:i];
        //获取数据
        InfoMenuItemView *menuItemView=[InfoMenuItemView menuItemView:menuItem];
        menuItemView.frame=CGRectMake(self.center.x, self.center.y, 100, 100);
        menuItemView.icon.tag=i;
        [menuItemView addTarget:self action:@selector(menuItemClick:)];
        [self.menuItemViews addObject:menuItemView];
        [self addSubview:menuItemView];
    }
    
//    long rows=0;
//    //如果是竖着
//    if (self.isPortrait) {
//        rows=count;
//        self.contentSize=CGSizeMake((rows*100+5),self.bounds.size.height);
//    //如果是横着
//    }else{
//        rows=1;
//        self.contentSize=CGSizeMake(self.bounds.size.width,(rows*100+5));
//    }
    long rows=count/3;
    if(count%3>0)
        rows=rows+1;
    self.contentSize=CGSizeMake(self.bounds.size.width,(rows*100+5));
    
}

//布局子视图
-(void)layoutMenuItemViews{
    
    int columnCount=3,padding=0;
    //BOOL isPortrait=[DeviceHelper isPortrait:self];
    if ([DeviceHelper isPortrait:self]) {
        columnCount=[DeviceHelper screenWidth]/(self.menuItemSize.width);
        padding=([DeviceHelper screenWidth]-(self.menuItemSize.width*columnCount))/(columnCount+1);
    }else{
        columnCount=[DeviceHelper screenHeight]/(self.menuItemSize.width);
        padding=([DeviceHelper screenHeight]-(self.menuItemSize.width*columnCount))/(columnCount+1);
    }
    long totalCount=self.menuItemViews.count;
    __block int menuItemX=0,menuItemY=0;
    //int columCount=3,totalCount=self.menuItemViews.count;
    for(int i=0;i<totalCount;i++){
        InfoMenuItemView *menuItemView=[self.menuItemViews objectAtIndex:i];

        [UIView animateWithDuration:0.8 animations:^{
            
            menuItemX=(i%columnCount)*(100+padding);
            menuItemY=(i/columnCount)*(100+padding);
            menuItemView.frame=CGRectMake(menuItemX,menuItemY, menuItemView.bounds.size.width, menuItemView.bounds.size.height);
            
        }];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"gridview begin %d:%s",__LINE__,__FUNCTION__);
    long count=[self.listViewDelegate numberOfMenuItemsInListView:self];
    if(count!=self.menuItemViews.count){
        NSLog(@"createMenuItemViews-----");
        [self createMenuItemViews];
    }
    
    [self layoutMenuItemViews];
    NSLog(@"gridview end %d:%s",__LINE__,__FUNCTION__);
    
}


@end
