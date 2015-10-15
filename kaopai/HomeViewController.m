//
//  HomeViewController.m
//  kaopai
//
//  Created by skycass_may on 8/30/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuTableViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
-(void)setup{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
    MenuTableViewController *leftMunu = (MenuTableViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"MenuTableViewController"];
    [SlideNavigationController sharedInstance].leftMenu = leftMunu;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.243 green:0.189 blue:0.306 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

-(BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}


@end
