//
//  Categorys.m
//  kaopai
//
//  Created by skycass_may on 9/19/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "Categorys.h"

@implementation Categorys


+ (NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    // Be careful here. You add this as a category to NSDictionary
    // but you get an id back, which means that result
    // might be an NSArray as well!
    if (error != nil) return nil;
    return result;
}
@end
