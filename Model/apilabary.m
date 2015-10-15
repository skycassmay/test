//
//  apilabary.m
//  kaopai
//
//  Created by skycass_may on 9/19/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "apilabary.h"


@implementation apilabary
+ (void)sendRequest:(NSDictionary *)data
             toUrl:(NSString *)url
        completion:(void(^)(id success))completion
{
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:url
      parameters:data
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             completion(responseObject);
         } failure:^(AFHTTPRequestOperation *operation,NSError *error){
             completion(error);
         }];
}

@end
