//
//  AppDelegate.m
//  NSDate-RUTimeAgo
//
//  Created by Benjamin Maer on 12/20/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import "AppDelegate.h"
#import "NSDate+RUTimeAgo.h"
#import "NSDate_RUTimeAgoFormatter_FullWord.h"





@interface AppDelegate ()

-(void)printSomeDates;

@end





@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self printSomeDates];

	[NSDate ru_setTimeAgoDefaultFormatter:[NSDate_RUTimeAgoFormatter_FullWord new]];

	[self printSomeDates];
	
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

#pragma mark - printSomeDates
-(void)printSomeDates
{
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];

	NSDate* oneSecondAgo = [NSDate dateWithTimeIntervalSinceNow:-1.0f];
	NSLog(@"oneSecondAgo: %@",[oneSecondAgo ru_timeAgoString]);
	
	NSDate* oneMinuteAgo = [NSDate dateWithTimeIntervalSinceNow:-(60.0f * 1.0f)];
	NSLog(@"oneMinuteAgo: %@",[oneMinuteAgo ru_timeAgoString]);
	
	NSDate* oneHourAgo = [NSDate dateWithTimeIntervalSinceNow:-(60.0f * 60.0f * 1.0f)];
	NSLog(@"oneHourAgo: %@",[oneHourAgo ru_timeAgoString]);
	
	NSDate* oneDayAgo = [NSDate dateWithTimeIntervalSinceNow:-(60.0f * 60.0f * 24.0f * 1.0f)];
	NSLog(@"oneDayAgo: %@",[oneDayAgo ru_timeAgoString]);

	NSDateComponents* oneMonthAgoDateComponents = [NSDateComponents new];
	[oneMonthAgoDateComponents setMonth:-1];

	NSDate* oneMonthAgo = [gregorian dateByAddingComponents:oneMonthAgoDateComponents toDate:[NSDate date] options:0];
	NSLog(@"oneMonthAgo: %@",[oneMonthAgo ru_timeAgoString]);

	NSDateComponents* oneYearAgoDateComponents = [NSDateComponents new];
	[oneYearAgoDateComponents setYear:-1];
	
	NSDate* oneYearAgo = [gregorian dateByAddingComponents:oneYearAgoDateComponents toDate:[NSDate date] options:0];
	NSLog(@"oneYearAgo: %@",[oneYearAgo ru_timeAgoString]);


	
	
	NSDate* fiveSecondsAgo = [NSDate dateWithTimeIntervalSinceNow:-5.0f];
	NSLog(@"fiveSecondsAgo: %@",[fiveSecondsAgo ru_timeAgoString]);
	
	NSDate* fiveMinutesAgo = [NSDate dateWithTimeIntervalSinceNow:-(60.0f * 5.0f)];
	NSLog(@"fiveMinutesAgo: %@",[fiveMinutesAgo ru_timeAgoString]);
	
	NSDate* fiveHoursAgo = [NSDate dateWithTimeIntervalSinceNow:-(60.0f * 60.0f * 5.0f)];
	NSLog(@"fiveHoursAgo: %@",[fiveHoursAgo ru_timeAgoString]);
	
	NSDate* fiveDaysAgo = [NSDate dateWithTimeIntervalSinceNow:-(60.0f * 60.0f * 24.0f * 5.0f)];
	NSLog(@"fiveDaysAgo: %@",[fiveDaysAgo ru_timeAgoString]);
	
	NSDateComponents* fiveMonthsAgoDateComponents = [NSDateComponents new];
	[fiveMonthsAgoDateComponents setMonth:-5];
	
	NSDate* fiveMonthsAgo = [gregorian dateByAddingComponents:fiveMonthsAgoDateComponents toDate:[NSDate date] options:0];
	NSLog(@"fiveMonthsAgo: %@",[fiveMonthsAgo ru_timeAgoString]);

	NSDateComponents* fiveYearsAgoDateComponents = [NSDateComponents new];
	[fiveYearsAgoDateComponents setYear:-5];
	
	NSDate* fiveYearsAgo = [gregorian dateByAddingComponents:fiveYearsAgoDateComponents toDate:[NSDate date] options:0];
	NSLog(@"fiveYearsAgo: %@",[fiveYearsAgo ru_timeAgoString]);
}

@end
