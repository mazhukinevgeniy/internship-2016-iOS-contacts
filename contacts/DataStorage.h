//
//  ContactStorage.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "CDCall.h"
#import "CDContact.h"
#import <CoreData/CoreData.h>

@interface DataStorage : NSObject

- (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;
+ (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;

- (void) addContactWithFirstName:(NSString*)fName
                        lastName:(NSString*)lName
                          number:(NSString*)phoneNumber;
- (void) addCallWithDate:(NSDate*)date
               andTarget:(CDContact*)contact;

- (NSFetchedResultsController*) generateFetchedResultsControllerForContacts;
- (NSFetchedResultsController*) generateFetchedResultsControllerForCalls;

@end

@protocol DataStorageUser

- (void) useDataStorage:(DataStorage*)storage;

@end
