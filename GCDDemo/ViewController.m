//
//  ViewController.m
//  GCDDemo
//
//  Created by barara on 16/4/13.
//  Copyright © 2016年 Jay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//- (void)viewWillAppear:(BOOL)animated
//{
//    NSLog(@"++++++++++++++++++++++++++++++++++++++++");
//    //[super viewWillAppear:animated];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"adasdddafdsfd1----%@",[NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"ffdsasfdsafds2----%@",[NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"afdfadsfaffdf3----%@",[NSThread currentThread]);
    });
}

- (void)chuanAndGlobalAndMain
{
    dispatch_async(dispatch_queue_create("testThread", NULL), ^{
        
        
        for (int i = 0; i < 100; i ++) {
            
            NSLog(@"串行------------------%d",i);
            
        }
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            //子线程中开始网络请求数据
            
            for (int i = 0; i < 100; i ++) {
                NSLog(@"global------------%d",i);
            }
            
            
            //更新数据模型
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //在主线程中更新UI代码
                
                for (int i = 0; i < 50; i ++) {
                    NSLog(@"主线程------------%d",i);
                }
                
            });
            
        });
        
        
        for (int i = 0; i < 200; i ++) {
            
            NSLog(@"串行后面------------------%d",i+100);
            
        }
        
        
    });

}

//- (void)viewDidDisappear:(BOOL)animated
//{
//    NSLog(@"----------------------------------------");
//    //[super viewDidDisappear:animated];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
