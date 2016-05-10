//
//  ViewController.m
//  RunTimeCreateAssociated
//
//  Created by 马少洋 on 16/5/9.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "ViewController.h"
#import "RunTimeTools.h"
#import <objc/runtime.h>
#import <objc/message.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getMethod];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getMethod{
    //调用函数
    Method method = class_getInstanceMethod([[RunTimeTools manager]class], NSSelectorFromString(@"getPro"));
    method_invoke([RunTimeTools manager], method);//可以调用函数  ，但是函数必须有返回值#warning 不知道咋解决
    //发送消息的调用当时
//    objc_msgSend([RunTimeTools manager], NSSelectorFromString(@"setTapAddView:View:"),^(void){
//        NSLog(@"打印");
//    },self.view);
    //直接调用的调用方式
//    [[RunTimeTools manager]setTapAddView:^{
//        NSLog(@"打印");
//    } View:self.view];
    
}



@end
