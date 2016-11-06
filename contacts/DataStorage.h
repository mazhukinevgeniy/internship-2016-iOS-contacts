//
//  ContactStorage.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "Contact.h"

@interface DataStorage : NSObject

- (DataStorage*) init;
+ (DataStorage*) init;

- (void) addContact:(Contact*)contact;

//must return actual contact if 0 <= position < getNumberOfContacts
- (Contact*) getContact:(long)position;
- (long) getNumberOfContacts;

@end

@protocol DataStorageUser

- (void) useDataStorage:(DataStorage*)storage;

@end
