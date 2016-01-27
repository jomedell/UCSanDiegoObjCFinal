//
//  Lesson6DemoInfo.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson6DemoInfo.h"

@implementation Lesson6DemoInfo

-(void)doTheDemo
{
}



-(instancetype)initWithTitle:(NSString *)title
{
    self =[super init];
    if (self)
    {
        self.title = title;
    }
    return self;
}


-(NSString *)description
{
    return [NSString stringWithFormat:@"#6: Title: %@ \nResults: %@ \nError: %@", self.title, self.results, self.error];
}


@end
