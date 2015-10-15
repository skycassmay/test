//
//  Users.m
//  kaopai
//
//  Created by skycass_may on 9/19/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "Users.h"

NSString * const APIURL = @"http://igiveu.net/kaopai/Json";
@implementation Users
- (void)signin:(NSString *)username password:(NSString *)password completion:(void(^)(id success))completion
{
    NSDictionary *item = @{@"email":username, @"pass":password};
    [apilabary sendRequest:item toUrl:[NSString stringWithFormat:@"%@%@",APIURL,@"/json_login.php"] completion:^(id success) {
        completion(success);
    }];
}

-(void)regis:(NSString *)member_name member_email:(NSString *)member_email member_password:(NSString *)member_password member_mobile :(NSString *)member_mobile member_address:(NSString *)member_address  completion:(void(^)(id success))completion
{
    
    NSDictionary *item = @{@"name":member_name, @"email":member_email , @"password":member_password , @"mobile":member_mobile, @"address":member_address };
    [apilabary sendRequest:item toUrl:[NSString stringWithFormat:@"%@%@",APIURL,@"/json_register.php"] completion:^(id success) {
        completion(success);
    }];
}






@end
