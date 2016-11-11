//
//  FetchedDataSource.h
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "CoreData/CoreData.h"
#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>

@protocol CellCreator

- (UITableViewCell *) createCellWithData:(NSManagedObject*)managedObject forTableView:(UITableView*)tableView;

@end

@interface FetchedDataSource : NSObject <UITableViewDataSource>

- (FetchedDataSource *) initWithFetchedResultsController:(NSFetchedResultsController*)frc
                                          andCellCreator:(NSObject<CellCreator>*)cellCreator;
+ (FetchedDataSource *) initWithFetchedResultsController:(NSFetchedResultsController*)frc
                                          andCellCreator:(NSObject<CellCreator>*)cellCreator;

- (id) dataAtIndexPath:(NSIndexPath *)indexPath;

@end
