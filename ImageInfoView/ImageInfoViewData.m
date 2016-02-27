//
//  ImageInfoViewData.m
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import "ImageInfoViewData.h"

@implementation ImageInfoViewData
//初始化
-(id) initWithData:(NSString *) pUnitId mPic:(NSString *) pPic mSelected:(BOOL)pSelected mTitle:(NSString *) pTitle
{
    if (self=[super init]) {
        self.mUnitId=pUnitId;
        self.mPic=pPic;
        self.mSelected=pSelected;
        self.mTitle=pTitle;
    }
    return self;
}
//简单初始化
-(id) initWithDataPic:(NSString *)pPic mTitle:(NSString *)pTitle
{
    if (self=[super init]) {
        self.mPic=pPic;
        self.mSelected=NO;
        self.mTitle=pTitle;
    }
    return self;
}

@end
