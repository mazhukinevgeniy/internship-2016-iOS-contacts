//
//  EditContactViewController.m
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "AlertFactory.h"
#import "EditContactViewController.h"

@interface EditContactViewController ()

@property (weak) NSObject<ContactManager> * contactManager;

@property (strong) CDContact * contact;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

- (void) showFirstName:(NSString*)fName
              lastName:(NSString*)lName
             andNumber:(NSString*)number;

- (void) showErrors:(NSArray*)errors;

@end

@implementation EditContactViewController

- (void) showFirstName:(NSString*)fName
              lastName:(NSString*)lName
             andNumber:(NSString*)number {
    [_firstNameTextField setText:fName];
    [_lastNameTextField setText:lName];
    [_numberTextField setText:number];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_contact == nil) {
        self.navigationItem.title = @"New contact";
        
        [self showFirstName:@"" lastName:@"" andNumber:@""];
    } else {
        self.navigationItem.title = @"Edit contact";
        
        [self showFirstName:_contact.firstName
                   lastName:_contact.lastName
                  andNumber:_contact.number];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setEditorWithContact:(nullable CDContact*)contact
            andContactManager:(nonnull NSObject<ContactManager>*)contactManager {
    _contactManager = contactManager;
    _contact = contact;
}

- (void) showErrors:(NSArray*)errors {
    if ([errors count] == 0) {
        [[self navigationController] popViewControllerAnimated:YES];
    } else {
        NSString * message;
        int firstError = [((NSNumber*)[errors firstObject]) intValue];
        
        if (firstError == WRONG_NUMBER) {
            message = @"Allowed symbols for number are 0-9, +, *, #";
        } else if (firstError == NO_NUMBER) {
            message = @"Contact should have a number";
        } else {
            //must be a name error
            message = @"Contact should have a name";
        }
        
        UIAlertController * alert = [AlertFactory alertWithTitle:@"Error"
                                                      andMessage:message];
        [alert addAction:[AlertFactory simpleAction:@"OK"]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)saveButtonTouched:(id)sender {
    NSString * fName = _firstNameTextField.text;
    NSString * lName = _lastNameTextField.text;
    NSString * number = _numberTextField.text;
    
    NSArray * errors = nil;
    
    if (_contact == nil) {
        errors = [_contactManager addContactWithFirstName:fName
                                                 lastName:lName
                                                   number:number];
    } else {
        errors = [_contactManager modifyContact:_contact
                                  withFirstName:fName
                                       lastName:lName
                                         number:number];
    }
    
    [self showErrors:errors];
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
