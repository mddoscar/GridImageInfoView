//
//  ImageInfoViewData.h
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 头像按钮数据
 */
@interface ImageInfoViewData : NSObject

#pragma  mark 成员
//编号
@property (nonatomic,copy) NSString * mUnitId;
//图片
@property (nonatomic ,copy) NSString * mPic;
//状态(是否选中)
@property (nonatomic,assign) BOOL  mSelected;
//说明文本
@property (nonatomic ,copy) NSString * mTitle;

#pragma  mark 构造函数
//初始化
-(id) initWithData:(NSString *) pUnitId mPic:(NSString *) pPic mSelected:(BOOL) pSelected mTitle:(NSString *) pTitle;
//初始化2
-(id) initWithDataPic:(NSString *)pPic mTitle:(NSString *)pTitle;

@end
