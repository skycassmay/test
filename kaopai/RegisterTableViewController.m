//
//  RegisterTableViewController.m
//  kaopai
//
//  Created by skycass_may on 8/30/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "RegisterTableViewController.h"

@interface RegisterTableViewController ()


@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@end

@implementation RegisterTableViewController
-(void)setup{
    [self.navigationController setNavigationBarHidden:NO];
    
}
- (IBAction)regisEvent:(UIButton *)sender {
    [self.view endEditing:YES];
    Users *user = [[Users alloc] init];
    [user regis:[self.usernameTextField text] member_email:[self.emailTextField text] member_password:[self.passwordTextField text] member_mobile:[self.mobileTextField text] member_address:[self.addressTextField text] completion:^(id success) {
        [self completionRegis:success];
    }];
}

-(void)completionRegis:(id)success{
         NSLog(@"regis:%@",success);
    
    if (success!=nil) {
        
        if ([success[@"status"] isEqualToString:@"true"])
            
        {
            [self performSegueWithIdentifier:@"RegisViewToLoginView" sender:self];
        } else {
            [self alertViewTile:@"" withMSG:@"ไม่สามารถสมัครสมาชิกได้"];
        }
    }
}
- (void)alertViewTile:(NSString *)tile withMSG:(NSString *)msg {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:tile
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"ตกลง"
                                              otherButtonTitles:nil];
    [alertView show];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
