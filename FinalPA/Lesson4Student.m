//
//  Lesson4Student.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson4Student.h"

@implementation Lesson4Student


-(instancetype)init
{
    return [self initWithName:nil];
}

-(instancetype)initWithName:(NSString *)name
{
    return [self initWithName:name andNumber:nil];
}

-(instancetype)initWithName:(NSString *)name andNumber:(NSNumber *)number
{
    return [self initWithName:name andNumber:number andDate:nil];
}

-(instancetype)initWithName:(NSString *)name andNumber:(NSNumber *)number andDate:(NSDate *)date
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.number = number;
        self.date = date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        NSString *s = [formatter stringFromDate:self.date];
        self.stringDate = s;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"#4: Student name: %@ \nStudent number: %@ \nStudent date: %@", self.name, self.number, self.stringDate];
}


@end
