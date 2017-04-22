//
//  JJTextView.m
//  示例代码
//
//  Created by 罗文琦 on 2017/4/22.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "JJTextView.h"
#import <Masonry.h>

@interface JJTextView ()<UITextViewDelegate>

/**
 文字统计的lable
 */
@property(nonatomic , strong) UILabel * textCountLable;

/**
 占位文字的lable
 */
@property(nonatomic , strong) UILabel * placeHolderLable;

@end

@implementation JJTextView


#pragma mark - 指定初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame ]) {
        
        [self setupUI];
    }
    return self;
}


#pragma mark - 设置界面
-(void)setupUI{
    
    //添加一个透明的大小跟textView一样大小的UIView,用来把textView撑开,这是scrollView通用电费布局问题解决方案,因为scrollView它不仅仅有自己的大小还有一个contentView,这个contenView是不确定的,所以直接设置约束是没有用处的,除非i你同时指定上下左右大小,但是很多时候我们没办法完全确定这么多
    UIView* stayView = [[UIView alloc]init];
    [self insertSubview:stayView atIndex:0];
    [stayView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
        make.width.height.equalTo(self);
    }];
    
    //创建占位文字
    [self creatPlaceHolderLable];
    //创建字数统计lable
    [self creatTextCountLable];
    self.delegate = self;
    self.maxTextCount = 300;
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.alwaysBounceVertical = YES;
    self.contentSize = CGSizeZero;
    self.font = [UIFont systemFontOfSize:16];
}



#pragma mark - 设置最大文字输入数量
-(void)setMaxTextCount:(NSInteger)maxTextCount{
    _maxTextCount = maxTextCount;
    _textCountLable.text = [NSString stringWithFormat:@"已输入0/可输入%zd",self.maxTextCount];
    
}

#pragma mark - 代理方法,textView里面的内容发生改变的时候
- (void)textViewDidChange:(UITextView *)textView{
    if (self.text.length >= self.maxTextCount) {
        self.text = [self.text substringToIndex:self.maxTextCount];
    }
    self.placeHolderLable.hidden = self.text.length;
    self.textCountLable.text = [NSString stringWithFormat:@"已输入%d/可输入%d",(int)self.text.length, (int)(self.maxTextCount- self.text.length)];
    self.textCountLable.textColor = self.text.length < self.maxTextCount? [UIColor lightGrayColor]:[UIColor redColor];
}




#pragma mark - 创建字数统计lable
-(void)creatTextCountLable{
    _textCountLable = [[UILabel alloc]init];
    _textCountLable.text = @"已输入0/可输入300";
    _textCountLable.font = [UIFont systemFontOfSize:15];
    _textCountLable.textColor = [UIColor lightGrayColor];
    [self addSubview:_textCountLable];
    [_textCountLable sizeToFit];
    [_textCountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self).offset(-5);
    }];
}



#pragma mark - 创建占位文字
-(void)creatPlaceHolderLable{
    _placeHolderLable = [[UILabel alloc]init];
    _placeHolderLable.text = @"请输入你的想法";
    _placeHolderLable.font = [UIFont systemFontOfSize:15];
    _placeHolderLable.textColor = [UIColor lightGrayColor];
    [self addSubview:_placeHolderLable];
    [_placeHolderLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self);
        make.top.equalTo(self).offset(8);
    }];
}


-(void)setPlaceHolderText:(NSString *)placeHolderText{
    _placeHolderText = placeHolderText;
    self.placeHolderLable.text = placeHolderText;
}

-(void)setShowTextCount:(BOOL)showTextCount{
    _showTextCount = !showTextCount;
    self.textCountLable.hidden = _showTextCount;
    if (_showTextCount) {
        self.maxTextCount = INT64_MAX;
    }
}


@end
