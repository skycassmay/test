//
//  Product.h
//  kaopai
//
//  Created by skycass_may on 10/5/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "apilabary.h"

typedef void (^CompletionBlock_t)(id responseObject);
typedef void (^SuccessBlock_t)(id model);
typedef void (^FailurBlock_t)(NSError *error);

@interface Product : NSObject

@property (nonatomic, copy) CompletionBlock_t completionBlock;
@property (nonatomic, copy) SuccessBlock_t successBlock_t;
@property (nonatomic,copy) FailurBlock_t failurBlock;

-(void) Saleproduct:(NSString *)product_name product_detail:(NSString *)product_detail product_price:
(NSString *)product_price cat_id: (NSString *)cat_id completion:(void(^)(id success))completion;

@end