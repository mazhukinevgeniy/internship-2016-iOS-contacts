//
//  ContactsController.h
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UITableView.h>
#import "DataStorage.h"
#import "FetchedDataSource.h"
#import "PrimaryViewController.h"

@interface ContactsController : UIViewController<InitializedWithPrimaryVC, UITableViewDelegate, CellCreator>

@end
