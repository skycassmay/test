//
//  MemberViewProductTableViewController.m
//  kaopai
//
//  Created by skycass_may on 10/5/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "MemberViewProductTableViewController.h"

@interface MemberViewProductTableViewController ()

@end

@implementation MemberViewProductTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //เปลี่ยนรูปโปรไฟล์เป็นทรงกลม
    self.profileimage.layer.cornerRadius = _profileimage.frame.size.width / 2.0;
    self.profileimage.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}



@end
