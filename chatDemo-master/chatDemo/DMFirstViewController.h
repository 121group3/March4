//
//  DMFirstViewController.h
//  chatDemo
//
//  Created by David Mendels on 4/14/12.
//  Copyright (c) 2012 Cognoscens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DMAnnotation.h"
#import "MapPinAnnotation.h"

@interface DMFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet    MKMapView *myMapView;
@end
