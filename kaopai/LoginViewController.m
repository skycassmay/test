
//  LoginViewController.m
//  kaopai
//
//  Created by skycass_may on 8/30/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "LoginViewController.h"
#import "EditProfileTableViewController.h"
#import  <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "Categorys.h"

@interface LoginViewController ()
{
    NSString *fbID;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookEvent:(id)sender {
    [self signInWithFB];
}



// login with facebook//

-(void)signInWithFB {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc]init];
    [login logOut];
    [login logInWithReadPermissions:@[@"public_profile",@"email",@"user_friends"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error){
            
        } else if (result.isCancelled){
            // Handle cancellations
            
        } else {
            FBSDKGraphRequest *fbRequest = [[FBSDKGraphRequest alloc]
                                            initWithGraphPath:@"me" parameters:nil];
            [fbRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,id result,NSError *error){
                if(error){
                    
                }else {
                    NSLog(@"result Facebook :%@",result);
                    fbID = result[@"id"];
                    //http://graph.facebook.com/\(userID)/picture?type=large
                    [self performSegueWithIdentifier:@"EditProfileTableViewController" sender:self];
                }
                
            }];
        }
    }];
    
}
- (IBAction)signInEvent:(UIButton *)sender {
    [self.view endEditing:YES];
    
    Users *user = [[Users alloc] init];
    [user signin:[self.userNameTextField text] password:[self.passwordTextField text] completion:^(id success) {
        NSLog(@"success :%@", success);
        [self completionSignIn:success];
    }];
}
//ส่งค่าไป editprofile

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"EditProfileTableViewController"]) {
        EditProfileTableViewController *de = [segue destinationViewController];
        de.fbID = fbID;
    }
}


//ถ้ามันได้ข้อความจะส่งกลับ ถ้าถูก ส่ง true ไป ถ้าผิด ส่ง false
- (void)completionSignIn:(id)success {
    NSLog(@"signInEvent :%@",success);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:success[@"message"]
                                                   delegate:self
                                          cancelButtonTitle:@"ตกลง"
                                          otherButtonTitles:nil];
    [alert show];
    
    if ([success[@"status"] isEqualToString:@"true"]) {
        
        [self performSegueWithIdentifier:@"loginViewTohomeView" sender:self];
    } else {
        [self alertViewTile:@"" withMSG:@"ข้อมูลไม่ถูกต้อง"];
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
@end
