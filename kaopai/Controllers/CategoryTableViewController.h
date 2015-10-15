//
//  CategoryTableViewController.h
//  kaopai
//
//  Created by Aoymii on 4/9/58.
//  Copyright (c) พ.ศ. 2558 skycass_may. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTableViewController : UITableViewController
<UITableViewDataSource,UITabBarDelegate>
@property (strong,nonatomic)NSMutableArray *Category;


@end
