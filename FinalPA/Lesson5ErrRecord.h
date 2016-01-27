//
//  Lesson5ErrRecord.h
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lesson5ErrRecord : NSObject


@property (nonatomic) NSString *errName;
@property (nonatomic) NSDate *errDate;
@property (nonatomic) NSNumber *errNumber;
@property (nonatomic) NSString *stringDate2;




-(instancetype)initWithErrName:(NSString *)errName andErrDate:(NSDate *)errDate andErrNumber:(NSNumber *)errNumber;


@end
