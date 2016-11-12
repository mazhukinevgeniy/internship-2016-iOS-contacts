//
//  HistoryController.h
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FetchedDataSource.h"
#import "PrimaryViewController.h"

@interface HistoryController : UIViewController<InitializedWithPrimaryVC, UITableViewDelegate, CellCreator>

@end
