//
//  NSDate_RUTimeAgoFormatter.h
//  NSDate-RUTimeAgo
//
//  Created by Benjamin Maer on 12/21/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import <Foundation/Foundation.h>





typedef enum{
	NSDate_RU_CalendarUnitSecond,
	NSDate_RU_CalendarUnitMinute,
	NSDate_RU_CalendarUnitHour,
	NSDate_RU_CalendarUnitDay,
	NSDate_RU_CalendarUnitMonth,
	NSDate_RU_CalendarUnitYear
}NSDate_RU_CalendarUnit;





@protocol NSDate_RUTimeAgoFormatter <NSObject>

@required
-(NSString*)ru_timeAgoFormatterStringComponentForCalendarUnit:(NSDate_RU_CalendarUnit)calendarUnit;

@optional
-(NSString*)ru_timeAgoFormatterStringComponentPluralForCalendarUnit:(NSDate_RU_CalendarUnit)calendarUnit;

@end
