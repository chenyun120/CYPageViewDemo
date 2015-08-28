//
//  ViewController.m
//  CYPageViewDemo
//
//  Created by Chenyun on 15/8/28.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import "ViewController.h"
#import "CYPageView.h"

@interface ViewController ()
@property (nonatomic, strong) CYPageView * pageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setupView];
}

- (void)setupView
{
	self.view.backgroundColor = [UIColor blackColor];
	
	self.pageView = [[CYPageView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 4)];
	self.pageView.numberOfPages = 4;
	
	[self.view addSubview:self.pageView];
}

- (IBAction)addPages:(id)sender
{
	if ( self.pageView.numberOfPages - 1 == self.pageView.currentPage )
	{
		self.pageView.currentPage = 0;
	}
	else
	{
		self.pageView.currentPage += 1;
	}
}

- (IBAction)decreasePages:(id)sender
{
	if ( self.pageView.currentPage == 0 )
	{
		self.pageView.currentPage = self.pageView.numberOfPages - 1;
	}
	else
	{
		self.pageView.currentPage -= 1;
	}
}

@end
