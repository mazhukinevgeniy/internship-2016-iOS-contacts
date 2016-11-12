//
//  ViewController.h
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDContact.h"
#import "DataStorageProtocols.h"

@interface ContactInfoController : UIViewController

-(void) useContact:(CDContact*)contact withContactManager:(NSObject<ContactManager>*)contactManager;

@end

