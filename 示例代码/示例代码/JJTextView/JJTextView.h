//
//  JJTextView.h
//  示例代码
//
//  Created by 罗文琦 on 2017/4/22.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJTextView : UITextView

@property(nonatomic , copy) NSString* placeHolderText;

@property(nonatomic , assign) NSInteger  maxTextCount;

@end
