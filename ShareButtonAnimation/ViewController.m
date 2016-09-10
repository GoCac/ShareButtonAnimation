//
//  ViewController.m
//  ShareButtonAnimation
//
//  Created by Gong_Youhao on 16/9/10.
//  Copyright © 2016年 Yoho Gong. All rights reserved.
//

#import "ViewController.h"
#import "YHShare/YHShareHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)shareSomething:(id)sender
{
	[YHShareHelper shareWithViewController:self AndOtherParameters:nil];
}

@end
