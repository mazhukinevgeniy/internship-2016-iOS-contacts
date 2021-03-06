//
//  HistoryController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "AlertFactory.h"
#import "ContactInfoController.h"
#import "HistoryController.h"
#import "SegueNames.h"

@interface HistoryController()

@property (strong) DataStorage * storage;
@property (strong) CallController * callController;
@property (strong) FetchedDataSource * fetchedDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    assert(_tableView != nil);
    
    if (_tableView.dataSource == nil) {
        _tableView.delegate = self;
        _tableView.dataSource = _fetchedDataSource;
    }
    
    [_tableView reloadData];
}

- (void) useDataStorage:(DataStorage*)storage andCallController:(CallController*)callController {
    _storage = storage;
    _callController = callController;
    
    NSFetchedResultsController * frc = [storage generateFetchedResultsControllerForCalls];
    _fetchedDataSource = [FetchedDataSource initWithFetchedResultsController:frc
                                                              andCellCreator:self];
}

- (UITableViewCell *) createCellWithData:(NSManagedObject*)managedObject forTableView:(UITableView*)tableView {
    NSString * cellIdentifier = @"callViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:cellIdentifier];
    }
    
    CDCall * call = (CDCall*)managedObject;
    
    NSString *dateString = [NSDateFormatter localizedStringFromDate:call.date
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterShortStyle];
    cell.textLabel.numberOfLines = 0;
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@\n%@",
                               dateString, [call.contact fullName]]];
    return cell;
}

#pragma mark - prepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:SHOW_CONTACT]) {
        ContactInfoController* contactInfoController = (ContactInfoController*)segue.destinationViewController;
        
        CDCall * call = [_fetchedDataSource dataAtIndexPath:[_tableView indexPathForSelectedRow]];
        
        [contactInfoController useContact:call.contact contactManager:_storage andCallController:_callController];
    }
}

#pragma mark - other methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)removeButtonTouched:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:_tableView];
    NSIndexPath* indexPath = [_tableView indexPathForRowAtPoint:buttonPosition];
    
    CDCall * call = [_fetchedDataSource dataAtIndexPath:indexPath];
    
    void (^confirmationHandler)(UIAlertAction * action)  = ^(UIAlertAction * action) {
        [_storage deleteCall:call];
        [_tableView reloadData];
    };
    
    UIAlertController* alert = [AlertFactory confirmationAlertWithMessage:@"Delete call?"
                                                           customResponse:@"Delete"
                                                       andResponseHandler:confirmationHandler];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
