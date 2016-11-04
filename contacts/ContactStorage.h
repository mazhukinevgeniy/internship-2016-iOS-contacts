//
//  ContactStorage.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "Contact.h"

@interface ContactStorage : NSObject

- (ContactStorage*) init;
+ (ContactStorage*) init;

- (void) addContact:(Contact*)contact;

//must return actual contact if 0 <= position < getNumberOfContacts
- (Contact*) getContact:(long)position;
- (long) getNumberOfContacts;

@end

@protocol ContactStorageUser

- (void) useContactStorage:(ContactStorage*)storage;

@end
