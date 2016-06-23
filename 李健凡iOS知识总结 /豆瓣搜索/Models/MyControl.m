//
//  MyControl.m
//  豆瓣搜索
//
//  Created by mini on 15/10/12.
//  Copyright (c) 2015年 mini. All rights reserved.
//

#import "MyControl.h"

@implementation MyControl

+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.text = text;
    
    label.backgroundColor = [UIColor clearColor];
    
    label.numberOfLines = 0;
    
    label.font = [UIFont systemFontOfSize:14];
    
    return label;
}


+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)name title:(NSString *)title{
    
    UIButton *button = nil;
    
    if (name) {//创建图片按钮
       
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //设置背景图片
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        
        if (title) {
            //创建 图片 和 标题按钮
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    
    }else if(title){//创建标题按钮
        
        button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    button.frame = frame;
    
    button.tag = tag;
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)name isCache:(BOOL)cache{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    if (cache) {//YES 加载到缓存
    
        imageView.image  = [UIImage imageNamed:name];
        
    }else{//每次都从磁盘 沙盒目录下加载 需要获取沙盒路径
        
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        
        imageView.image = [UIImage imageWithContentsOfFile:path];
    
    }
    
    return imageView;
}



+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)string delegate:(id<UITextFieldDelegate>)delegate tag:(NSInteger)tag{
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    
    //设置风格类型
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.placeholder = string;
    
    //设置代理
    textField.delegate = delegate;
    
    //设置tag值
    textField.tag = tag;
    
    return textField;
    
}


@end
