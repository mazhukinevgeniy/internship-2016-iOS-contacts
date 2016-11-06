//
//  Call.h
//  contacts
//
//  Created by Admin on 06/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface Call : NSObject

@property (strong, readonly) Contact * callTarget;
@property (strong, readonly) NSDate * date;

- (Call*) initWithTarget:(Contact*)target andDate:(NSDate*)date;
+ (Call*) initWithTarget:(Contact*)target andDate:(NSDate*)date;

@end
