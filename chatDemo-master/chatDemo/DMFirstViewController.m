//
//  DMFirstViewController.m
//  chatDemo
//
//  Created by David Mendels on 4/14/12.
//  Copyright (c) 2012 Cognoscens. All rights reserved.
//

#import "DMFirstViewController.h"

@interface DMFirstViewController ()

@property (nonatomic, weak) IBOutlet UINavigationBar *navigationBar;

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@end

@implementation DMFirstViewController

// THIS IS NOT WORKING!!! the break points should be hit
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString* myIdentifier = @"myIndentifier";
    MKPinAnnotationView* pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:myIdentifier];
    
    if (!pinView) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:myIdentifier];
        pinView.pinColor = MKPinAnnotationColorGreen;
        pinView.animatesDrop = NO;
    }
    return pinView;
}
///

- (void)viewDidLoad
{

    // configure navigation bar for iOS7
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
        CGFloat height = self.navigationBar.frame.size.height + statusBarFrame.size.height;
        self.navigationBar.frame = CGRectMake(0, 0, self.navigationBar.frame.size.width, height);
    }
	
    // Create a MapView and set its delegate
    MKMapView * mapView = [[ MKMapView alloc] initWithFrame: self.view.frame];//CGRectMake(0, 20, 320, 411)];
    //mapView.delegate = self;
    
    // Set the type to standard versus sattelite
    mapView.mapType = MKMapTypeStandard;
    
    // Dont allow zooming, scrolling, or rotating but do show location
    mapView.zoomEnabled = NO;
    mapView.scrollEnabled = NO;
    mapView.rotateEnabled = NO;
    mapView.showsUserLocation = YES;
    mapView.alpha = 1;
    

    // Set the region (coordinates given for calculations)
    
    // Top left of 5Cs
        // 34.107042, -117.715497
    
    // Center of 5cs
        // 34.101108, -117.709194


    CLLocationCoordinate2D coord = {.latitude = 34.101108, .longitude = -117.709194};
    MKCoordinateSpan span = {.latitudeDelta = 0.013, .longitudeDelta =  0.013};
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion: region];
    
    // TODO: Add the rest of the important points and get colors to change
        // North: 34.106426, -117.708211
        // Hoch: 34.105752, -117.709820
        // McConnell 34.102942, -117.705504
        // Malott: 34.102859, -117.710635
        // Collins: 34.101424, -117.708984
        // Frary: 34.100401, -117.710667
        // SCC: 34.099285, -117.713421
        // Frank: 34.096108, -117.711449

    // Add a pin for North
    CLLocationCoordinate2D northCoord = {.latitude = 34.106426, .longitude = -117.708211};
    MapPinAnnotation* North =
    [[MapPinAnnotation alloc]   initWithCoordinates:northCoord
                                placeName:@"North"
                                description:@"Slabs"];
    [mapView addAnnotation:North];
    
    
    // Add a pin for the Hoch
    CLLocationCoordinate2D hochCoord = {.latitude = 34.105752, .longitude = -117.709820};
    MKPointAnnotation *hoch = [[MKPointAnnotation alloc] init];
    hoch.coordinate = hochCoord;
    [hoch setTitle:@"The Hoch"];
    //[hoch setSubtitle:@""];
    [mapView addAnnotation:hoch];
    
    
    // Add a pin for McConnell
    CLLocationCoordinate2D mcconCoord = {.latitude = 34.102942, .longitude = -117.705504};
    MKPointAnnotation *mccon = [[MKPointAnnotation alloc] init];
    mccon.coordinate = mcconCoord;
    [mccon setTitle:@"McConnell"];
    //[McConnell setSubtitle:@""];
    [mapView addAnnotation:mccon];
    
    
    // Add a pin for the Malott
    CLLocationCoordinate2D malottCoord = {.latitude = 34.102859, .longitude = -117.710635};
    MKPointAnnotation *malott = [[MKPointAnnotation alloc] init];
    malott.coordinate = malottCoord;
    [malott setTitle:@"Malott"];
    //[Malott setSubtitle:@""];
    [mapView addAnnotation:malott];
    
    
    // Add a pin for the Collins
    CLLocationCoordinate2D collinsCoord = {.latitude = 34.101424, .longitude = -117.708984};
    MKPointAnnotation *collins = [[MKPointAnnotation alloc] init];
    collins.coordinate = collinsCoord;
    [collins setTitle:@"Collins"];
    //[Collins setSubtitle:@""];
    [mapView addAnnotation:collins];
    
    
    // Add a pin for the Frary
    CLLocationCoordinate2D fraryCoord = {.latitude = 34.100401, .longitude = -117.710667};
    MKPointAnnotation *frary = [[MKPointAnnotation alloc] init];
    frary.coordinate = fraryCoord;
    [frary setTitle:@"Frary"];
    //[Frary setSubtitle:@""];
    [mapView addAnnotation:frary];
    
    // Add a pin for the SCC
    CLLocationCoordinate2D sccCord = {.latitude = 34.099285, .longitude = -117.713421};
    MKPointAnnotation *SCC = [[MKPointAnnotation alloc] init];
    SCC.coordinate = sccCord;
    [SCC setTitle:@"SCC"];
    //[SCC setSubtitle:@""];
    [mapView addAnnotation:SCC];
    
    // Add a pin for the Frank
    CLLocationCoordinate2D frankCord = {.latitude = 34.096108, .longitude = -117.711449};
    MKPointAnnotation *frank = [[MKPointAnnotation alloc] init];
    frank.coordinate = frankCord;
    [frank setTitle:@"Frank"];
    //[frank setSubtitle:@""];
    [mapView addAnnotation:frank];
    
    
    // Add mapview object as a subview to our view
    [self.myMapView addAnnotation:North];
    [self.view addSubview:mapView];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
