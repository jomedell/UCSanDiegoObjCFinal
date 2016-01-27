//
//  AppDelegate.h
//  FinalPA
//
//  Created by Jorge Medellin on 2/26/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import <UIKit/UIKit.h>

// declared a helper function (C function) that you will use to get a path to the location on disk where you can save the to-do list
NSString *DocPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource> // added a data source protocol

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UIButton *button;
@property (nonatomic) UIButton *timerButton;
@property (nonatomic) UITextView *textView;


@property (nonatomic) NSMutableArray *tasks;



@end

