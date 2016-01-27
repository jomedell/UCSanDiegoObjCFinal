//
//  Lesson4BandStudent.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson4BandStudent.h"

@implementation Lesson4BandStudent

-(instancetype)initWithName:(NSString *)name andNumber:(NSNumber *)number andDate:(NSDate *)date andInstrument:(NSString *)instrument
{
    self = [super initWithName:name andNumber:number andDate:date];
    if (self)
    {
        self.instrument = instrument;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ \nInstrument: %@", [super description], self.instrument];
}

@end
