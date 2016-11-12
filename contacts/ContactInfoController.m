//
//  ViewController.m
//  contacts
//
//  Created by Admin on 01/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "EditContactViewController.h"
#import "ConfirmationAlert.h"
#import "ContactInfoController.h"
#import "SegueNames.h"

@interface ContactInfoController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak) CDContact * contact;
@property (weak) NSObject<ContactManager> * contactManager;
@property (weak) CallController * callController;

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

- (void) useContact:(CDContact*)contact
     contactManager:(NSObject<ContactManager>*)contactManager
  andCallController:(CallController*)callController {
    _contact = contact;
    _contactManager = contactManager;
    _callController = callController;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([[segue identifier] isEqualToString:EDIT_CONTACT]) {
        EditContactViewController * controller = [segue destinationViewController];
        
        [controller setEditorWithContact:_contact andContactManager:_contactManager];
    }
}

- (IBAction)callButtonTouched:(id)sender {
    UIAlertController * call = [_callController getCallAlertForContact:_contact];
    [self presentViewController:call animated:YES completion:nil];
}


- (IBAction)deleteButtonTouched:(id)sender {
    void (^confirmationHandler)(UIAlertAction * action)  = ^(UIAlertAction * action) {
        [_contactManager deleteContact:_contact];
        [[self navigationController] popViewControllerAnimated:YES];
    };
    
    UIAlertController* confirmationAlert = [ConfirmationAlert getAlertWithMessage:@"Delete contact?"
                                                                   customResponse:@"Delete"
                                                         andCustomResponseHandler:confirmationHandler];
    
    [self presentViewController:confirmationAlert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
