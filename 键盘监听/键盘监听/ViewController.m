//
//  ViewController.m
//  键盘监听
//
//  Created by Lone on 16/6/2.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillHide:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)keyboardWillShow:(NSNotification *)nf
{
    //获取键盘的高度
    
    NSDictionary *userInfo = [nf userInfo];
    
    NSValue *endValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSValue *beginValue = [userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    
    CGRect keyboardRect_end = [endValue CGRectValue];
    CGRect keyboardRect_begin = [beginValue CGRectValue];
    
    int height = keyboardRect_end.size.height;
    
    NSLog(@"userInfo---------------%@",userInfo);
    
    NSLog(@"---------------%d",height);
    
    NSLog(@"keyboardRect_begin.size.height---------------%d",(int)keyboardRect_begin.size.height);
    
    if (keyboardRect_begin.size.height > 0) {
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = - height;
            self.view.frame = frame;
        }];
    }
    
}

- (void)keyboardWillHide:(NSNotification *)nf
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
