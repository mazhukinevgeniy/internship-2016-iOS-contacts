//
//  CDCall.h
//  contacts
//
//  Created by Admin on 10/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "CDContact.h"

@interface CDCall : NSManagedObject

@property (readonly, strong) CDContact * contact;
@property (readonly, strong) NSDate * date;

@end
