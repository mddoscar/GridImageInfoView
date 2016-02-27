//
//  InfoListViewController.m
//  ChildrenLocation
//
//  Created by szalarm on 15/8/11.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import "InfoListViewController.h"
//引用数据
#import "ImageInfoViewData.h"

@interface InfoListViewController ()

//数据
@property(nonatomic,strong)NSMutableArray *menuItems;

@end

@implementation InfoListViewController
//@synthesize  mUiInfoListView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@" init line=%d,%s",__LINE__,__FUNCTION__);
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


#pragma mark 数量
//数量
- (NSUInteger)numberOfMenuItemsInListView:(InfoListView *)listView
{
    return  self.menuItems.count;
}

//获取数据
-(ImageInfoViewData *)listView:(InfoListView *)listView menuItemAtIndex:(NSUInteger)index
{
    return [self.menuItems objectAtIndex:index];
}
//点击事件
-(void) listView:(InfoListView *)listView didSelectMenuItemAtIndex:(NSUInteger)index
{
    NSLog(@"点击了第%ld个",(unsigned long)index);
}
//测试数据
-(NSMutableArray*)createMenuItems
{
    NSMutableArray * result=[NSMutableArray array];
    for (int i=0; i<10; i++) {
        ImageInfoViewData * fData=[[ImageInfoViewData alloc] initWithDataPic:@"userdefualt" mTitle:[NSString stringWithFormat:@"标题%d",i]];
        [result addObject:fData];
    }
    
    return result;
}

- (id)init{
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    return [super init];
}

-(void)loadView{
    [super loadView];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    NSLog(@"pre view=%@",NSStringFromCGRect(self.view.bounds));
    //获取数据
    self.menuItems=[self createMenuItems];
//    CGRect frame=CGRectMake(0, 0, 320, 150);
    //列表
   InfoListView *mUiInfoListView =[[InfoListView alloc] initWithFrame:self.view.bounds];
    //设置
    //listView.columnLandscapeCount=1;
//    [mUiInfoListView setBackgroundColor:[UIColor redColor]];
    //代理
    mUiInfoListView.listViewDelegate=self;
//    listView.listViewDelegate=self;
    
    //绑定视图
    self.view=mUiInfoListView;
    NSLog(@"after view=%@",NSStringFromCGRect(self.view.bounds));
//    [self.view setFrame:frame];
}




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"line=%d,%s",__LINE__,__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
