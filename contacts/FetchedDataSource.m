//
//  FetchedDataSource.m
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "FetchedDataSource.h"

@interface FetchedDataSource()

@property (strong) NSFetchedResultsController * fetchedResults;
@property (weak) NSObject<CellCreator> * cellCreator;

@end

@implementation FetchedDataSource

- (FetchedDataSource *) initWithFetchedResultsController:(NSFetchedResultsController*)frc
                                          andCellCreator:(NSObject<CellCreator>*)cellCreator {
    assert(frc != nil);
    assert(cellCreator != nil);
    
    if (self = [super init]) {
        _fetchedResults = frc;
        _cellCreator = cellCreator;
        
        return self;
    } else {
        return nil;
    }
}
+ (FetchedDataSource *) initWithFetchedResultsController:(NSFetchedResultsController*)frc
                                          andCellCreator:(NSObject<CellCreator>*)cellCreator {
    return [[FetchedDataSource alloc] initWithFetchedResultsController:frc
                                                        andCellCreator:cellCreator];
}

- (id) dataAtIndexPath:(NSIndexPath *)indexPath {
    return [_fetchedResults objectAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_fetchedResults sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [_fetchedResults sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject * data = [self dataAtIndexPath:indexPath];
    UITableViewCell * cell = [_cellCreator createCellWithData:data forTableView:tableView];
    
    return cell;
}

@end
