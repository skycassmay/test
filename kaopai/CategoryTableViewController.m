//
//  CategoryTableViewController.m
//  kaopai
//
//  Created by Aoymii on 13/9/58.
//  Copyright (c) พ.ศ. 2558 skycass_may. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "Categorys.h"


@interface CategoryTableViewController ()
{
    NSMutableArray *categorys;
}
@end

@implementation CategoryTableViewController

- (void)setup {
    
    NSLog(@"TEST :%@",[Categorys dictionaryWithContentsOfJSONString:@"Category.json"]);
    categorys = [[NSMutableArray alloc] init];
    categorys = [[Categorys dictionaryWithContentsOfJSONString:@"Category.json"] copy];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [categorys count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [[cell textLabel] setText:categorys[indexPath.row][@"cat_nameTH"]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:NO];

    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:15.0],NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.243 green:0.189 blue:0.306 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    

    
}


@end
