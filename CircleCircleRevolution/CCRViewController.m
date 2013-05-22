//
//  CCRViewController.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 5/22/13.
//  Copyright (c) 2013 HMC Games Team. All rights reserved.
//

#import "CCRViewController.h"

@interface CCRViewController ()

@end

@implementation CCRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //random placement and size and frame
    int originX = self.view.bounds.size.width *.10;
    int originY = self.view.bounds.size.height*.10;
    int size = self.view.bounds.size.width/3.0;
    CGRect theFrame = CGRectMake(originX,originY,size,size);
    

    //instantiate circle
    CCRCircleView* circleView = [[CCRCircleView alloc] initWithFrame:theFrame];
    [self.view addSubview:circleView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
