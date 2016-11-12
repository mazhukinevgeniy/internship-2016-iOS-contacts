//
//  EditContactViewController.m
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import "EditContactViewController.h"
#import "CoreDataKeys.h"

@interface EditContactViewController ()

@property (weak) NSObject<ContactManager> * contactManager;

@property (strong) CDContact * contact;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

- (void) showFirstName:(NSString*)fName
              lastName:(NSString*)lName
             andNumber:(NSString*)number;

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
        [self setTitle:@"New contact"];
        
        [self showFirstName:@"" lastName:@"" andNumber:@""];
    } else {
        [self setTitle:@"Edit contact"];
        
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

- (IBAction)saveButtonTouched:(id)sender {
    NSString * fName = _firstNameTextField.text;
    NSString * lName = _lastNameTextField.text;
    NSString * number = _numberTextField.text;
    
    if (_contact == nil) {
        [_contactManager addContactWithFirstName:fName lastName:lName number:number];
    } else {
        [_contact setValue:fName forKey:FIRST_NAME_KEY];
        [_contact setValue:lName forKey:LAST_NAME_KEY];
        [_contact setValue:number forKey:NUMBER_KEY];
        [_contact setValue:[NSNumber numberWithBool:NO] forKey:HIDDEN_KEY];
        
        [_contactManager saveChangesToContact:_contact];
    }
    
    //TODO: add validation; if contact can't be added, show what's the problem
    
    [[self navigationController] popViewControllerAnimated:YES];
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
