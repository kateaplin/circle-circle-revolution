//
//  Model.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 5/22/13.
//  Copyright (c) 2013 HMC Games Team. All rights reserved.
//

#import "Model.h"

@implementation Model

-(id) init
{
    fractionList = [NSArray arrayWithObjects:
                        [NSArray arrayWithObjects:
                            [NSNumber numberWithInteger:1],
                            [NSNumber numberWithInteger:2],
                            nil],
                        [NSArray arrayWithObjects:
                            [NSNumber numberWithInteger:1],
                            [NSNumber numberWithInteger:3],
                            nil],
                        [NSArray arrayWithObjects:
                            [NSNumber numberWithInteger:1],
                            [NSNumber numberWithInteger:4],
                            nil],
                    nil];
    
    return self;
}

-(NSArray*) getFraction
{
    int rand = arc4random() % 3;
    return fractionList[rand];
}

@end
