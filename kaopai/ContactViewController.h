//
//  ContactViewController.h
//  kaopai
//
//  Created by skycass_may on 10/14/2558 BE.
//  Copyright © 2558 skycass_may. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ContactViewController : UIViewController
{
    MKMapView *map;
}
@property (strong,nonatomic)IBOutlet MKMapView *Map;
@end
