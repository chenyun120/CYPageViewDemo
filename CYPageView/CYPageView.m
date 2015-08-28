//
//  CYPageView.m
//  testPageController
//
//  Created by Chenyun on 15/8/27.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import "CYPageView.h"

@interface CYPageView ()

@property (nonatomic, strong) NSMutableArray * pageViews;

@end

@implementation CYPageView

- (void)awakeFromNib
{
	[super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.pageViews = [NSMutableArray array];
		self.spacing = 5;
		self.pageViewWidth = 10;
	}
	return self;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
	_numberOfPages = numberOfPages;
	
	[self removePageViews];

	for ( int i = 0 ; i < numberOfPages; i++ )
	{
		/*
		 *   totalPages    间距        pageView宽度								计算方式
		 *
		 *       1          5              10
		 *
		 *		 4          5			   10
		 *
		 */
		CGFloat contentOffsetX = (i * self.pageViewWidth + i * self.spacing) + (self.frame.size.width / 2) - (numberOfPages * self.pageViewWidth / 2) - ((numberOfPages - 1) * self.spacing / 2);
		
		UIView * pageView = [[UIView alloc] initWithFrame:CGRectMake( contentOffsetX, 0, self.pageViewWidth, self.frame.size.height)];
		pageView.layer.cornerRadius = self.frame.size.height / 2;
		pageView.layer.borderColor = [UIColor whiteColor].CGColor;
		pageView.layer.masksToBounds = YES;
		pageView.layer.borderWidth = 1;
		
		if ( i > 0 )
		{
			pageView.backgroundColor = [UIColor clearColor];
		}
		else
		{
			pageView.backgroundColor = [UIColor whiteColor];
		}
		
		[self addSubview:pageView];

		[self.pageViews addObject:pageView];
	}
}

- (void)setCurrentPage:(NSInteger)currentPage
{
	_currentPage = currentPage;
	[self selectPageView];
}

- (void)unSelectd
{
	for ( UIView * view  in self.pageViews )
	{
		view.backgroundColor = [UIColor clearColor];
	}
}

- (void)selectPageView
{
	[self unSelectd];

	if ( self.pageViews.count >= _currentPage )
	{
		UIView * view = self.pageViews[_currentPage];
		view.backgroundColor = [UIColor whiteColor];
	}
}

- (void)removePageViews
{
	for ( UIView * view  in self.pageViews )
	{
		[view removeFromSuperview];
	}

	[self.pageViews removeAllObjects];
}

@end
