//
//  EditContactViewController.h
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDContact.h"
#import "DataStorageProtocols.h"

@interface EditContactViewController : UIViewController

- (void) setEditorWithContact:(nullable CDContact*)contact
            andContactManager:(nonnull NSObject<ContactManager>*)contactManager;

@end
