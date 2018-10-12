//
//  ViewController.m
//  extension1
//
//  Created by Amine Magma on 12/10/2018.
//  Copyright © 2018 Amine Magma. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController (){
    MKMapView *map;
    NSMutableArray *mapItems;
    MKCompassButton *compass;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(48.8534, 2.3488)];
    MKMapItem *items = [[MKMapItem alloc] initWithPlacemark:placemark];
  
    [items setName:@"Paris au france"];
    [items setTimeZone:[NSTimeZone timeZoneWithName:[NSTimeZone localTimeZone].name]];
     mapItems  = [NSMutableArray arrayWithObjects:items, nil];
    placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(45.750000, 4.850000)];
    items = [[MKMapItem alloc] initWithPlacemark:placemark];
    [items setName:@"ville lyon"];
    [mapItems addObject:items];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSValue valueWithMKCoordinateSpan:MKCoordinateSpanMake(0.035, 0.035)],MKLaunchOptionsMapSpanKey,[NSNumber numberWithInt:1],MKLaunchOptionsMapTypeKey,MKLaunchOptionsDirectionsModeWalking,MKLaunchOptionsDirectionsModeKey, nil];
    if (![MKMapItem openMapsWithItems:mapItems launchOptions:dic]){
        NSLog(@"error launching map");
    }
    
}


@end
