//
//  Lesson4Student.h
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lesson4Student : NSObject

@property NSString *name;
@property NSNumber *number;
@property NSDate *date;
@property (nonatomic) NSString *stringDate;

-(instancetype)init;
-(instancetype)initWithName:(NSString *)name;
-(instancetype)initWithName:(NSString *)name andNumber:(NSNumber *)number;
-(instancetype)initWithName:(NSString *)name andNumber:(NSNumber *)number andDate:(NSDate *)date NS_DESIGNATED_INITIALIZER;


@end
