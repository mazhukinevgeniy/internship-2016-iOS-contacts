//
//  ContactStorage.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "Contact.h"
#import "Call.h"
#import <CoreData/CoreData.h>

@interface DataStorage : NSObject

- (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;
+ (DataStorage*) initWithPersistentContainer:(NSPersistentContainer*)container;

- (void) addContact:(Contact*)contact;
- (void) addCall:(Call*)call;

//must return actual contact if 0 <= position < getNumberOfContacts
- (Contact*) getContact:(long)position;
- (long) getNumberOfContacts;

//must return actual call if 0 <= position < getNumberOfCalls
- (Call*) getCall:(long)position;
- (long) getNumberOfCalls;

@end

@protocol DataStorageUser

- (void) useDataStorage:(DataStorage*)storage;

@end
