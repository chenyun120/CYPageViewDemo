//
//  CYPageView.h
//  testPageController
//
//  Created by Chenyun on 15/8/27.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYPageView : UIView
@property (nonatomic, assign) NSInteger numberOfPages; // 总pages
@property (nonatomic, assign) NSInteger currentPage;   // 当前的page

@property (nonatomic, assign) NSInteger  spacing;	// 间距
@property (nonatomic, assign) NSInteger  pageViewWidth; // 宽度
@end
