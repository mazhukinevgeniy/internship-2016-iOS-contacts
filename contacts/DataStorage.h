//
//  ContactStorage.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "CDCall.h"
#import "CDContact.h"
#import "DataStorageProtocols.h"

#import <CoreData/CoreData.h>

@interface DataStorage : NSObject<ContactManager>

- (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;
+ (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;


- (void) addCallWithDate:(NSDate*)date
               andTarget:(CDContact*)contact;
- (void) deleteCall:(CDCall*)call;

- (NSFetchedResultsController*) generateFetchedResultsControllerForContacts;
- (NSFetchedResultsController*) generateFetchedResultsControllerForCalls;

@end
