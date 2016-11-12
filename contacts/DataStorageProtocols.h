//
//  DataStorageProtocols.h
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

@protocol ContactManager

- (void) addContactWithFirstName:(nonnull NSString*)fName
                        lastName:(nonnull NSString*)lName
                          number:(nonnull NSString*)phoneNumber;

- (void) saveChangesToContact:(nonnull CDContact*)contact;

- (void) deleteContact:(nonnull CDContact*)contact;

@end
