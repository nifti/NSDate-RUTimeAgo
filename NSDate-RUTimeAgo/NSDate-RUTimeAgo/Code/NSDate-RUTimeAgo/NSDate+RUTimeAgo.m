//
//  NSDate+RUUtility.m
//  Resplendent
//
//  Created by Benjamin Maer on 9/6/12.
//  Copyright (c) 2012 Resplendent G.P.. All rights reserved.
//

#import "NSDate+RUTimeAgo.h"
#import "RUConstants.h"
#import "RUProtocolOrNil.h"
#import "RUConditionalReturn.h"
#import "NSDate_RUTimeAgoFormatter_Abbreviated.h"





@interface NSDate (_RUTimeAgo)

+(NSCalendar*)ru_staticGregorianCalendar;

-(NSDateComponents*)ru_timoAgoDateComponentsFromDate;

+(NSInteger)ru_timeAgoStringAmountWithCalendarUnitType:(NSDate_RU_CalendarUnit)calendarUnit dateCompontents:(NSDateComponents*)comps;

+(NSDate_RU_CalendarUnit)ru_timeAgoMinCalendarUnitWithDateCompontents:(NSDateComponents*)comps;

@end





@implementation NSDate (_RUTimeAgo)

+(NSCalendar*)ru_staticGregorianCalendar
{
	static NSCalendar *gregorian;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	});

	return gregorian;
}

-(NSDateComponents*)ru_timoAgoDateComponentsFromDate
{
	NSInteger const gregorianComponents = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	return [[self.class ru_staticGregorianCalendar] components:gregorianComponents fromDate:self toDate:[NSDate date] options:0];
}

+(NSInteger)ru_timeAgoStringAmountWithCalendarUnitType:(NSDate_RU_CalendarUnit)calendarUnit dateCompontents:(NSDateComponents*)comps
{
	switch (calendarUnit)
	{
		case NSDate_RU_CalendarUnitYear:
			return comps.year;

		case NSDate_RU_CalendarUnitMonth:
			return comps.month;

		case NSDate_RU_CalendarUnitDay:
			return comps.day;

		case NSDate_RU_CalendarUnitHour:
			return comps.hour;

		case NSDate_RU_CalendarUnitMinute:
			return comps.minute;

		case NSDate_RU_CalendarUnitSecond:
			return MAX(comps.second, 0);
	}

	NSAssert(false, @"unhandled");
	return NSNotFound;
}

+(NSDate_RU_CalendarUnit)ru_timeAgoMinCalendarUnitWithDateCompontents:(NSDateComponents*)comps
{
	if (abs([comps year]) > 0)
	{
		return NSDate_RU_CalendarUnitYear;
	}
	else if (abs([comps month]) > 0)
	{
		return NSDate_RU_CalendarUnitMonth;
	}
	else if (abs([comps day]) > 0)
	{
		return NSDate_RU_CalendarUnitDay;
	}
	else if (abs([comps hour]) > 0)
	{
		return NSDate_RU_CalendarUnitHour;
	}
	else if (abs([comps minute]) > 0)
	{
		return NSDate_RU_CalendarUnitMinute;
	}
	else if (abs([comps second]) >= 0)
	{
		return NSDate_RU_CalendarUnitSecond;
	}

	NSAssert(false, @"unhandled");
	return NSDate_RU_CalendarUnitSecond;
}

@end





@implementation NSDate (RUTimeAgo)

#pragma mark - NSDate+RUTimeAgo
-(NSString*)ru_timeAgoString
{
	return [self ru_timeAgoStringWithFormatter:nil];
}

-(NSString*)ru_timeAgoStringWithFormatter:(id<NSDate_RUTimeAgoFormatter>)formatter
{
	kRUConditionalReturn_ReturnValueNil(((formatter != nil) && (kRUProtocolOrNil(formatter, NSDate_RUTimeAgoFormatter) == nil)), YES);

	NSDateComponents *comps = [self ru_timoAgoDateComponentsFromDate];
	NSDate_RU_CalendarUnit calendarUnit = [self.class ru_timeAgoMinCalendarUnitWithDateCompontents:comps];

	long timeAgoStringAmount = [self.class ru_timeAgoStringAmountWithCalendarUnitType:calendarUnit dateCompontents:comps];

	id<NSDate_RUTimeAgoFormatter> formatterToUse = (formatter ?: [self.class ru_timeAgoDefaultFormatter]);

	NSString* timeAgoString = (((timeAgoStringAmount != 1) && ([formatterToUse respondsToSelector:@selector(ru_timeAgoFormatterStringComponentPluralForCalendarUnit:)]))?
							   [formatterToUse ru_timeAgoFormatterStringComponentPluralForCalendarUnit:calendarUnit] :
							   [formatterToUse ru_timeAgoFormatterStringComponentForCalendarUnit:calendarUnit]);
//							   [formatterToUse ru_timeAgoFormatterStringComponentForCalendarUnit:calendarUnit] :
//							   ([formatterToUse respondsToSelector:@selector(ru_timeAgoFormatterStringComponentPluralForCalendarUnit:)] ?
//								[formatterToUse ru_timeAgoFormatterStringComponentPluralForCalendarUnit:calendarUnit] :
//								RUStringWithFormat(@"%@s",[formatterToUse ru_timeAgoFormatterStringComponentForCalendarUnit:calendarUnit])));

	return RUStringWithFormat(@"%li%@",timeAgoStringAmount,timeAgoString);
}

-(NSTimeInterval)ru_minTimeAgoUnitSeconds
{
    NSDateComponents *comps = [self ru_timoAgoDateComponentsFromDate];
	NSDate_RU_CalendarUnit minCalendarUnit = [self.class ru_timeAgoMinCalendarUnitWithDateCompontents:comps];
    switch (minCalendarUnit)
    {
        case NSDate_RU_CalendarUnitDay:
            return 86400.0f;

		case NSDate_RU_CalendarUnitHour:
            return 3600.0f;

		case NSDate_RU_CalendarUnitMinute:
            return 60.0f;

		case NSDate_RU_CalendarUnitSecond:
            return 1.0f;

		case NSDate_RU_CalendarUnitYear:
        case NSDate_RU_CalendarUnitMonth:
        default:
            return 0.0f;
    }

	NSAssert(false, @"unhandled");
	return 0;
}

#pragma mark - ru_timeAgoDefaultFormatter
static id<NSDate_RUTimeAgoFormatter> kNSDate_RUTimeAgo_timeAgoDefaultFormatter;
+(id<NSDate_RUTimeAgoFormatter>)ru_timeAgoDefaultFormatter
{
	if (kNSDate_RUTimeAgo_timeAgoDefaultFormatter == nil)
	{
		[self ru_setTimeAgoDefaultFormatter:[NSDate_RUTimeAgoFormatter_Abbreviated new]];
	}

	return kNSDate_RUTimeAgo_timeAgoDefaultFormatter;
}

+(void)ru_setTimeAgoDefaultFormatter:(id<NSDate_RUTimeAgoFormatter>)formatter
{
	kNSDate_RUTimeAgo_timeAgoDefaultFormatter = formatter;
}

@end
