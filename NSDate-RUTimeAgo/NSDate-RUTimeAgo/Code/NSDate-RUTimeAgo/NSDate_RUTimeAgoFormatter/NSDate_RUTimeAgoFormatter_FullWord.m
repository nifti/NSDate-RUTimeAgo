//
//  NSDate_RUTimeAgoFormatter_FullWord.m
//  NSDate-RUTimeAgo
//
//  Created by Benjamin Maer on 12/21/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import "NSDate_RUTimeAgoFormatter_FullWord.h"
#import "RUConstants.h"





@implementation NSDate_RUTimeAgoFormatter_FullWord

#pragma mark - NSDate_RUTimeAgoFormatter
-(NSString *)ru_timeAgoFormatterStringComponentForCalendarUnit:(NSDate_RU_CalendarUnit)calendarUnit
{
	return RUStringWithFormat(@" %@",[self timeAgoFormatterStringComponentForCalendarUnitWithoutString:calendarUnit]);
}

-(NSString *)ru_timeAgoFormatterStringComponentPluralForCalendarUnit:(NSDate_RU_CalendarUnit)calendarUnit
{
	return RUStringWithFormat(@"%@s",[self ru_timeAgoFormatterStringComponentForCalendarUnit:calendarUnit]);
}

#pragma mark - NSDate_RUTimeAgoFormatter_FullWord
-(NSString *)timeAgoFormatterStringComponentForCalendarUnitWithoutString:(NSDate_RU_CalendarUnit)calendarUnit
{
	switch (calendarUnit)
	{
		case NSDate_RU_CalendarUnitSecond:
			return @"second";
			
		case NSDate_RU_CalendarUnitMinute:
			return @"minute";
			
		case NSDate_RU_CalendarUnitHour:
			return @"hour";
			
		case NSDate_RU_CalendarUnitDay:
			return @"day";
			
		case NSDate_RU_CalendarUnitMonth:
			return @"month";
			
		case NSDate_RU_CalendarUnitYear:
			return @"year";
	}
	
	NSAssert(false, @"unhandled");
	return nil;
}

@end
