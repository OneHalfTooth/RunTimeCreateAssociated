//
//  RunTimeTools.m
//  RunTimeCreateAssociated
//
//  Created by 马少洋 on 16/5/9.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "RunTimeTools.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <Foundation/NSStream.h>


static RunTimeTools * manager = nil;
static char * key ;
static char * blockChar;

static NSMutableDictionary *map = nil;

@implementation RunTimeTools

+ (void)load

{

    map = [NSMutableDictionary dictionary];



    map[@"name1"]                = @"name";

    map[@"status1"]              = @"status";

    map[@"name2"]                = @"name";

    map[@"status2"]              = @"status";
    
}

+ (instancetype)manager{
    if (!manager) {
        manager = [[self alloc]init];
    }
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@",map);
        [self getPro];
    }
    return self;
}


- (void)setTapAddView:(void(^)(void))block View:(UIView *)view{
    UITapGestureRecognizer * tap = objc_getAssociatedObject(view, &key);
    if (!tap) {
        tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureDidCliked:)];
        
        [view addGestureRecognizer:tap];
        objc_setAssociatedObject(view, &key, tap, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(view, &blockChar, block, OBJC_ASSOCIATION_COPY);
    
}
- (void)tapGestureDidCliked:(UITapGestureRecognizer *)tap{
    void(^action)(void) = objc_getAssociatedObject(tap.view, &blockChar);
    UITapGestureRecognizer * tap1 = (UITapGestureRecognizer *)objc_getAssociatedObject(tap.view, &key);

    if (action) {
        action();
    }
}
//获取属性
- (NSString *)getPro{
    unsigned int count;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        NSLog(@"------------%@",[NSString stringWithUTF8String:ivar_getName(ivars[i])]);
    }
    free(ivars);
    unsigned int countPro;
    objc_property_t  * propertys =class_copyPropertyList([self class], &countPro);
    for (int i = 0; i < countPro; i++) {
        NSLog(@"--------%@",[NSString stringWithUTF8String:property_getName(propertys[i])]);
    }
    free(propertys);
    return nil;
}





@end
