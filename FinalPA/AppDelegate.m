//
//  AppDelegate.m
//  FinalPA
//
//  Created by Jorge Medellin on 2/26/15.
//  Copyright (c) 2015 Jorge Medellin. All rights reserved.
//

#import "AppDelegate.h"
// lesson 3
#import "Lesson3Student.h"
// lesson 4
#import "Lesson4Student.h"
#import "Lesson4BandStudent.h"
#import "Lesson4BandStudent+HTML.h"
// lesson 5
#import "Lesson5ErrRecord.h"
// lesson 6
#import "Lesson6DemoInfo.h"
#import "Lesson6DemoReadFromBundle.h"
#import "Lesson6DemoReadFromPropertyList.h"
// lesson 8
@import CoreLocation;

// helper function to fetch the path to our to-do data stored on disk
NSString *DocPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}


// lesson 8
@interface AppDelegate () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager; 

@end

@implementation AppDelegate
// lesson 8
{
    int count;
    int clickCount;
    int timerCount;
}

#pragma mark - Application delegate callbacks


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // load an existing dataset or create a new one
    NSArray *plist = [NSArray arrayWithContentsOfFile:DocPath()];
    if (plist)
    {
        // we have a dataset; copy it into tasks
        self.tasks = [plist mutableCopy];
    }
    else
    {
        // there is no dataset; create an empty array
        self.tasks = [NSMutableArray array];
    }
    
    
    
    // create and configure the UIWindow instance
    // A CGRect is a struct with an origin (x,y) and a size (width,height)
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    //define the frame rectangles of the three UI elements
    // CGRectMake() creates a CGRect from (x, y, width, height)
    CGRect tableFrame = CGRectMake(0, 40, winFrame.size.width, winFrame.size.height - 100);
    CGRect buttonFrame = CGRectMake(15, 425, 120, 18);
    CGRect timerButtonFrame = CGRectMake(15, 450, 120, 18);
    CGRect textViewFrame = CGRectMake(15, 25, 120, 19);
     
    // create and configure the UITableView instance
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    // make the AppDelegate the table view's dataSource
    self.taskTable.dataSource = self;
    // tell the table view which class to instantiate whenever it needs to create a new cell
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // lesson 1
    NSLog(@"#1: \nJorge Medellin");
    
    NSObject *obj = [[NSObject alloc] init];
    NSLog(@"#1 obj description: \n%@", [obj description]);
     self.textView = [[UITextView alloc] initWithFrame:textViewFrame];
     self.textView.editable = NO;
     self.textView.backgroundColor = [UIColor lightGrayColor];
     self.textView.font = [UIFont systemFontOfSize:10];
     self.textView.text = @"#1: FinalPA";
    
    
    // lesson 3
    Lesson3Student *s1 = [[Lesson3Student alloc] init];
    s1.name = @"Peter";
    s1.number = @987;
    NSString *string = [[NSString alloc] initWithFormat:@"%@",s1];
    [self.tasks addObject:string];
    NSLog(@"%@", s1);
    
    
    // lesson 4
    Lesson4BandStudent *s2 = [[Lesson4BandStudent alloc] initWithName:@"Adam" andNumber:@123 andDate:[NSDate date] andInstrument:@"guitar"];
    NSString *string1 = [[NSString alloc] initWithFormat:@"%@",s2];
    [self.tasks addObject:string1];
    NSString *string2 = [[NSString alloc] initWithFormat:@"%@", [s2 showAsHtml]];
    [self.tasks addObject:string2];
    NSLog(@"%@", s2);
    NSLog(@"%@", [s2 showAsHtml]);
   


    // lesson 5
    Lesson5ErrRecord *record1 = [[Lesson5ErrRecord alloc] initWithErrName:@"John" andErrDate:[NSDate date] andErrNumber:@456];
    //Lesson5ErrRecord *record2 = [[Lesson5ErrRecord alloc] initWithErrName:@"Sally" andErrDate:[NSDate date] andErrNumber:@789];
    NSMutableArray *records = [[NSMutableArray alloc] init];
    [records addObject:record1];
    //[records addObject:record2];
   
    for (Lesson5ErrRecord *r in records)
    {
        NSString *string3 = [[NSString alloc] initWithFormat:@"%@",r];
        [self.tasks addObject:string3];
        NSLog(@"%@", r);
        
    }
    
    
    // lesson 6
    Lesson6DemoReadFromBundle *txt = [[Lesson6DemoReadFromBundle alloc] initWithTitle:@"readme.txt"];
    Lesson6DemoReadFromPropertyList * plist2 = [[Lesson6DemoReadFromPropertyList alloc] initWithTitle:@"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:txt];
    [array addObject:plist2];
    
    for (Lesson6DemoInfo *s in array)
    {
        [s doTheDemo];
        NSString *string4 = [[NSString alloc] initWithFormat:@"%@", s];
        [self.tasks addObject:string4];
        NSLog(@"%@", s);
    }
   
  
  
    
    
    // lesson 7
    // create and configure the UIButton instance
    self.button = [[UIButton alloc] initWithFrame:buttonFrame];
    self.button.backgroundColor = [UIColor redColor];
    self.button.titleLabel.font = [UIFont systemFontOfSize:10];
    // give the button a title:
    [self.button setTitle:@"#7: Click To Count = 0" forState:UIControlStateNormal];
   
    // wire up the timerButton (set the target-action) Touching the UIButton the first time increments the count
    [self.button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // create and configure the Timer UIButton instance
    self.timerButton = [[UIButton alloc] initWithFrame:timerButtonFrame];
    self.timerButton.backgroundColor = [UIColor orangeColor];
    self.timerButton.titleLabel.font = [UIFont systemFontOfSize:10];
    // give the button a title:
    [self.timerButton setTitle:@"#7: Timer Count = 0" forState:UIControlStateNormal];
     // Touching the timerButton increments the count every 1 second, using NSTimer
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(doTimer:)
                                   userInfo:self.timerButton repeats:YES];
    
    
    // lesson 8
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    // check for iOS 8
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    NSString *string5 = [[NSString alloc] initWithFormat:@"#8: \ncount: %i latitute: %f longitude: %f", count, self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    [self.tasks addObject:string5];
    NSLog(@"#8: \ncount: %i latitude: %f longitude: %f", count, self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude);
    
    
    
    // add UI elements to the window
    [self.window addSubview:self.taskTable];
    [self.window addSubview:self.button];
    [self.window addSubview:self.timerButton];
    [self.window addSubview:self.textView];
    
    // finalize the window and put it on the screen
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



//  lesson 7
// Touching the UIButton the first time increments the count
-(void)doButton:(UIButton *)button
{
    clickCount++;
    NSString *title = [NSString stringWithFormat:@"#7: Click To Count = %i", clickCount];
    NSLog(@"#7: \nClick Count = %i", clickCount);
    [button setTitle:title forState:UIControlStateNormal];
//    [self.tasks addObject:title];
//    
//    [self.taskTable reloadData];
   
}
// Touching the Timer UIButtonincrements the count every 1 second, using NSTimer
-(void)doButton2:(UIButton *)button
{
    timerCount++;
    NSString *title = [NSString stringWithFormat:@"#7: Timer Count = %i", timerCount];
//    NSLog(@"#7: Timer Count = %i", timerCount);
    [button setTitle:title forState:UIControlStateNormal];
}

-(void)doTimer:(NSTimer *)timer
{
    UIButton *b = [timer userInfo];
    [self doButton2:b];

}


// lesson 8
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
//    count++;
//    CLLocation *location = locations [0];
//    NSLog(@"count: %i latitute: %f longitute: %f", count, location.coordinate.latitude, location.coordinate.longitude);
}




// (implement requiered protocol methods)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    [[cell textLabel] setNumberOfLines:0];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:10.0]];
    
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    cell.textLabel.text = item;

    return cell;
}




@end
