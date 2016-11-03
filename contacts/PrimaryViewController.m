//
//  PrimaryViewController.m
//  contacts
//
//  Created by Admin on 02/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "PrimaryViewController.h"
#import "ContactStorage.h"

@interface PrimaryViewController()

- (void)addSampleContacts:(ContactStorage *)storage;

@end



@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContactStorage * storage = [[ContactStorage alloc] init];
    [self addSampleContacts:storage];
    
    for (NSObject<ContactStorageUser>* controller in [self viewControllers])
    {
        [controller useContactStorage:storage];
    }
}

- (void)addSampleContacts:(ContactStorage *)storage {
    NSArray * ids = @[@0, @1, @2, @3];
    NSArray * names = @[@"Bob", @"", @"Disable roaming", @"Sara"];
    NSArray * lastNames = @[@"", @"Vasiliev", @"", @"Poppins"];
    NSArray * numbers = @[@"89123", @"01", @"#101*", @"89654"];
    
    for (int i = 0; i < 4; i++)
    {
        Contact * contact = [Contact initWith:(int)ids[i] firstName:names[i]
                                    lastName:lastNames[i]
                                       number:numbers[i]];
        
        [storage addContact:contact];
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
