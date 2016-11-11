//
//  ContactStorage.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "Call.h"
#import <CoreData/CoreData.h>

@interface DataStorage : NSObject

- (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;
+ (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;

- (void) addContactWithFirstName:(NSString*)fName
                        lastName:(NSString*)lName
                          number:(NSString*)phoneNumber;
- (void) addCall:(Call*)call;

- (NSInteger) numberOfContactSections;
- (NSInteger) numberOfContactsInSection:(NSInteger)section;
- (CDContact*) contactAtIndexPath:(NSIndexPath*)indexPath;

//must return actual call if 0 <= position < getNumberOfCalls
- (Call*) getCall:(long)position;
- (NSInteger) getNumberOfCalls;

@end

@protocol DataStorageUser

- (void) useDataStorage:(DataStorage*)storage;

@end
