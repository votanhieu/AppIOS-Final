//
//  MapViewController.m
//  Final
//
//  Created by RUN on 4/3/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import "MapViewController.h"
#import "MapAnnotation.h"
#import "AddStudentViewController.h"

@interface MapViewController ()
@end

@implementation MapViewController
@synthesize address, mapView;

-(void)viewDidLoad {
    [self initMapView];
    [self initNavigation];
    
}

#pragma mark -START INIT
-(void)initNavigation{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, self.view.bounds.size.width, 80)];
    fromLabel.text = @"Detail Student";
    
    UIImageView *imgMenu = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 20, 20)];
    [imgMenu setImage:[UIImage imageNamed:@"back.png"]];
    [imgMenu setContentMode:UIViewContentModeScaleAspectFit];
    [imgMenu setUserInteractionEnabled:YES];
    UITapGestureRecognizer *onClickBackImage =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBackImage:)];
    [onClickBackImage setNumberOfTapsRequired:1];
    [imgMenu addGestureRecognizer:onClickBackImage];
    
    
    
    UIImageView *imgEdit = [[UIImageView alloc]initWithFrame:CGRectMake(350, 50, 20, 20)];
    [imgEdit setImage:[UIImage imageNamed:@"delete.png"]];
    [imgEdit setContentMode:UIViewContentModeScaleAspectFit];
    [imgEdit setUserInteractionEnabled:YES];
    UITapGestureRecognizer *onClickDeleteImage =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickDeleteImage:)];
    [onClickDeleteImage setNumberOfTapsRequired:1];
    [imgEdit addGestureRecognizer:onClickDeleteImage];
    
    [view addSubview:fromLabel];
    [view addSubview:imgMenu];
    [view addSubview:imgEdit];
    [self.view addSubview:view];
}
-(void)initMapView{
    [super viewDidLoad];
    
    mapView = [[MKMapView alloc]initWithFrame:
               CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mapView.delegate = self;
    mapView.centerCoordinate = CLLocationCoordinate2DMake(37.32, -122.03);
    mapView.mapType = MKMapTypeHybrid;
    
    CLLocationCoordinate2D location;
    location.latitude = (double) 37.332768;
    location.longitude = (double) -122.030039;
    
    // Add the annotation to our map view
    MapAnnotation *testAnnotation = [[MapAnnotation alloc]
                                     initWithTitle:@"Apple Head quaters" andCoordinate:location];
    [mapView addAnnotation:testAnnotation];
    [self.view addSubview:mapView];
    
    
    /// get location to textfield in addstudentview
    [self getLocation:location.latitude longitude:location.longitude];
    
    // onclick get location to update annotaion pin on map
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(longpressToGetLocation:)];
    lpgr.minimumPressDuration = 1.0;  //user must press for 2 seconds
    [mapView addGestureRecognizer:lpgr];
    
}
-(void)getLocation:(double)latitude longitude:(double)longitude{
    CLGeocoder *geocoder = [CLGeocoder new];
    CLLocation *newLocation = [[CLLocation alloc]initWithLatitude:latitude
                                                        longitude:longitude];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks, NSError *error) {
                       
                       if (error) {
                           NSLog(@"Geocode failed with error: %@", error);
                           return; // Request failed, log error
                       }
                       
                       // Check if any placemarks were found
                       if (placemarks && placemarks.count > 0)
                       {
                           CLPlacemark *placemark = placemarks[0];
                           self.address = placemark.country;
                           NSLog(@"placemark:%@, %@, %@",placemark.country, placemark.locality,placemark.administrativeArea);
                       }
                       
                   }];
}
-(void)longpressToGetLocation:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D location =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    NSLog(@"Location found from Map: %f %f",location.latitude,location.longitude);
    
    MapAnnotation *newAnnotation = [[MapAnnotation alloc]
                                    initWithTitle:@"My location" andCoordinate:location];
    [mapView addAnnotation:newAnnotation];
    [self.view addSubview:mapView];
    [self getLocation:location.latitude longitude:location.longitude];
    [self initNavigation];
}

-(void)moveToAddStudentView:(NSString *)address{
    AddStudentViewController *vc =[[AddStudentViewController alloc]initWithAddress:address];
    [self presentViewController:vc animated:NO completion:nil];
}
#pragma mark -START MAP INIT
// When a map annotation point is added, zoom to it (1500 range)
-(void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance
    ([mp coordinate], 1500, 1500);
    [mv setRegion:region animated:YES];
    [mv selectAnnotation:mp animated:YES];
}

#pragma mark -BUTTON NAVIGATION
-(void)onClickBackImage:(UIGestureRecognizer *)recognizer {
    [self moveToAddStudentView:address];
}

-(void)onClickDeleteImage:(UIGestureRecognizer *)recognizer {
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
