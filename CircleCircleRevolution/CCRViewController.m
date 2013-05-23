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
    
    int originX = self.view.bounds.size.width *.50;
    int originY = self.view.bounds.size.height*.40;
    int size = self.view.bounds.size.width/2.0;
    circleFrame = CGRectMake(originX-size/2,originY-size/2,size,size);
    
    currentCircle = [self newCircle]; // as a guarantee that currentCircle is a Circle (for the sake of updateCircle)
    currentFraction = [model getFraction];
    [self newObject];                 // currentCircle is replaced immediately here
    [self startTimer];
    score = 0;
}

-(void) displayFraction
{
    if (!fractionLabel)
    {
        int originX = 0;
        int originY = self.view.bounds.size.height * .1;
        int width = self.view.bounds.size.width;
        int height = self.view.bounds.size.height * .10;
        CGRect fractionFrame = CGRectMake(originX, originY, width, height);
        
        fractionLabel = [[UILabel alloc] initWithFrame:fractionFrame];
        fractionLabel.backgroundColor = [UIColor clearColor];
        fractionLabel.textColor = [UIColor blackColor];
        fractionLabel.textAlignment = NSTextAlignmentCenter;
        fractionLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(72.0)];
        
        [self.view addSubview:fractionLabel];
    }
    
    NSString* fractionString = [NSString stringWithFormat:@"%d/%d", [currentFraction[0] intValue], [currentFraction[1] intValue]];
    fractionLabel.text = fractionString;
}

-(void) displayScore
{
    if (!scoreLabel)
    {
        int originX = self.view.bounds.size.width * .05;
        int originY = self.view.bounds.size.height * .05;
        int width = self.view.bounds.size.width * .9;
        int height = self.view.bounds.size.height * .05;
        CGRect fractionFrame = CGRectMake(originX, originY, width, height);
        
        scoreLabel = [[UILabel alloc] initWithFrame:fractionFrame];
        scoreLabel.backgroundColor = [UIColor clearColor];
        scoreLabel.textColor = [UIColor blackColor];
        scoreLabel.textAlignment = NSTextAlignmentRight;
        scoreLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
        
        [self.view addSubview:scoreLabel];
    }
    
    NSString* fractionString = [NSString stringWithFormat:@"%d", score];
    scoreLabel.text = fractionString;
}

-(void) startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(updateCircle)
                                           userInfo:nil
                                            repeats:YES];
}

-(void) updateCircle
{
    if (circlePercent < 100)
    {
        circlePercent += 0.1;
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
    [self displayFraction];
    [self displayScore];
    
    [self.view addSubview:currentCircle];
}

-(CCRCircleView*) newCircle
{
    return [[CCRCircleView alloc] initWithFrame:circleFrame];
}

-(void) scoreTap
{
    int scoreIncrease;
    int numerator = [currentFraction[0] intValue];
    int denominator = [currentFraction[1] intValue];
    
    float fracValue = (float)numerator/denominator;
    scoreIncrease = fabsf(fracValue*100 - circlePercent);
    score += scoreIncrease;
    [currentCircle setFeedback:fracValue*100]; // sets the feedback
    [currentCircle update:circlePercent]; // updates the view to include the "feedback slice"
    
   
    [self newObject];
}









-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent *) event
{
    UITouch* t = [touches anyObject];
    
    if ([t.view class] == [CCRCircleView class])
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
