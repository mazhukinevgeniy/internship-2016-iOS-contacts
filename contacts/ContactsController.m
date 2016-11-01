//
//  ContactsController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "ContactsController.h"

@interface ContactsController ()

@end

@implementation ContactsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)contactInfoTouched:(id)sender {
    [self performSegueWithIdentifier:@"showContact" sender:sender];
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
