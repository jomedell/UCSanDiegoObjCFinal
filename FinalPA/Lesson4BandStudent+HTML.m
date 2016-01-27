//
//  Lesson4BandStudent+HTML.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson4BandStudent+HTML.h"

@implementation Lesson4BandStudent (HTML)

-(NSString *)showAsHtml
{
    return [NSString stringWithFormat:@"#4(HTML) <p>%@</p><p>%@</p><p>%@</p><p>%@</p>", self.name, self.number, self.stringDate, self.instrument];
}

@end
