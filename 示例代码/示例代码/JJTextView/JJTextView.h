//
//  JJTextView.h
//  示例代码
//
//  Created by 罗文琦 on 2017/4/22.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJTextView : UITextView


/**
 占位文字lable
 */
@property(nonatomic , copy) NSString* placeHolderText;


/**
 最大文字输入量
 */
@property(nonatomic , assign) NSInteger  maxTextCount;


/**
 是否显示文字统计
 */
@property(nonatomic , assign) BOOL  showTextCount;

@end
