//
//  RunTimeTools.h
//  RunTimeCreateAssociated
//
//  Created by 马少洋 on 16/5/9.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface RunTimeTools : NSObject


@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * status;




+ (instancetype)manager;
//获取属性
//- (void)getPro;
- (void)setTapAddView:(void(^)(void))block View:(UIView *)view;
@end
