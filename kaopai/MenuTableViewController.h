//
//  MenuTableViewController.h
//  kaopai
//
//  Created by skycass_may on 8/30/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewController : UITableViewController
@property (nonatomic,assign) BOOL slideOutAnimationEnabled;
@property(nonatomic,strong) NSMutableArray *Category;

@end
