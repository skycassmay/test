//
//  MenuTableViewController.m
//  kaopai
//
//  Created by skycass_may on 8/30/2558 BE.
//  Copyright (c) 2558 skycass_may. All rights reserved.
//

#import "MenuTableViewController.h"

#import "SlideNavigationContorllerAnimator.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"


@interface MenuTableViewController ()

@end

@implementation MenuTableViewController
-(id)initWithCoder:(NSCoder *)aDecoder{
    self.slideOutAnimationEnabled = YES;
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *maninStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                              bundle:nil];
    UIViewController *vc;
    NSLog(@"indexPath.row :%lo",indexPath.row);
    switch(indexPath.row){
            case 0:
                //status
            vc = [maninStoryboard instantiateViewControllerWithIdentifier:@"statusViewController"];
            break;
            
            case 1:
           vc = [maninStoryboard instantiateViewControllerWithIdentifier:@"CategoryTableViewController"];
            break;
            
            case 2:
            vc = [maninStoryboard instantiateViewControllerWithIdentifier:@"SaleTableViewController"];
            break;

            
            case 3:
             vc = [maninStoryboard instantiateViewControllerWithIdentifier:@"ReturnPurchaseTableViewController"];
            
            break;
            
            case 4:
            vc =[maninStoryboard instantiateViewControllerWithIdentifier:@"EditProfileTableViewController"];
            
            break;
            
            case 5:
            
            vc =[maninStoryboard instantiateViewControllerWithIdentifier:@"ContactViewController"];

            break;
            
            case 6:
            break;

        default:
            {
        
            //back to sing in
            UIViewController *vc = [maninStoryboard instantiateViewControllerWithIdentifier:@"SignInNevigationController"];
            [[SlideNavigationController sharedInstance]presentViewController:vc
                                                                    animated:YES
                                                                  completion:nil];
            }
                //singout
            
            //[[SlideNavigationController sharedInstance]popToRootViewControllerAnimated:YES];
            break;
    }
    if(indexPath.row != 6) {
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc withSlideOutAnimation:self.slideOutAnimationEnabled andCompletion:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}






@end
