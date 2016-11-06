//
//  Call.m
//  contacts
//
//  Created by Admin on 06/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "Call.h"

@interface Call()

@property (strong, readwrite) Contact * callTarget;
@property (strong, readwrite) NSDate * date;

@end

@implementation Call


- (Call*) initWithTarget:(Contact*)target andDate:(NSDate*)date {
    if (self = [super init]) {
        _callTarget = target;
        _date = date;
        
        return self;
    }
    else
        return nil;
}
+ (Call*) initWithTarget:(Contact*)target andDate:(NSDate*)date {
    return [[Call alloc] initWithTarget:target andDate:date];
}

@end
