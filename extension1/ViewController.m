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
    NSNotificationName nameNotification;
    UIButton *bt;
    
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
    [items setPhoneNumber:@"077 78 48 39"];
    mapItems  = [NSMutableArray arrayWithObjects:items, nil];
    placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(45.750000, 4.850000)];
    items = [[MKMapItem alloc] initWithPlacemark:placemark];
    [items setName:@"ville lyon"];
    [items setPhoneNumber:@"053 42 83 95"];
    [mapItems addObject:items];
    NSNotificationCenter *notif = [NSNotificationCenter defaultCenter];
     nameNotification = @"openMap";
    [notif addObserver:self selector:@selector(iDemandToOpenMap:) name:nameNotification object:nil];
    bt = [UIButton buttonWithType:UIButtonTypeSystem];
    [bt setTitle:@"Show Map" forState:UIControlStateNormal];
    [bt setFrame:CGRectMake(25, 25, 0, 0)];
    [bt sizeToFit];
    [[self view] addSubview:bt];
    [bt addTarget:self action:@selector(postNotif:) forControlEvents:UIControlEventTouchDown];
}
-(void)postNotif:(UIButton *)sender{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSValue valueWithMKCoordinateSpan:MKCoordinateSpanMake(0.035, 0.035)],MKLaunchOptionsMapSpanKey,[NSNumber numberWithInt:2],MKLaunchOptionsMapTypeKey,MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsDirectionsModeKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:nameNotification object:dic];
}
-(void)iDemandToOpenMap:(NSNotification*)notif{
    if ([[notif name] isEqualToString:@"openMap"]) {
        if ([[notif object] isKindOfClass:[NSDictionary class]]) {
            dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0);
            dispatch_sync(queue, ^{
                NSDictionary *launchOptions = [notif object];
                [self->bt setTitle:@"Good" forState:UIControlStateNormal];
                if (![MKMapItem openMapsWithItems:self->mapItems launchOptions:launchOptions]){
                    NSLog(@"error launching map");
                    [self->bt setTitle:@"error" forState:UIControlStateNormal];
                   
                }
            });
            
        }
    }
}

@end
