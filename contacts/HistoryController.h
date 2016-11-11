//
//  HistoryController.h
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataStorage.h"
#import "FetchedDataSource.h"

@interface HistoryController : UIViewController<DataStorageUser, UITableViewDelegate, CellCreator>

@end
