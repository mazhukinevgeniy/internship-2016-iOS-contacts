//
//  ContactStorage.h
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "Contact.h"

@interface ContactStorage : NSObject

- (void) addContact:(Contact*)contact;

@end

@protocol ContactStorageUser

- (void) useContactStorage:(ContactStorage*)storage;

@end
