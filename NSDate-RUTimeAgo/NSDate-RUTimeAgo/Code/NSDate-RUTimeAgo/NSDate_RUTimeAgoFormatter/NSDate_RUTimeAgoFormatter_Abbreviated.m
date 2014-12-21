//
//  NSDate_RUTimeAgoFormatter_Abbreviated.m
//  NSDate-RUTimeAgo
//
//  Created by Benjamin Maer on 12/21/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import "NSDate_RUTimeAgoFormatter_Abbreviated.h"





@implementation NSDate_RUTimeAgoFormatter_Abbreviated

#pragma mark - NSDate_RUTimeAgoFormatter
-(NSString *)ru_timeAgoFormatterStringComponentForCalendarUnit:(NSDate_RU_CalendarUnit)calendarUnit
{
	switch (calendarUnit)
	{
		case NSDate_RU_CalendarUnitYear:
			return @"y";
			
		case NSDate_RU_CalendarUnitMonth:
			return @"mo";
			
		case NSDate_RU_CalendarUnitDay:
			return @"d";
			
		case NSDate_RU_CalendarUnitHour:
			return @"h";
			
		case NSDate_RU_CalendarUnitMinute:
			return @"m";
			
		case NSDate_RU_CalendarUnitSecond:
			return @"s";
	}
	
	NSAssert(false, @"unhandled");
	return nil;
}

@end
