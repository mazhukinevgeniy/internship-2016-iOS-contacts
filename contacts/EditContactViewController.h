//
//  EditContactViewController.h
//  contacts
//
//  Created by Admin on 11/11/16.
//  Copyright © 2016 noname. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDContact.h"

@interface EditContactViewController : UIViewController

- (void) setEditorWithContact:(CDContact* _Nullable)contact; //TODO: modify signature to pass something
//this controller could use saving context (for true edits) and addContactWith(...) for new contacts

@end
