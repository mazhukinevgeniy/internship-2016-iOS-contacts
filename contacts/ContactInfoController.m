//
//  ViewController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "ContactInfoController.h"

@interface ContactInfoController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak) CDContact* contact;
@property (weak) NSObject<CanDeleteContact>* contactRemover;

@end

@implementation ContactInfoController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_nameLabel setText:[_contact fullName]];
    [_numberLabel setText:_contact.number];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) useContact:(CDContact*)contact withContactRemover:(NSObject<CanDeleteContact>*)remover {
    _contact = contact;
    _contactRemover = remover;
}

- (IBAction)editButtonTouched:(id)sender {
    [self performSegueWithIdentifier:@"editContact" sender:sender];
}

- (IBAction)deleteButtonTouched:(id)sender {
    UIAlertController* confirmationAlert = [UIAlertController alertControllerWithTitle:@"Confirmation" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {}];
    
    UIAlertAction* delete =
        [UIAlertAction actionWithTitle:@"Delete"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [_contactRemover tryToDeleteContact:_contact];
                                   [[self navigationController] popViewControllerAnimated:YES];
                               }];
    
    [confirmationAlert addAction:cancel];
    [confirmationAlert addAction:delete];
    
    [self presentViewController:confirmationAlert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
