//
//  InfoImageView.m
//  ChildrenLocation
//
//  Created by szalarm on 15/8/10.
//  Copyright (c) 2015年 szalarm. All rights reserved.
//

#import "InfoImageView.h"

@implementation InfoImageView
//重载一个
- (id)init{
    if(self=[super init]){
        [self setUserActivity:[NSUserActivity new]];
        self.userInteractionEnabled=YES;
        self.layer.borderWidth=1.0;
        self.layer.borderColor=[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
        self.clipsToBounds=YES;
        self.layer.cornerRadius=5;
        self.layer.backgroundColor=[UIColor clearColor].CGColor;
    }
    return  self;
}
//初始化(xib加载时自动调用)
- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super initWithCoder:aDecoder]){
        self.userInteractionEnabled=YES;
        //去除边距
        self.layer.borderWidth=0.0;
        self.layer.borderColor=[UIColor colorWithWhite:0.5 alpha:0.1].CGColor;
        self.clipsToBounds=YES;
        self.layer.cornerRadius=5;
        self.layer.backgroundColor=[UIColor clearColor].CGColor;
    }
    return  self;
}

- (void)addTarget:(id)target action:(SEL)action{
    self.target=target;
    self.action=action;
}
//开始点击
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // [super touchesBegan:touches withEvent:event];
    NSLog(@"touches Begin");
    self.imageViewFrame=self.frame;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame=CGRectMake(self.frame.origin.x-5, self.frame.origin.y-5, self.frame.size.width+10, self.frame.size.height+10);
        
    }];
    //[UIView commitAnimations];
}
//结束点击
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches ended begin");
    [UIView animateWithDuration:0.5 animations:^{
        self.frame=self.imageViewFrame;
    } completion:^(BOOL finished) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
    }];
    
}

@end
