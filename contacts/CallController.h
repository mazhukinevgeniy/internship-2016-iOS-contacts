//
//  CallController.h
//  contacts
//
//  Created by Admin on 12/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDContact.h"
#import "DataStorage.h"

@interface CallController : NSObject

- (CallController*) initWithStorage:(DataStorage*)storage;
+ (CallController*) initWithStorage:(DataStorage*)storage;

- (UIAlertController*) getCallAlertForContact:(CDContact*)contact;

@end
