//
//  ContactsViewController.m
//  Contacts
//
//  Created by Brigitte Michau on 2016/03/15.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;
@property (nonatomic, weak) Contact *contact;

@end

@implementation ContactsViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _contacts = [NSMutableArray array];
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString: @"toViewContact"]) {
        
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        ExistingContactViewController *controller = (ExistingContactViewController*) nav.topViewController;
        controller.contact = self.contact;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.contact = self.contacts[indexPath.row];
    [self performSegueWithIdentifier:@"toViewContact"
                              sender:self];
}

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue {
    // No action to take if user cancels
}

- (IBAction)createNewContact:(UIStoryboardSegue *)segue {
    NewContactViewController *newContactVC = segue.sourceViewController;
    NSString *firstName = newContactVC.firstNameTextField.text;
    NSString *lastName = newContactVC.lastNameTextField.text;
    
    if (firstName.length != 0 || lastName.length != 0) {
        NSString *contactName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        [self addContactToContacts:contactName];
    }
}

- (IBAction)cancelToViewExistingContact:(UIStoryboardSegue *)segue {
}

- (IBAction)updateExistingContact:(UIStoryboardSegue *)segue {
    
    ExistingContactViewController *existingContactVC = segue.sourceViewController;
    NSString *name = existingContactVC.name.text;
    Contact *existingContact = existingContactVC.contact;
    
    if (name.length != 0) {
        [self.contacts removeObjectIdenticalTo:existingContact];
        [self addContactToContacts:name];
    }
}

- (void)addContactToContacts:(NSString *)name {
    Contact *newContact = [[Contact alloc] initWithContactName: name];
    [self.contacts addObject:newContact];
    [self.tableView reloadData];
}

@end
