//
//  Lesson4BandStudent.h
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "Lesson4Student.h"

@interface Lesson4BandStudent : Lesson4Student

@property NSString *instrument;


-(instancetype)initWithName:(NSString *)name andNumber:(NSNumber *)number andDate:(NSDate *)date andInstrument:(NSString *)instrument;


@end
