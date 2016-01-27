//
//  Lesson6DemoReadFromPropertyList.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson6DemoReadFromPropertyList.h"

@implementation Lesson6DemoReadFromPropertyList


-(void)doTheDemo
{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Lesson6colors" withExtension:@"plist"];
    NSArray *colors = [NSArray arrayWithContentsOfURL:url];
    self.results = [colors copy];
    
}


@end
