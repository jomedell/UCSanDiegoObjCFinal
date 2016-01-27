//
//  Lesson6DemoReadFromBundle.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson6DemoReadFromBundle.h"

@implementation Lesson6DemoReadFromBundle


-(void)doTheDemo
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Lesson6readme" withExtension:@"txt"];
    NSError *myError = nil;
    self.results = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&myError];
    if (!self.results)
    {
        NSLog(@"%@", [myError localizedDescription]);
        self.error = myError;
        return;
    }
    
    
}


@end
