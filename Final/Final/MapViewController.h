//
//  MapViewController.h
//  Final
//
//  Created by RUN on 4/3/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController<MKMapViewDelegate>
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) NSString *address;
@end

NS_ASSUME_NONNULL_END
