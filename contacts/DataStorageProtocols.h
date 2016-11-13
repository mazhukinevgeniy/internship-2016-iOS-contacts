//
//  DataStorageProtocols.h
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "CDContact.h"

typedef enum {
    WRONG_FIRSTNAME,
    WRONG_LASTNAME,
    WRONG_NUMBER
} ContactValidatorFlags;

@protocol ContactManager

- (nonnull NSArray*) addContactWithFirstName:(nonnull NSString*)fName
                                    lastName:(nonnull NSString*)lName
                                      number:(nonnull NSString*)phoneNumber;

- (nonnull NSArray*) modifyContact:(nonnull CDContact*)contact
                     withFirstName:(nonnull NSString*)fName
                          lastName:(nonnull NSString*)lName
                            number:(nonnull NSString*)phoneNumber;

- (void) restoreContact:(nonnull CDContact*)contact;
- (void) deleteContact:(nonnull CDContact*)contact;

@end
