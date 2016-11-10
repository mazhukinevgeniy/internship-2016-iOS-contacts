//
//  ContactsController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "ContactsController.h"
#import "ContactInfoController.h"
#import "SegueNames.h"

@interface ContactsController()

@property (strong) DataStorage* storage;
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
    
    if (_tableView.delegate == nil)
    {
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    [_tableView reloadData];
}


#pragma mark - defined by protocols

- (void)useDataStorage:(DataStorage*)storage {
    _storage = storage;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_storage getNumberOfContacts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellIdentifier = @"contactViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:cellIdentifier];
    }
    
    CDContact * contact = [_storage getContact:indexPath.row];
    
    [[cell textLabel] setText:[contact toString]];
    return cell;
}

#pragma mark - prepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:SHOW_CONTACT]) {
        ContactInfoController* contactInfoController = (ContactInfoController*)segue.destinationViewController;
        
        [contactInfoController useContact:[_storage getContact:[_tableView indexPathForSelectedRow].row]];
    }
}

#pragma mark - other methods
- (IBAction)callButtonTouched:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:_tableView];
    NSIndexPath* indexPath = [_tableView indexPathForRowAtPoint:buttonPosition];
    
    CDContact * contact = [_storage getContact:indexPath.row];
    
    UIAlertController* callAlert = [UIAlertController alertControllerWithTitle:@"Calling" message:[contact fullName] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"End call"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {
                [_storage addCall:[Call initWithTarget:contact andDate:[NSDate date]]];
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

- (IBAction)addButtonTouched:(id)sender {
    [self performSegueWithIdentifier:@"addContact" sender:sender];
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
