//
//  NSDate_RUTimeAgoFormatter_FullWord.h
//  NSDate-RUTimeAgo
//
//  Created by Benjamin Maer on 12/21/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate_RUTimeAgoFormatter.h"





@interface NSDate_RUTimeAgoFormatter_FullWord : NSObject <NSDate_RUTimeAgoFormatter>

-(NSString *)timeAgoFormatterStringComponentForCalendarUnitWithoutString:(NSDate_RU_CalendarUnit)calendarUnit;

@end
