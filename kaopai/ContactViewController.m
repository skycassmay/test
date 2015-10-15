//
//  ContactViewController.m
//  kaopai
//
//  Created by skycass_may on 10/14/2558 BE.
//  Copyright © 2558 skycass_may. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    CLLocationCoordinate2D co;
    
    co.latitude = 13.799610;
    
    co.longitude = 100.575625;
    
    
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    
    point.coordinate = co;
    
    point.title = @"บริษัท Pay Solutions";
    
    point.subtitle=@"Pay Solutions Co.,Ltd.";
    
    [_Map addAnnotation:point];
    
    
    
    
    
}



-(MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(nonnull id<MKAnnotation>)annotation

{
    
    static NSString *annotationIdentifier = @"@PaySolution";
    
    if (aMapView !=self.Map)
        
        return nil;
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.Map dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    
    if (annotationView == nil)
        
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
    
    annotationView.canShowCallout = YES;
    
    
    
    UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    annotationView.rightCalloutAccessoryView = disclosureButton;
    
    
    
    return annotationView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
