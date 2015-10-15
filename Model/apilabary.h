//
//  apilabary.h
//  kaopai
//
//  Created by skycass_may on 9/19/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface apilabary : NSObject
+ (void)sendRequest:(NSDictionary *)data
              toUrl:(NSString *)url
         completion:(void(^)(id success))completion;
@end
