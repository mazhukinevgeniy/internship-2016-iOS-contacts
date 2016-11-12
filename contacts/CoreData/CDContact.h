//
//  CDContact.h
//  contacts
//
//  Created by Admin on 10/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CDCall;

@interface CDContact : NSManagedObject

@property (readonly, strong) NSString* firstName;
@property (readonly, strong) NSString* lastName;

@property (readonly, strong) NSString* number;

@property (readonly, strong) NSSet* calls;
//TODO: investigate: does strong mean anything here?

@property (readonly, strong) NSNumber* hidden;

-(NSString*) fullName;
-(NSString*) toString;

@end
