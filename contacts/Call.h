//
//  Call.h
//  contacts
//
//  Created by Admin on 06/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDContact.h"

@interface Call : NSObject

@property (strong, readonly) CDContact * callTarget;
@property (strong, readonly) NSDate * date;
//TODO: check if strong references to nsManagedObjects are like normal strong references

- (Call*) initWithTarget:(CDContact*)target andDate:(NSDate*)date;
+ (Call*) initWithTarget:(CDContact*)target andDate:(NSDate*)date;

@end
