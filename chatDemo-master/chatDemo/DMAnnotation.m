//
//  DMAnnotation.m
//  chatDemo
//
//  Created by CS121 on 3/3/14.
//  Copyright (c) 2014 Cognoscens. All rights reserved.
//

#import "DMAnnotation.h"

@implementation Annotation

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [self setTitle:nil];
    [self setSubtitle:nil];
}

#pragma mark -
#pragma mark Getters and setters

- (NSString *)title {
    return _title;
}

- (NSString *)subtitle {
    return _subtitle;
}

- (void)setTitle:(NSString *)title {
    self.title = title;
}

- (void)setSubtitle:(NSString *)subtitle {
    self.subtitle = subtitle;
}

- (CLLocationCoordinate2D)coordinate {
    return _coordinate;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    _coordinate = newCoordinate;
}

@end
