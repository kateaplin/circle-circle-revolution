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
    model = [[Model alloc] init];
    
    circleFrame = CGRectMake(0,0,100,100);
    
    currentCircle = [self newCircle]; // as a guarantee that currentCircle is a Circle (for the sake of updateCircle)
    currentFraction = [model getFraction];
    [self newObject];                 // currentCircle is replaced immediately here
    [self startTimer];
    score = 0;
}

-(void) startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(updateCircle)
                                           userInfo:nil
                                            repeats:YES];
}

-(void) updateCircle
{
    if (circlePercent < 100)
    {
        circlePercent += 1;
        [currentCircle update:circlePercent];
    }
    else
    {
        circlePercent = 0;
        [self newObject];
    }
}

-(void) newObject
{
    circlePercent = 0;
    currentCircle = [self newCircle];
    currentFraction = [model getFraction];
    
    [self.view addSubview:currentCircle];
}

-(Circle*) newCircle
{
    return [[Circle alloc] initWithFrame:circleFrame];
}

-(void) scoreTap
{
    int scoreIncrease;
    int numerator = [currentFraction[0] intValue];
    int denominator = [currentFraction[1] intValue];
    
    float fracValue = (float)numerator/denominator;
    NSLog(@"Fraction: %f", fracValue);
    NSLog(@"Percent: %d", circlePercent);
    scoreIncrease = fabsf(fracValue*100 - circlePercent);
    score += scoreIncrease;
    
    [self newObject];
    
    NSLog(@"Score: %d", scoreIncrease);
}

-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent *) event
{
    UITouch* t = [touches anyObject];
    
    if ([t.view class] == [Circle class])
    {
        [self scoreTap];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
