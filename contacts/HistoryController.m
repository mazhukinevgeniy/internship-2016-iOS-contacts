//
//  HistoryController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "HistoryController.h"
#import "ContactInfoController.h"

@interface HistoryController()

@property (strong) DataStorage* storage;
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
    
    if (_tableView.delegate == nil)
    {
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    [_tableView reloadData];
}

- (void)useDataStorage:(DataStorage*)storage {
    _storage = storage;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_storage getNumberOfCalls];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellIdentifier = @"callViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:cellIdentifier];
    }
    
    Call * call = [_storage getCall:indexPath.row];
    
    NSString *dateString = [NSDateFormatter localizedStringFromDate:call.date
                            dateStyle:NSDateFormatterShortStyle
                            timeStyle:NSDateFormatterShortStyle];
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@",
                               dateString, [call.callTarget fullName]]];
    //TODO: make info more visible, it doesn't fit
    return cell;
}

#pragma mark - prepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:@"showContact"]) {
        ContactInfoController* contactInfoController = (ContactInfoController*)segue.destinationViewController;
        
        [contactInfoController useContact:[_storage getCall:[_tableView indexPathForSelectedRow].row].callTarget];
    }
}

#pragma mark - other methods

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
