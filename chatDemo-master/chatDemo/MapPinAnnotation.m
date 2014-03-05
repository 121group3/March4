//
//  MapPinAnnotation.m
//  chatDemo
//
//  Created by CS121 on 3/4/14.
//  Copyright (c) 2014 Cognoscens. All rights reserved.
//

#import "MapPinAnnotation.h"

@implementation MapPinAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location
                placeName:(NSString *)placeName
              description:(NSString *)description;
{
    self = [super init];
    if (self)
    {
        coordinate = location;
        title = placeName;
        subtitle = description;
    }
    
    return self;
}

@end
