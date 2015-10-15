//
//  Categorys.h
//  kaopai
//
//  Created by skycass_may on 9/19/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Categorys : NSObject
+ (NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation;
@end
