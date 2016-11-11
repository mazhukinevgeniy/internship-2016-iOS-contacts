//
//  ContactsController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "EditContactViewController.h"
#import "ContactsController.h"
#import "ContactInfoController.h"
#import "SegueNames.h"

@interface ContactsController()

@property (strong) DataStorage * storage;
@property (strong) FetchedDataSource * fetchedDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ContactsController

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


#pragma mark - defined by protocols

- (void)useDataStorage:(DataStorage*)storage {
    _storage = storage;
    
    _fetchedDataSource = [FetchedDataSource initWithFetchedResultsController:[storage generateFetchedResultsControllerForContacts]
                                                              andCellCreator:self];
}

- (UITableViewCell*) createCellWithData:(NSManagedObject*)managedObject forTableView:(UITableView*)tableView {
    NSString * cellIdentifier = @"contactViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:cellIdentifier];
    }
    
    CDContact * contact = (CDContact*) managedObject;
    
    [[cell textLabel] setText:[contact toString]];
    return cell;
}

#pragma mark - prepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    NSString * segueID = segue.identifier;
    
    if ([segueID isEqualToString:SHOW_CONTACT]) {
        ContactInfoController * contactInfoController = [segue destinationViewController];
        
        [contactInfoController useContact:[_fetchedDataSource dataAtIndexPath:[_tableView indexPathForSelectedRow]] withContactRemover:_storage];
    } else if ([segueID isEqualToString:ADD_CONTACT]) {
        EditContactViewController * editController = [segue destinationViewController];
        
        [editController setEditorWithContact:nil];
    }
}

#pragma mark - other methods
- (IBAction)callButtonTouched:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:_tableView];
    NSIndexPath* indexPath = [_tableView indexPathForRowAtPoint:buttonPosition];
    
    CDContact * contact = [_fetchedDataSource dataAtIndexPath:indexPath];
    
    UIAlertController* callAlert = [UIAlertController alertControllerWithTitle:@"Calling" message:[contact fullName] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"End call"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {
                [_storage addCallWithDate:[NSDate date] andTarget:contact];
            }];
    
    [callAlert addAction:defaultAction];
    [self presentViewController:callAlert animated:YES completion:nil];
}

- (IBAction)addDefaultButtonTouched:(id)sender {
    if (_storage != nil) {
        NSArray * names = @[@"Bob", @"", @"Disable roaming", @"Sara"];
        NSArray * lastNames = @[@"", @"Vasiliev", @"", @"Poppins"];
        NSArray * numbers = @[@"89123", @"01", @"#101*", @"89654"];
        
        for (int i = 0; i < 4; i++) {
            [_storage addContactWithFirstName:names[i]
                                     lastName:lastNames[i]
                                       number:numbers[i]];
        }
        
        [_tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
