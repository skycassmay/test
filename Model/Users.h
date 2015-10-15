//
//  Users.h
//  kaopai
//
//  Created by skycass_may on 9/19/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "apilabary.h"

typedef void (^CompletionBlock_t)(id responseObject);
typedef void (^SuccessBlock_t)(id model);
typedef void (^FailurBlock_t)(NSError *error);

@interface Users : NSObject
@property (nonatomic, copy) CompletionBlock_t completionBlock;
@property (nonatomic, copy) SuccessBlock_t successBlock_t;
@property (nonatomic, copy) FailurBlock_t failurBlock;

- (void)signin:(NSString *)username password:(NSString *)password completion:(void(^)(id success))completion;

-(void)regis:(NSString *)member_name member_email:(NSString *)member_email member_password:(NSString *)member_password member_mobile :(NSString *)member_mobile member_address:(NSString *)member_address  completion:(void(^)(id success))completion;

@end
