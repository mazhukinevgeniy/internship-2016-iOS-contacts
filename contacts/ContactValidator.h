//
//  ContactValidator.h
//  contacts
//
//  Created by Admin on 13/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataStorageProtocols.h"

@interface ContactValidator : NSObject

- (NSArray*) validateContactWithFirstName:(NSString*)fName
                                 lastName:(NSString*)lName
                                andNumber:(NSString*)number;

@end
