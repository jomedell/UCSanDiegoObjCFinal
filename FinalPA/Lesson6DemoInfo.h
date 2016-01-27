//
//  Lesson6DemoInfo.h
//  FinalPA
//
//  Created by Jorge Medellin on 2/28/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lesson6DemoInfo : NSObject

@property NSString *title;
@property NSString *results;
@property NSError *error;


-(void)doTheDemo;
-(instancetype)initWithTitle:(NSString *)title;


@end
