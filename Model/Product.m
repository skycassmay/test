//
//  Product.m
//  kaopai
//
//  Created by skycass_may on 10/5/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "Product.h"

@implementation Product

-(void) Saleproduct:(NSString *)product_name product_detail:(NSString *)product_detail product_price:
(NSString *)product_price cat_id: (NSString *)cat_id completion:(void(^)(id success))completion;

{

    NSDictionary *item = @{@"name":product_name,@"detail":product_detail,@"price":product_price,@"cat":cat_id};
    [apilabary sendRequest:item toUrl:@"http://igiveu.net/kaopai/json_product.php" completion:^(id success) {
        completion(success);
    }];


}
@end
