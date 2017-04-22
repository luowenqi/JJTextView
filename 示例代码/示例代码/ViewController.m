//
//  ViewController.m
//  示例代码
//
//  Created by 罗文琦 on 2017/4/22.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "JJTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //简单吧,只有一句话,呵呵,点个赞把,我还有很多其他的小工具,很实用,基本都是一句话可以实现
    //项目地址https://github.com/luowenqi/JJTextView  点个赞把,需要你的支持
    //主页https://github.com/luowenqi   点个赞把,需要你的支持
    
    
    JJTextView* textView = [[JJTextView alloc]init];
    [self.view addSubview:textView];
    
    
    
    
    
    
    //布局,
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(8);
        make.right.equalTo(self.view).offset(-8);
        make.height.mas_offset(300);
    }];
    textView.backgroundColor = [UIColor yellowColor];
    
    //设置最大的文字输入字数,默认是300字
    //textView.maxTextCount = 100;
    
    //设置占位文字,默认是 "请输入你的想法"
    //textView.placeHolderText = @"这一刻,你在想什么";
    
    //设置是否需要显示文字统计,默认显示,当不现实文字统计lable时候,textView可以输入任意多的文字
    //textView.showTextCount = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
