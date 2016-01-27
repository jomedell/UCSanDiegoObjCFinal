//
//  Lesson5ErrRecord.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson5ErrRecord.h"

@implementation Lesson5ErrRecord


-(instancetype)initWithErrName:(NSString *)errName andErrDate:(NSDate *)errDate andErrNumber:(NSNumber *)errNumber
{
    self = [super init];
    if (self)
    {
        self.errName = errName;
        self.errDate = errDate;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        NSString *s = [formatter stringFromDate:self.errDate];
        self.stringDate2 = s;
        self.errNumber = errNumber;
    }
    return self;
}


-(NSString *)description
{
    return [NSString stringWithFormat:@"#5: ErrName: %@ \nErrDate: %@ \nErrNumber: %@", self.errName, self.stringDate2, self.errNumber];
}


@end
